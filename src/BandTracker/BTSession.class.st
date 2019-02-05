Class {
	#name : #BTSession,
	#superclass : #WASession,
	#instVars : [
		'appBrain',
		'announcer',
		'zipCode',
		'distance'
	],
	#category : #'BandTracker-web'
}

{ #category : #accessing }
BTSession >> announcer [
	^ announcer ifNil: [announcer := Announcer new]
]

{ #category : #accessing }
BTSession >> appBrain [
	^ appBrain
]

{ #category : #initialization }
BTSession >> initialize [
	super initialize .
	appBrain := BTApplicationBrain new.
]

{ #category : #accessing }
BTSession >> zipCode [
	^ zipCode
]

{ #category : #accessing }
BTSession >> zipCode: anObject [
	zipCode := anObject
]
