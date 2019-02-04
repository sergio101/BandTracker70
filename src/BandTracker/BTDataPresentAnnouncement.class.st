Class {
	#name : #BTDataPresentAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'zipCode'
	],
	#category : #'BandTracker-web'
}

{ #category : #accessing }
BTDataPresentAnnouncement >> zipCode [
	^ zipCode
]

{ #category : #accessing }
BTDataPresentAnnouncement >> zipCode: anObject [
	zipCode := anObject
]
