Class {
	#name : #VPublicationNode,
	#superclass : #VNode,
	#instVars : [
		'entry',
		'year'
	],
	#category : #'Vedo-Citezen'
}

{ #category : #accessing }
VPublicationNode >> entry [

	^ entry
]

{ #category : #accessing }
VPublicationNode >> entry: anObject [

	entry := anObject
]

{ #category : #protected }
VPublicationNode >> extractYearFromEntry [
	self year: self entry year value asNumber
	
]

{ #category : #accessing }
VPublicationNode >> year [

	^ year
]

{ #category : #accessing }
VPublicationNode >> year: anObject [

	year := anObject
]
