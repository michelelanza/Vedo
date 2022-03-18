Class {
	#name : #VTimeBasedHorizontalLayout,
	#superclass : #VRoot,
	#category : #'Vedo-Citezen'
}

{ #category : #public }
VTimeBasedHorizontalLayout >> layoutNodes2: aCollectionOfNodes [
	| sorted currentPosition horizontalOffset verticalOffset yearCounter |
	sorted := aCollectionOfNodes asSortedCollection: [ :a :b | a model key < b model key ].
	sorted := sorted asSortedCollection: [ :a :b | a model year < b model year].
	yearCounter := sorted first model year.
	currentPosition := 0@0.
	horizontalOffset := 15.
	verticalOffset := 1.
	sorted do: [ :each | 
		(each model year = yearCounter)
			ifTrue: [ 
				each position: currentPosition" - (Point x: (each width / 2) y: (each height / 2))".
				currentPosition := (currentPosition x)@(currentPosition y + each height + verticalOffset). ]
			ifFalse: [ 
				yearCounter := each model year.
				currentPosition := (currentPosition x + horizontalOffset)@0.
				 ]
		].


]

{ #category : #public }
VTimeBasedHorizontalLayout >> layoutNodes: aCollectionOfNodes [
	| sorted currentX currentY horizontalOffset verticalOffset yearCounter |
	sorted := aCollectionOfNodes asSortedCollection: [ :a :b | a model key < b model key ].
	sorted := sorted asSortedCollection: [ :a :b | a model year < b model year].
	yearCounter := sorted first model year.
	currentX := 0.
	currentY := 0.
	horizontalOffset := 20.
	verticalOffset := 2.
	sorted do: [ :each | 
		each x: currentX.
		(each model year = yearCounter)
			ifTrue: [ 
				each x: currentX.
				each y: currentY + (each height / 2).
				currentY := currentY + each height + verticalOffset ]
			ifFalse: [ 
				currentY := 0.
				yearCounter := each model year.
				currentX := currentX + horizontalOffset.
				each x: currentX.
				each y: currentY + (each height / 2).
				currentY := currentY + each height + verticalOffset.				
				 ] ]
]
