Class {
	#name : 'WamBasicListModel',
	#superclass : 'WamListModel',
	#instVars : [
		'list',
		'modelWrapperClass',
		'viewStyle'
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

{ #category : 'accessing' }
WamBasicListModel >> viewStyle [

	^ viewStyle
]

{ #category : 'accessing' }
WamBasicListModel >> viewStyle: anObject [

	viewStyle := anObject
]

{ #category : 'accessing' }
WamBasicListModel >> viewStyleBeCard [

	self viewStyle: #card
]

{ #category : 'accessing' }
WamBasicListModel >> viewStyleBeListItem [

	self viewStyle: #listItem
]

{ #category : 'accessing' }
WamBasicListModel >> viewStyleBeSupportingPane [

	self viewStyle: #supportingPane
]
