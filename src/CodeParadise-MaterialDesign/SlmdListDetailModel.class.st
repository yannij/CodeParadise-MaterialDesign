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

	list := OrderedCollection new.
	aCollection withIndexDo: [ :each :index |
		list add: (SlmdItemWrapperModel on: each atIndex: index) ].
	self valueChanged.

]
