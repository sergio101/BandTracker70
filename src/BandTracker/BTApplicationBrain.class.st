Class {
	#name : #BTApplicationBrain,
	#superclass : #Object,
	#instVars : [
		'zipCode',
		'distance',
		'searchParams',
		'station'
	],
	#category : #'BandTracker-web'
}

{ #category : #accessing }
BTApplicationBrain >> distance [
	^ distance 
]

{ #category : #accessing }
BTApplicationBrain >> distance: anObject [
	distance := anObject 
]

{ #category : #initialization }
BTApplicationBrain >> initialize [ 
	super initialize .
	self searchParams: Dictionary new.
]

{ #category : #accessing }
BTApplicationBrain >> searchParams [
	^ searchParams
]

{ #category : #accessing }
BTApplicationBrain >> searchParams: anObject [
	searchParams := anObject
]

{ #category : #accessing }
BTApplicationBrain >> station [
	^ station
]

{ #category : #accessing }
BTApplicationBrain >> station: anObject [
	station := anObject
]

{ #category : #accessing }
BTApplicationBrain >> zipCode [
	^ zipCode 
]

{ #category : #accessing }
BTApplicationBrain >> zipCode: anObject [
	zipCode := anObject
]
