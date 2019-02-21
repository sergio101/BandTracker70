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

{ #category : #'as yet unclassified' }
BTEventListing >> eventsAsRows [
	| result |
	result := self events
		collect: [ :event | 
			Array
				with: (event date asDate printFormat:  #(3 2 1 $/ 1 1 2))
				with: event artist artistName
				with: event venueString
				with: (event lineupString truncate: 40) ].
	^ result
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
html tableRow: [  
	html tableData: (event date asDate printFormat: #(3 2 1 $/ 1 1 2)).
	html tableData: event artist artistName.
	html tableData: event venueString.
	html tableData: (event lineupString truncate: 40)]
]

{ #category : #'rendering-parts' }
BTEventListing >> renderEventsListOn: html [
	| tableBlock |
	self events isNotEmpty
		ifTrue: [ tableBlock := [ self renderHeaderBlock: html.
				self renderEventsRowsOn: html.
 ].
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

{ #category : #'as yet unclassified' }
BTEventListing >> renderHeaderBlock: html [
	^ html
		tableHead: [
			html tableHeading: 'Date'.
			html tableHeading: 'Artist'.
			html tableHeading: 'Venue'.
			html tableHeading: 'Lineup' ]
]

{ #category : #accessing }
BTEventListing >> zipCode [
	^ self session zipCode
]
