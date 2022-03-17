Class {
	#name : #VEntity,
	#superclass : #VRoot,
	#instVars : [
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
