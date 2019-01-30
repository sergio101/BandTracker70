Class {
	#name : #BTEventListing,
	#superclass : #WAComponent,
	#instVars : [
		'events',
		'observable'
	],
	#category : #'BandTracker-web'
}

{ #category : #accessing }
BTEventListing >> events [
	^ events
]

{ #category : #accessing }
BTEventListing >> events: anObject [
	events := anObject
]

{ #category : #accessing }
BTEventListing >> notify [
	Transcript show: 'the thing was changed.'
]

{ #category : #accessing }
BTEventListing >> observable [
	^ observable
]

{ #category : #accessing }
BTEventListing >> observable: anObject [
	observable := anObject
]
