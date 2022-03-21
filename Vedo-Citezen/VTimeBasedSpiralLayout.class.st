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
VTimeBasedSpiralLayout >> layoutNodes: aCollectionOfNodes withCellSize2: offset [ 
 	| x y layer leg |
	x := 0.
	y := 0.
	layer := 1.
	leg := 0.
	aCollectionOfNodes first x: 0; y: 0.
	2 to: aCollectionOfNodes size do: [ :each |
		leg = 0 ifTrue: [ 
			x := x+1.
			x = layer ifTrue: [ leg := leg +1 ]. ].
		leg = 1 ifTrue: [ 
			y := y + 1.
			y = layer ifTrue: [ leg := leg + 1 ]. ].
		leg = 2 ifTrue: [ 
			x := x - 1.
			x negated = layer ifTrue: [ leg := leg + 1 ]. ].
		leg = 3 ifTrue: [ 
			y := y -1.
			y negated = layer ifTrue: [ leg := 0. layer := layer + 1 ] ].
		(aCollectionOfNodes at: each) x: offset * x; y: offset * y.
		  
		]		 
]

{ #category : #public }
VTimeBasedSpiralLayout >> layoutNodes: aCollectionOfNodes withCellSize3: offset [ 
 	| x y layer leg |
	x := 0.
	y := 0.
	layer := 1.
	leg := 0.
	aCollectionOfNodes first x: 0; y: 0.
	2 to: aCollectionOfNodes size do: [ :each |
		leg = 0 ifTrue: [ 
			x := x+1.
			x = layer ifTrue: [ leg := leg +1 ]. ]
		ifFalse: [
		leg = 1 ifTrue: [ 
			y := y + 1.
			y = layer ifTrue: [ leg := leg + 1 ]. ]
		ifFalse: [ 
		leg = 2 ifTrue: [ 
			x := x - 1.
			x negated = layer ifTrue: [ leg := leg + 1 ]. ]
		ifFalse: [  
		leg = 3 ifTrue: [ 
			y := y -1.
			y negated = layer ifTrue: [ leg := 0. layer := layer + 1 ] ].
		  ] ] ].
		(aCollectionOfNodes at: each) x: offset * x; y: offset * y.
		  
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
VTimeBasedSpiralLayout >> layoutNodes: aCollectionOfNodes withCellSize: offset withSpread2: spread [
	| currentX currentY dx dy segmentLength segmentDone |
	currentX := 0.
	currentY := 0.
	segmentLength := 1.
	segmentDone := 0.
	dx := 1.
	dy := 0.
	aCollectionOfNodes first x: 0; y: 0.
	currentX := 1.
	aCollectionOfNodes allButFirstDo: [ :each | | buffer |
		Transcript show: currentX printString, ' ', currentY printString, ' ', each model key, ' ', (segmentDone + 1) printString, '/', segmentLength printString; cr.
		"(each model key = 'Lanz1999a') ifTrue: [ self halt ]."
		
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
			].
		
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
		"Transcript show: 'length: ', segmentLength printString; cr.
		Transcript show: currentX printString, ' ', currentY printString, ' ', each model key, ' ', (segmentDone + 1) printString, '/', segmentLength printString."
		each x: currentX * offset; y: currentY * offset.
		currentX := currentX + dx.
		currentY := currentY + dy.
		segmentDone := segmentDone + 1.
		
		"Transcript show: 'dx:', dx printString, ' dy:', dy printString; cr."
		
		segmentDone = segmentLength ifTrue: [ 
			segmentDone := 0.
			buffer := dy.
			dy := dx negated.
			dx := buffer.
			dx = 0 ifTrue: [  segmentLength := segmentLength + spread ]
			].
		
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
