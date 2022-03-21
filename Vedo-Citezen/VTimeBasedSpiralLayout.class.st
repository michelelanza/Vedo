Class {
	#name : #VTimeBasedSpiralLayout,
	#superclass : #VRoot,
	#category : #'Vedo-Citezen'
}

{ #category : #public }
VTimeBasedSpiralLayout >> layoutNodes2: aCollectionOfNodes [
	| currentX currentY offset dx dy segmentLength segmentDone |
	currentX := 0.
	currentY := 0.
	offset := 20.
	segmentLength := 1.
	segmentDone := 0.
	dx := 1.
	dy := 0.
	1 to: aCollectionOfNodes size do: [ :each | | buffer |
		Transcript show: currentX printString, ' ', currentY printString, ' ', (aCollectionOfNodes at: each) model key, ' ', segmentLength printString; cr.
		(aCollectionOfNodes at: each) x: currentX * offset.
		(aCollectionOfNodes at: each) y: currentY * offset.
		
		currentX := currentX + dx.
		currentY := currentY + dy.

		segmentDone := segmentDone + 1.
		
		segmentDone = segmentLength ifTrue: [ 
			segmentDone := 0.
			buffer := dy.
			dy := dx negated.
			dx := buffer.
			dx = 0 ifTrue: [  segmentLength := segmentLength + 1 ]
			 ]
			
		 ]
	
]

{ #category : #public }
VTimeBasedSpiralLayout >> layoutNodes: aCollectionOfNodes [
	| currentX currentY offset dx dy segmentLength segmentDone |
	
	"sorted := aCollectionOfNodes asSortedCollection: [ :a :b | a model year < b model year]."
	"sorted := sorted asSortedCollection: [ :a :b | a model key < b model key ]."
	currentX := 0.
	currentY := 0.
	offset := 20.
	segmentLength := 1.
	segmentDone := 0.
	dx := 1.
	dy := 0.
	aCollectionOfNodes do: [ :each | | buffer |
		Transcript show: currentX printString, ' ', currentY printString, ' ', each model key, ' ', segmentLength printString; cr.
		each x: currentX * offset.
		each y: currentY * offset.
		currentX := currentX + dx.
		currentY := currentY + dy.
		segmentDone := segmentDone + 1.
		segmentDone = segmentLength ifTrue: [ 
			segmentDone := 0.
			buffer := dy.
			dy := dx negated.
			dx := buffer.
			dx = 0 ifTrue: [  segmentLength := segmentLength + 1 ]
			 ]
		]
	
]

{ #category : #public }
VTimeBasedSpiralLayout >> layoutNodes: aCollectionOfNodes withCellSize: offset [
	| currentX currentY dx dy segmentLength segmentDone |
	currentX := 0.
	currentY := 0.
	segmentLength := 1.
	segmentDone := 0.
	dx := 1.
	dy := 0.
	aCollectionOfNodes do: [ :each | | buffer |
		Transcript show: currentX printString, ' ', currentY printString, ' ', each model key, ' ', segmentLength printString; cr.
		each x: currentX * offset; y: currentY * offset.
		currentX := currentX + dx.
		currentY := currentY + dy.
		segmentDone := segmentDone + 1.
		segmentDone = segmentLength ifTrue: [ 
			segmentDone := 0.
			buffer := dy.
			dy := dx negated.
			dx := buffer.
			dx = 0 ifTrue: [  segmentLength := segmentLength + 1 ]
			]
		]
	
]

{ #category : #public }
VTimeBasedSpiralLayout >> layoutNodes: aCollectionOfNodes withCellSize: offset withSpread: spread [
	| currentX currentY dx dy segmentLength segmentDone |
	currentX := 0.
	currentY := 0.
	segmentLength := 1.
	segmentDone := 0.
	dx := 1.
	dy := 0.
	aCollectionOfNodes do: [ :each | | buffer |
		Transcript show: currentX printString, ' ', currentY printString, ' ', each model key, ' ', segmentLength printString; cr.
		each x: currentX * offset; y: currentY * offset.
		currentX := currentX + dx.
		currentY := currentY + dy.
		segmentDone := segmentDone + 1.
		segmentDone = segmentLength ifTrue: [ 
			segmentDone := 0.
			buffer := dy.
			dy := dx negated.
			dx := buffer.
			dx = 0 ifTrue: [  segmentLength := segmentLength + spread ]
			]
		]
	
]

{ #category : #public }
VTimeBasedSpiralLayout >> layoutShapes: aCollectionOfShapes [
	| currentX currentY offset jumpCounter dx dy segmentLength segmentDone |
	currentX := 0.
	currentY := 0.
	offset := 20.
	segmentLength := 1.
	segmentDone := 0.
	jumpCounter := 1.
	dx := 1.
	dy := 0.
	1 to: aCollectionOfShapes size do: [ :each | | buffer |
		"Transcript show: currentX printString, ' ', currentY printString, ' '; cr."
		currentX := currentX + dx.
		currentY := currentY + dy.
		(aCollectionOfShapes at: each) x: currentX * 20.
		(aCollectionOfShapes at: each) y: currentY * 20.
		segmentDone := segmentDone + 1.
		
		segmentDone = segmentLength ifTrue: [ 
			segmentDone := 0.
			buffer := dy.
			dy := dx negated.
			dx := buffer.
			dx = 0 ifTrue: [  segmentLength := segmentLength + 2 ]
			 ]
			
		 ]
	
]
