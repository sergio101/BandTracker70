Class {
	#name : #BTPublicComponent,
	#superclass : #BTScreenComponent,
	#instVars : [
		'searchForm',
		'eventListing'
	],
	#category : #'BandTracker-web'
}

{ #category : #initialization }
BTPublicComponent >> children [
	^ {searchForm . eventListing  }
]

{ #category : #initialization }
BTPublicComponent >> initialize [
	super initialize.
	searchForm := BTSearchFormComponent new.
	eventListing := BTEventListing new.
]

{ #category : #rendering }
BTPublicComponent >> renderContentOn: html [
	super renderContentOn: html.
	html
		tbsContainer: [ html tbsRow
				showGrid;
				with: [ html render: searchForm ] ].
	self session zipCode isNil
		ifFalse: [ html
				tbsContainer: [ html tbsRow
						showGrid;
						with: [ html render: eventListing ] ] ]
]
