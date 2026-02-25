Class {
	#name : 'WamListModel',
	#superclass : 'WamModel',
	#instVars : [
		'list'
	],
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'initialization' }
WamListModel >> initialize [

	list := OrderedCollection new.

]

{ #category : 'accessing' }
WamListModel >> list [

	^ list
]

{ #category : 'accessing' }
WamListModel >> list: anObject [

	list := anObject
]

{ #category : 'accessing' }
WamListModel >> listSet: aCollection [
	| wrapperClass |

	wrapperClass := self modelWrapperClass.
	list := OrderedCollection new.
	aCollection do: [ :each | list add: (wrapperClass on: each) ].
	self valueChanged.

]

{ #category : 'accessing' }
WamListModel >> modelWrapperClass [

	^ WamItemWrapperModel

]
