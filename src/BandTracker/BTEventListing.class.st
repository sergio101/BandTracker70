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
	 	^ BTUserInterface
		retrieveResultsByZipCode: self zipCode
		andDistance: self distance
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
	tableBlock := [ html tableHead: headerBlock ].
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
