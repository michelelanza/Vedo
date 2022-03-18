Class {
	#name : #VPublicationNode,
	#superclass : #VNode,
	#instVars : [
		'entry',
		'year',
		'authors',
		'key'
	],
	#category : #'Vedo-Citezen'
}

{ #category : #accessing }
VPublicationNode >> authors [

	^ authors
]

{ #category : #accessing }
VPublicationNode >> authors: anObject [

	authors := anObject
]

{ #category : #accessing }
VPublicationNode >> entry [

	^ entry
]

{ #category : #accessing }
VPublicationNode >> entry: anObject [

	entry := anObject
]

{ #category : #protected }
VPublicationNode >> extractAuthorsFromEntry [
	self entry author value = ''
		ifTrue: [ self authors: OrderedCollection new ]
		ifFalse: [ self authors: self entry author rawValueObject people ]
	
]

{ #category : #protected }
VPublicationNode >> extractKeyFromEntry [
	self key: self entry key.
	
]

{ #category : #protected }
VPublicationNode >> extractYearFromEntry [
	self entry year value = '' ifTrue: [ self year= 1970 ] ifFalse: [ 
	self year: self entry year value asNumber ]
	
]

{ #category : #accessing }
VPublicationNode >> key [

	^ key
]

{ #category : #accessing }
VPublicationNode >> key: anObject [

	key := anObject
]

{ #category : #accessing }
VPublicationNode >> year [

	^ year
]

{ #category : #accessing }
VPublicationNode >> year: anObject [

	year := anObject
]
