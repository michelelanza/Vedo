Class {
	#name : #VTimeBasedHorizontalLayout,
	#superclass : #VRoot,
	#category : #'Vedo-Citezen'
}

{ #category : #public }
VTimeBasedHorizontalLayout >> layoutNodes: aCollectionOfNodes [
	| sorted currentPosition horizontalOffset verticalOffset yearCounter |
	sorted := aCollectionOfNodes asSortedCollection: [ :a :b | a model year < b model year ].
	yearCounter := sorted first model year.
	currentPosition := 0@0.
	horizontalOffset := 15.
	verticalOffset := 12.
	sorted do: [ :each | 
		(each model year = yearCounter)
			ifTrue: [ 
				each position: currentPosition.
				currentPosition := (currentPosition x)@(currentPosition y + verticalOffset). ]
			ifFalse: [ 
				yearCounter := each model year.
				currentPosition := (currentPosition x + horizontalOffset)@0.
				 ]
		].


]
