Class {
	#name : #VSYNProject,
	#superclass : #VSYNNode,
	#instVars : [
		'projectName',
		'projectURL',
		'projectVersions',
		'fileHistories',
		'fileVersions',
		'lifetime'
	],
	#category : #'Vedo-SYN'
}

{ #category : #public }
VSYNProject >> addFileHistory: aFileHistory [
	self fileHistories add: aFileHistory 
]

{ #category : #public }
VSYNProject >> addFileVersion: aFileVersion [
	self fileVersions add: aFileVersion
]

{ #category : #public }
VSYNProject >> addProjectVersion: aProjectVersion [
	self projectVersions add: aProjectVersion 
]

{ #category : #accessing }
VSYNProject >> fileHistories [

	^ fileHistories
]

{ #category : #accessing }
VSYNProject >> fileHistories: anObject [

	fileHistories := anObject
]

{ #category : #public }
VSYNProject >> fileHistoryWithId: anId [
	^self fileHistories detect: [ :each | each id = anId ]
]

{ #category : #public }
VSYNProject >> fileVersionWithId: anId [
	^self fileVersions detect: [ :each | each id = anId ]
]

{ #category : #accessing }
VSYNProject >> fileVersions [

	^ fileVersions
]

{ #category : #accessing }
VSYNProject >> fileVersions: anObject [

	fileVersions := anObject
]

{ #category : #'initialize-release' }
VSYNProject >> initialize [
	super initialize.
	projectVersions := OrderedCollection new.
	fileHistories := OrderedCollection new.
	fileVersions := OrderedCollection new.
	projectName := ''.
	projectURL := ''.
]

{ #category : #accessing }
VSYNProject >> lifetime [

	^ lifetime
]

{ #category : #accessing }
VSYNProject >> lifetime: anObject [

	lifetime := anObject
]

{ #category : #printing }
VSYNProject >> printOn: aStream [
	super printOn: aStream.
	aStream << '('; << id asString; << ')'.
]

{ #category : #accessing }
VSYNProject >> projectName [

	^ projectName
]

{ #category : #accessing }
VSYNProject >> projectName: anObject [

	projectName := anObject
]

{ #category : #accessing }
VSYNProject >> projectURL [

	^ projectURL
]

{ #category : #accessing }
VSYNProject >> projectURL: anObject [

	projectURL := anObject
]

{ #category : #accessing }
VSYNProject >> projectVersions [

	^ projectVersions
]

{ #category : #accessing }
VSYNProject >> projectVersions: anObject [

	projectVersions := anObject
]

{ #category : #public }
VSYNProject >> reifyWith: aJSONBlob [
	super reifyWith: aJSONBlob.
	self projectName: (aJSONBlob at: #name). 
	self projectURL: (aJSONBlob at: #projectURL).

]
