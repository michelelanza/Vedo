Class {
	#name : #VGraph,
	#superclass : #VRoot,
	#instVars : [
		'nodes',
		'edges'
	],
	#category : #'Vedo-Core'
}

{ #category : #public }
VGraph >> addEdge: anEdge [
	edges add: anEdge.
	anEdge graph: self.
]

{ #category : #public }
VGraph >> addEdges: aCollectionOfEdges [
	edges do: [ :each | self addEdge: each ]
]

{ #category : #public }
VGraph >> addNode: aNode [
	nodes add: aNode.
	aNode graph: self.
]

{ #category : #public }
VGraph >> addNodes: aCollectionOfNodes [
	nodes do: [ :each | self addNode: each ]
]

{ #category : #accessing }
VGraph >> edges [

	^ edges
]

{ #category : #accessing }
VGraph >> edges: anObject [

	edges := anObject
]

{ #category : #'initialize-release' }
VGraph >> initialize [
	super initialize.
	nodes := OrderedCollection new.
	edges := OrderedCollection new.
]

{ #category : #accessing }
VGraph >> nodes [

	^ nodes
]

{ #category : #accessing }
VGraph >> nodes: anObject [

	nodes := anObject
]
