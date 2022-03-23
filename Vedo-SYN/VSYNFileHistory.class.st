Class {
	#name : #VSYNFileHistory,
	#superclass : #VSYNNode,
	#instVars : [
		'fileName',
		'path',
		'aliases',
		'fileVersions'
	],
	#category : #'Vedo-SYN'
}

{ #category : #public }
VSYNFileHistory >> addAlias: anAlias [
	self aliases add: anAlias
]

{ #category : #public }
VSYNFileHistory >> addFileVersion: aFileVersion [
	self fileVersions add: aFileVersion 
]

{ #category : #accessing }
VSYNFileHistory >> aliases [

	^ aliases
]

{ #category : #accessing }
VSYNFileHistory >> aliases: anObject [

	aliases := anObject
]

{ #category : #accessing }
VSYNFileHistory >> fileName [

	^ fileName
]

{ #category : #accessing }
VSYNFileHistory >> fileName: anObject [

	fileName := anObject
]

{ #category : #accessing }
VSYNFileHistory >> fileVersions [

	^ fileVersions
]

{ #category : #accessing }
VSYNFileHistory >> fileVersions: anObject [

	fileVersions := anObject
]

{ #category : #'initialize-release' }
VSYNFileHistory >> initialize [
	super initialize.
	fileVersions := OrderedCollection new.
	fileName := ''.
	path := ''.
	aliases := OrderedCollection new.
]

{ #category : #accessing }
VSYNFileHistory >> path [

	^ path
]

{ #category : #accessing }
VSYNFileHistory >> path: anObject [

	path := anObject
]

{ #category : #printing }
VSYNFileHistory >> printOn: aStream [
	super printOn: aStream.
	aStream << '('; << fileName asString; << ')'.
]

{ #category : #public }
VSYNFileHistory >> reifyWith: aJSONBlob [
	super reifyWith: aJSONBlob.
	self path: (aJSONBlob at: #path).
	self fileName: (aJSONBlob at: #name).
	(aJSONBlob at: #aliases) allButFirst isEmpty ifFalse: [ 
		(aJSONBlob at: #aliases) allButFirstDo: [ :each | self addAlias: each ]].
]
