Class {
	#name : #BTEventListing,
	#superclass : #WAComponent,
	#category : #'BandTracker-web'
}

{ #category : #accessing }
BTEventListing >> distance [
	^ self session appBrain distance.
]

{ #category : #accessing }
BTEventListing >> events [
	^ (BTUserInterface
		retrieveResultsByZipCode: self zipCode
		andDistance: self distance) asSortedCollection: [ :a :b | a date < b date ]
]

{ #category : #rendering }
BTEventListing >> renderContentOn: html [
	self zipCode isNil
		ifFalse: [ self renderEventsListOn: html ]
]

{ #category : #rendering }
BTEventListing >> renderErrorOn: html [
html heading
				level: 3;
				with:
					'So sorry, there were no results for your search. Try increasing the distance.'
]

{ #category : #rendering }
BTEventListing >> renderEvent: event on: html [
	html
		tableRow: [ html tableData: [ self renderOffersFor: event on:  html ].
			html tableData: (event date asDate printFormat: #(3 2 1 $/ 1 1 2)).
			html tableData: event artist artistName.
			html tableData: event venueString.
			html tableData: (event lineupString truncate: 40) ]
]

{ #category : #'rendering-parts' }
BTEventListing >> renderEventsListOn: html [
	| tableBlock |
	self events isNotEmpty
		ifTrue: [ tableBlock := [  self renderHeaderBlock: html.self renderEventsRowsOn: html ].
			html heading
				level: 2;
				with: 'Concert Results'.
			html tbsTable
				beStriped;
				with: tableBlock ]
		ifFalse: [ self renderErrorOn: html ]
]

{ #category : #rendering }
BTEventListing >> renderEventsRowsOn: html [
	html
		tableBody: [ self events do: [ :e |  self renderEvent: e on: html  ] ]
]

{ #category : #rendering }
BTEventListing >> renderFontAwesome: fontAwesomeClass on: html [

(html tag: 'i') class: fontAwesomeClass .
]

{ #category : #'as yet unclassified' }
BTEventListing >> renderHeaderBlock: html [
	| headers |
	headers := #('Offers' 'Date' 'Artist' 'Venue' 'Lineup').
	html tableHead: [ headers do: [ :h | html tableHeading: h ] ]
]

{ #category : #rendering }
BTEventListing >> renderOffersFor: event on: html [
	| link |
	link := event getOfferLink: 'Tickets'.
	link
		ifNotNil: [ html anchor
				url: link;
				target: '_blank';
				with: [ self renderFontAwesome: 'fa fa-ticket-alt' on: html ] ]
]

{ #category : #rendering }
BTEventListing >> renderOffersOn: html [ 
	self renderFontAwesome: 'fa fa-ticket-alt' on: html.
]

{ #category : #accessing }
BTEventListing >> zipCode [
	^ self session zipCode
]
