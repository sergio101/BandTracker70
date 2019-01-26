Class {
	#name : #ApplicationBrain,
	#superclass : #Object,
	#instVars : [
		'zipCode',
		'distance',
		'searchParams',
		'station'
	],
	#category : #'BandTracker-core'
}

{ #category : #accessing }
ApplicationBrain >> distance [
	^ self searchParams at: 'distance' ifAbsent: nil.
]

{ #category : #accessing }
ApplicationBrain >> distance: anObject [
	| rawDistance |
	rawDistance := self parseDistance: anObject.
	self searchParams at: 'distance' put: rawDistance.
	distance := rawDistance .
]

{ #category : #initialization }
ApplicationBrain >> initialize [ 
	super initialize .
	self searchParams: Dictionary new.
]

{ #category : #parsing }
ApplicationBrain >> parseDistance: aString [
^ (aString splitOn: ' ') first asInteger
]

{ #category : #accessing }
ApplicationBrain >> searchParams [
	^ searchParams
]

{ #category : #accessing }
ApplicationBrain >> searchParams: anObject [
	searchParams := anObject
]

{ #category : #accessing }
ApplicationBrain >> station [
	^ station
]

{ #category : #accessing }
ApplicationBrain >> station: anObject [
	station := anObject
]

{ #category : #accessing }
ApplicationBrain >> zipCode [
	^ zipCode 
]

{ #category : #accessing }
ApplicationBrain >> zipCode: anObject [
	zipCode := anObject
]
