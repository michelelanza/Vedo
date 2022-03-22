Class {
	#name : #VSYNProject,
	#superclass : #VSYNNode,
	#instVars : [
		'fileHistories'
	],
	#category : #'Vedo-SYN'
}

{ #category : #public }
VSYNProject >> addFileHistory: aFileHistory [
	self fileHistories add: aFileHistory 
]

{ #category : #accessing }
VSYNProject >> fileHistories [

	^ fileHistories
]

{ #category : #accessing }
VSYNProject >> fileHistories: anObject [

	fileHistories := anObject
]

{ #category : #'initialize-release' }
VSYNProject >> initialize [
	super initialize.
	fileHistories := OrderedCollection new.
]
