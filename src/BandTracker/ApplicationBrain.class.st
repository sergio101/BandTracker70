Class {
	#name : #ApplicationBrain,
	#superclass : #Object,
	#instVars : [
		'zipCode',
		'distance',
		'searchParams'
	],
	#category : #'BandTracker-core'
}

{ #category : #accessing }
ApplicationBrain >> distance [
	^ distance
]

{ #category : #accessing }
ApplicationBrain >> distance: anObject [
	distance := anObject
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
ApplicationBrain >> zipCode [
	^ zipCode
]

{ #category : #accessing }
ApplicationBrain >> zipCode: anObject [
	zipCode := anObject
]
