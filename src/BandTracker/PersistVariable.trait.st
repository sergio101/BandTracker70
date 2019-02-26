Trait {
	#name : #PersistVariable,
	#category : #'BandTracker-core'
}

{ #category : #'ston persistence' }
PersistVariable classSide >> backupClassVariable: methodName [
	| s3 bucket dataString fileName |
	s3 := AWSS3 new.
	bucket := s3 bucketNamed: 'somabandtracker'.
	dataString := STON toString: (self perform: methodName).
	fileName := 'BackupData/', self name, '-', methodName , '-',
		DateAndTime now asUnixTime asString , '.ston'.
	bucket atKey: fileName putObject: dataString
]
