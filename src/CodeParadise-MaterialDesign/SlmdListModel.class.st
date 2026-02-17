Class {
	#name : 'SlmdListModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'list'
	],
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'initialization' }
SlmdListModel >> initialize [

	list := OrderedCollection new.

]

{ #category : 'accessing' }
SlmdListModel >> list [

	^ list
]

{ #category : 'accessing' }
SlmdListModel >> list: anObject [

	list := anObject
]

{ #category : 'accessing' }
SlmdListModel >> listSet: aCollection [
	| wrapperClass |

	wrapperClass := self modelWrapperClass.
	list := OrderedCollection new.
	aCollection do: [ :each | list add: (wrapperClass on: each) ].
	self valueChanged.

]

{ #category : 'accessing' }
SlmdListModel >> modelWrapperClass [

	^ SlmdItemWrapperModel

]
