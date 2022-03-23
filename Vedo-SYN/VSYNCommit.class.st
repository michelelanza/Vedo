Class {
	#name : #VSYNCommit,
	#superclass : #VSYNNode,
	#instVars : [
		'timeStamp'
	],
	#category : #'Vedo-SYN'
}

{ #category : #'initialize-release' }
VSYNCommit >> initialize [
	super initialize.
	timeStamp := 0.
]

{ #category : #accessing }
VSYNCommit >> timeStamp [

	^ timeStamp
]

{ #category : #accessing }
VSYNCommit >> timeStamp: anObject [

	timeStamp := anObject
]
