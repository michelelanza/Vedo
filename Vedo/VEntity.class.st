Class {
	#name : #VEntity,
	#superclass : #VRoot,
	#instVars : [
		'model',
		'graph'
	],
	#category : #'Vedo-Core'
}

{ #category : #accessing }
VEntity >> graph [

	^ graph
]

{ #category : #accessing }
VEntity >> graph: anObject [

	graph := anObject
]

{ #category : #'initialize-release' }
VEntity >> initialize [
	super initialize.
	
]

{ #category : #accessing }
VEntity >> model [

	^ model
]

{ #category : #accessing }
VEntity >> model: anObject [

	model := anObject
]
