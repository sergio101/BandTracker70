Class {
	#name : #BTPublicComponent,
	#superclass : #BTScreenComponent,
	#instVars : [
		'searchForm',
		'eventListing'
	],
	#category : #'BandTracker-web'
}

{ #category : #initialization }
BTPublicComponent >> children [
	^ {searchForm . eventListing  }
]

{ #category : #initialization }
BTPublicComponent >> initialize [
	super initialize.
	searchForm := BTSearchFormComponent new.
	eventListing := BTEventListing new.
]

{ #category : #rendering }
BTPublicComponent >> renderContentOn: html [
	super renderContentOn: html.
	html
		tbsContainer: [ html tbsRow
				showGrid;
				with: [ html render: searchForm ] ].
	html
		tbsContainer: [ html tbsRow
				showGrid;
				with: [ html render: eventListing ] ].
			self renderGoogleAnalyticsCodeOn: html.
]

{ #category : #rendering }
BTPublicComponent >> renderGoogleAnalyticsCodeOn: html [
	html script
		attributeAt: #async put: true;
		attributeAt: #src
			put: 'https://www.googletagmanager.com/gtag/js?id=UA-135236852-1'.
	html script: 'window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag(''js'', new Date());

  gtag(''config'', ''UA-135236852-1'');'
]
