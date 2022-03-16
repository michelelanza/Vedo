Class {
	#name : #BaselineOfVedo,
	#superclass : #BaselineOf,
	#category : #BaselineOfVedo
}

{ #category : #baselines }
BaselineOfVedo >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'Vedo'  ]
]
