Class {
	#name : #BTSearchFormComponent,
	#superclass : #WAComponent,
	#instVars : [
		'stationList',
		'distanceList',
		'searchParams'
	],
	#category : #'BandTracker-web'
}

{ #category : #'as yet unclassified' }
BTSearchFormComponent >> getResults [
	
	
]

{ #category : #initialization }
BTSearchFormComponent >> initialize [
	| distances |
	super initialize.
	self session appBrain inspect.
	stationList := Station stations collect: [ :e | e stationName ].
	distances := #(25 50 75 100).
	distanceList := distances collect: [ :e | e asString , ' Miles' ]
]

{ #category : #'as yet unclassified' }
BTSearchFormComponent >> parseDistance [
	^ (searchParams at: 'distance') splitOn: ' ' first asInteger
]

{ #category : #rendering }
BTSearchFormComponent >> renderContentOn: html [
	html tbsForm
		beInline;
		with: [ self renderStationSelect: html.
			self renderZipCodeEntry: html.
			self renderDistanceSelect: html.
			self renderSubmitButtonOn: html. ]
]

{ #category : #rendering }
BTSearchFormComponent >> renderDistanceSelect: html [
	^ html
		tbsFormGroup: [ html label
				for: 'selectDistance';
				class: 'sr-only';
				with: 'Select Channel'.
			html
				tbsFormGroup: [ html select
						list: distanceList;
						id: 'selectDistance';
						class: 'form-control';
						selected: self session appBrain distance;
						callback: [ :value | (self session appBrain) distance: value ] ].
			html space ]
]

{ #category : #rendering }
BTSearchFormComponent >> renderStationSelect: html [
	^ html
		tbsFormGroup: [ html label
				for: 'selectStation';
				class: 'sr-only';
				with: 'Select Channel'.
			html
				tbsFormGroup: [ html select
						list: stationList;
						id: 'selectStation';
						class: 'form-control'].
			html space ]
]

{ #category : #rendering }
BTSearchFormComponent >> renderSubmitButtonOn: html [
	html tbsSubmitButton with: [ html submitButton class: 'btn btn-primary';
		callback: [ self getResults ] ]
]

{ #category : #rendering }
BTSearchFormComponent >> renderZipCodeEntry: html [
	^ html
		tbsFormGroup: [ html label
				for: 'enterZipCode';
				class: 'sr-only';
				with: 'Enter Zip Code'.
			html
				tbsFormGroup: [ html textInput
						id: 'enterZipCOde';
						class: 'form-control';
						placeholder: 'Zip Code';
						value: (self session) appBrain zipCode;
						callback: [ :value | self session appBrain zipCode: value ] ].
			html space ]
]
