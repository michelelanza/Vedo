Class {
	#name : #VEntity,
	#superclass : #VRoot,
	#instVars : [
		'model',
		'graph',
		'vizorEntity'
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

{ #category : #accessing }
VEntity >> vizorEntity [

	^ vizorEntity
]

{ #category : #accessing }
VEntity >> vizorEntity: anObject [

	vizorEntity := anObject
]
