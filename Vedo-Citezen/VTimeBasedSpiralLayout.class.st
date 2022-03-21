Class {
	#name : #VTimeBasedSpiralLayout,
	#superclass : #VRoot,
	#category : #'Vedo-Citezen'
}

{ #category : #public }
VTimeBasedSpiralLayout >> layoutNodes: aCollectionOfNodes [
	| sorted currentX currentY offset yearCounter jumpCounter dx dy segmentLength segmentDone |
	sorted := aCollectionOfNodes asSortedCollection: [ :a :b | a model key < b model key ].
	sorted := sorted asSortedCollection: [ :a :b | a model year < b model year].
	yearCounter := sorted first model year.
	currentX := 0.
	currentY := 0.
	offset := 20.
	segmentLength := 1.
	segmentDone := 0.
	jumpCounter := 1.
	dx := 1.
	dy := 0.
	1 to: aCollectionOfNodes size do: [ :each | | buffer |
		Transcript show: currentX printString, ' ', currentY printString, ' '; cr.
		currentX := currentX + dx.
		currentY := currentY + dy.
		(aCollectionOfNodes at: each) x: currentX * 20.
		(aCollectionOfNodes at: each) y: currentY * 20.
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
