Class {
	#name : #VSYNFileVersion,
	#superclass : #VSYNNode,
	#instVars : [
		'fileHistory'
	],
	#category : #'Vedo-SYN'
}

{ #category : #accessing }
VSYNFileVersion >> fileHistory [

	^ fileHistory
]

{ #category : #accessing }
VSYNFileVersion >> fileHistory: anObject [

	fileHistory := anObject
]

{ #category : #'initialize-release' }
VSYNFileVersion >> initialize [
	super initialize.

]

{ #category : #printing }
VSYNFileVersion >> printOn: aStream [
	super printOn: aStream.
	aStream << '('; << self fileHistory fileName asString; << ')'.
]

{ #category : #public }
VSYNFileVersion >> reifyWith: aJSONBlob [
	super reifyWith: aJSONBlob.
	self fileHistory: (self project fileHistoryWithId: (aJSONBlob at: #fileHistory)).
	self fileHistory addFileVersion: self.
	 
	
]
