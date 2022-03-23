Class {
	#name : #VSYNProjectVersion,
	#superclass : #VSYNNode,
	#instVars : [
		'fileVersions',
		'timeStamp',
		'commitMessage'
	],
	#category : #'Vedo-SYN'
}

{ #category : #public }
VSYNProjectVersion >> addFileVersion: aFileVersion [
	self fileVersions add: aFileVersion
]

{ #category : #accessing }
VSYNProjectVersion >> commitMessage [

	^ commitMessage
]

{ #category : #accessing }
VSYNProjectVersion >> commitMessage: anObject [

	commitMessage := anObject
]

{ #category : #accessing }
VSYNProjectVersion >> fileVersions [

	^ fileVersions
]

{ #category : #accessing }
VSYNProjectVersion >> fileVersions: anObject [

	fileVersions := anObject
]

{ #category : #'initialize-release' }
VSYNProjectVersion >> initialize [
	super initialize.
	timeStamp := 0.
	fileVersions := OrderedCollection new.
	commitMessage := ''.
]

{ #category : #printing }
VSYNProjectVersion >> printOn: aStream [
	super printOn: aStream.
	aStream << '('; << self timeStamp printString; << ')'.
]

{ #category : #public }
VSYNProjectVersion >> reifyWith: aJSONBlob [
	super reifyWith: aJSONBlob.
	self commitMessage: (aJSONBlob at: #message).
	self timeStamp: (DateAndTime fromUnixTime: (aJSONBlob at: #timestamp)).
	(aJSONBlob at: #fileVersions) do: [ :each | | newVersion |
		newVersion := self project fileVersionWithId: each.
		self addFileVersion: newVersion ]
	 
]

{ #category : #accessing }
VSYNProjectVersion >> timeStamp [

	^ timeStamp
]

{ #category : #accessing }
VSYNProjectVersion >> timeStamp: anObject [

	timeStamp := anObject
]
