Class {
	#name : #BTSession,
	#superclass : #WASession,
	#instVars : [
		'appBrain'
	],
	#category : #'BandTracker-web'
}

{ #category : #accessing }
BTSession >> appBrain [
	^ appBrain
]

{ #category : #initialization }
BTSession >> initialize [
	super initialize .
	appBrain := ApplicationBrain new.
]
