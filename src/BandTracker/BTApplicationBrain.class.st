Class {
	#name : #BTApplicationBrain,
	#superclass : #Object,
	#instVars : [
		'zipCode',
		'distance',
		'searchParams',
		'station',
		'observers'
	],
	#category : #'BandTracker-web'
}

{ #category : #adding }
BTApplicationBrain >> addObserver: anObserver [
	observers add: anObserver.
]

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
	super initialize.
	self searchParams: Dictionary new.
	observers := OrderedCollection new.
]

{ #category : #adding }
BTApplicationBrain >> notifyObservers [ 
observers do: [ :each | each notify ]
]

{ #category : #accessing }
BTApplicationBrain >> observers [
	^ observers
]

{ #category : #accessing }
BTApplicationBrain >> observers: anObject [
	observers := anObject
]

{ #category : #adding }
BTApplicationBrain >> removeObservers: anObserver [
	observers remove: anObserver 
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
