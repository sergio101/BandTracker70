Class {
	#name : #BTSearchFormComponent,
	#superclass : #WAComponent,
	#instVars : [
		'stationList',
		'distancesList'
	],
	#category : #'BandTracker-web'
}

{ #category : #'as yet unclassified' }
BTSearchFormComponent >> getResults [
	
]

{ #category : #initialization }
BTSearchFormComponent >> initialize [
	super initialize.
	stationList := Station stations collect: [ :e | e stationName ].
	distancesList := #(10 25 50 75 100 250)
]

{ #category : #rendering }
BTSearchFormComponent >> renderContentOn: html [
	html tbsForm
		beInline;
		id: 'dataForm';
		with: [ self renderStationSelect: html.
			self renderZipCodeEntry: html.
			self renderDistanceSelect: html.
			self renderSubmitButtonOn: html.
			html
				script:
					'$("#dataForm").validate();$("#enterZipCOde").rules( "add", {minlength: 5, digits: true});' ]
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
						list: distancesList;
						labels: [ :each | each asString , ' miles' ];
						id: 'selectDistance';
						class: 'form-control';
						selected: self session appBrain distance;
						callback: [ :value | self session appBrain distance: value ] ].
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
	html submitButton class: 'btn btn-primary';
		callback: [ self getResults ]
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
						attributeAt: 'required' put: true;
						maxLength: 5;
						value: self session zipCode;
						callback: [ :value | self session zipCode: value ] ].
			html space ]
]
