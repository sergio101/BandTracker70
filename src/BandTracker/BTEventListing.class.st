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
		ifTrue: [ html text: 'No data yet.' ]
		ifFalse: [ self renderEventsListOn: html ]
]

{ #category : #rendering }
BTEventListing >> renderEventsListOn: html [
	| headerBlock tableBlock |
	headerBlock := [ html tableHeading: 'Date'.
	html tableHeading: 'Artist'.
	html tableHeading: 'Venue'.
	html tableHeading: 'Lineup' ].
	tableBlock := [ html tableHead: headerBlock.
	html
		tableBody: [ self eventsAsRows
				do: [ :row | html tableRow: [ row do: [ :col | html tableData: col ] ] ] ] ].
	html heading
		level: 2;
		with: 'Concert Results'.
	html tbsTable
		beStriped;
		with: tableBlock
]

{ #category : #accessing }
BTEventListing >> zipCode [
	^ self session zipCode
]
