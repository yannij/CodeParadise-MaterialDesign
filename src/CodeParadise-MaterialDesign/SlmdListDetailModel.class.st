Class {
	#name : 'SlmdListDetailModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'list',
		'detail'
	],
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'accessing' }
SlmdListDetailModel >> detail [

	^ detail
]

{ #category : 'accessing' }
SlmdListDetailModel >> detail: anObject [

	detail := anObject
]

{ #category : 'initialization' }
SlmdListDetailModel >> initialize [

	list := OrderedCollection new.

]

{ #category : 'accessing' }
SlmdListDetailModel >> list [

	^ list
]

{ #category : 'accessing' }
SlmdListDetailModel >> list: anObject [

	list := anObject
]

{ #category : 'accessing' }
SlmdListDetailModel >> listSet: aCollection [
	| wrapperClass |

	wrapperClass := self modelWrapperClass.
	list := OrderedCollection new.
	aCollection do: [ :each | list add: (wrapperClass on: each) ].
	self valueChanged.

]

{ #category : 'accessing' }
SlmdListDetailModel >> modelWrapperClass [

	^ SlmdItemWrapperModel

]
