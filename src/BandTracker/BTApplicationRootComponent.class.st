Class {
	#name : #BTApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'BandTracker-web'
}

{ #category : #testing }
BTApplicationRootComponent class >> canBeRoot [
^  true
]

{ #category : #'as yet unclassified' }
BTApplicationRootComponent class >> initialize [
	"self initialize"

	| app |
	app := WAAdmin register: self asApplicationAt: 'BandTracker'.
	app preferenceAt: #sessionClass put: BTSession.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary.
]

{ #category : #hooks }
BTApplicationRootComponent >> children [
^ { main }
]

{ #category : #initialization }
BTApplicationRootComponent >> initialize [
	super initialize.
	main := BTPublicComponent new.
	
]

{ #category : #accessing }
BTApplicationRootComponent >> main: anObject [
	main := anObject
]

{ #category : #rendering }
BTApplicationRootComponent >> renderContentOn: html [
	html render: main.
]

{ #category : #rendering }
BTApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Band Tracker'.
	anHtmlRoot script url: 'https://code.jquery.com/jquery-2.2.4.min.js'.
	anHtmlRoot script
		url:
			'https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.js'.
	anHtmlRoot stylesheet
		url: 'https://use.fontawesome.com/releases/v5.7.2/css/all.css';
		attributeAt: 'integrity'
			put:
			'sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr';
		attributeAt: 'crossorigin' put: 'anonymous'.
		anHtmlRoot stylesheet url: '//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css'.
		anHtmlRoot script url: '//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js'.
]
