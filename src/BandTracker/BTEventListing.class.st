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

{ #category : #rendering }
BTEventListing >> renderContentOn: html [
	self zipCode isNil
		ifTrue: [ html text: 'No data yet.' ]
		ifFalse: [ self renderEventsListOn: html ]
]

{ #category : #rendering }
BTEventListing >> renderEventsListOn: html [
	html text: 'Events go here'
]

{ #category : #accessing }
BTEventListing >> zipCode [
	^ self session zipCode
]
