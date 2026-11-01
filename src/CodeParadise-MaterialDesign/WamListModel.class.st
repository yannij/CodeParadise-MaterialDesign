Class {
	#name : 'WamListModel',
	#superclass : 'WamModel',
	#instVars : [
		'viewMode'
	],
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'accessing' }
WamListModel >> list [

	self subclassResponsibility

]

{ #category : 'accessing' }
WamListModel >> list: anObject [

	self subclassResponsibility

]

{ #category : 'accessing' }
WamListModel >> listSet: aCollection [

	self subclassResponsibility

]

{ #category : 'accessing' }
WamListModel >> modelWrapperClass [

	self subclassResponsibility

]

{ #category : 'accessing' }
WamListModel >> viewMode [

	^ viewMode
]

{ #category : 'accessing' }
WamListModel >> viewMode: anObject [

	viewMode := anObject
]
