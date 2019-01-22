Class {
	#name : #BTSession,
	#superclass : #WASession,
	#instVars : [
		'searchData'
	],
	#category : #'BandTracker-web'
}

{ #category : #'as yet unclassified' }
BTSession >> distance [
	^ searchData at: 'distance' ifAbsent: [ nil ]
]

{ #category : #initialization }
BTSession >> initialize [
	super initialize .
	searchData := Dictionary new
]

{ #category : #accessing }
BTSession >> searchData [
	^ searchData
]

{ #category : #accessing }
BTSession >> searchData: anObject [
	searchData := anObject
]

{ #category : #'as yet unclassified' }
BTSession >> zipcode [
	^ searchData at: 'zipcode' ifAbsent: [ nil ]
]
