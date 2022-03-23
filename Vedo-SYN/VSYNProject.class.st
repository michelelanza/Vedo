Class {
	#name : #VSYNProject,
	#superclass : #VSYNNode,
	#instVars : [
		'projectName',
		'projectURL',
		'fileHistories',
		'fileVersions'
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
	fileHistories := OrderedCollection new.
	fileVersions := OrderedCollection new.
	projectName := ''.
	projectURL := ''.
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

{ #category : #public }
VSYNProject >> reifyWith: aJSONBlob [
	super reifyWith: aJSONBlob.
	self projectName: (aJSONBlob at: #name). 
	self projectURL: (aJSONBlob at: #projectURL).

]
