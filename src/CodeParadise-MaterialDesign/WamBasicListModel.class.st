Class {
	#name : 'WamBasicListModel',
	#superclass : 'WamListModel',
	#instVars : [
		'list',
		'modelWrapperClass'
	],
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'initialization' }
WamBasicListModel >> initialize [

	list := OrderedCollection new.

]

{ #category : 'accessing' }
WamBasicListModel >> list [

	^ list
]

{ #category : 'accessing' }
WamBasicListModel >> list: anObject [

	list := anObject
]

{ #category : 'accessing' }
WamBasicListModel >> listSet: aCollection [
	| wrapperClass |

	wrapperClass := self modelWrapperClass.
	list := OrderedCollection new.
	aCollection do: [ :each | list add: (wrapperClass on: each) ].
	self valueChanged.

]

{ #category : 'accessing' }
WamBasicListModel >> modelWrapperClass [

	^ modelWrapperClass ifNil: [ modelWrapperClass := WamItemWrapperModel ]
]

{ #category : 'accessing' }
WamBasicListModel >> modelWrapperClass: anObject [

	^ modelWrapperClass := anObject
]

{ #category : 'presenter' }
WamBasicListModel >> preferredPresenterClass [

	^ WamBasicListPresenter
]
