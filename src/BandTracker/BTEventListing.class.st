Class {
	#name : #BTEventListing,
	#superclass : #WAComponent,
	#instVars : [
		'events'
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
