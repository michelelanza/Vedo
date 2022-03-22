Class {
	#name : #VSYNNode,
	#superclass : #VNode,
	#instVars : [
		'id'
	],
	#category : #'Vedo-SYN'
}

{ #category : #accessing }
VSYNNode >> id [

	^ id
]

{ #category : #accessing }
VSYNNode >> id: anObject [

	id := anObject
]

{ #category : #'initialize-release' }
VSYNNode >> initialize [
	super initialize.
	id := 0.
]

{ #category : #public }
VSYNNode >> reifyWith: aJSONBlob [
	self id: (aJSONBlob at: #id)
]
