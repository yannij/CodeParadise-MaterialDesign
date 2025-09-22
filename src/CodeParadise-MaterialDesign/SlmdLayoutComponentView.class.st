Class {
	#name : 'SlmdLayoutComponentView',
	#superclass : 'SlmdView',
	#instVars : [
		'layoutView'
	],
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'accessing' }
SlmdLayoutComponentView >> layoutView [

	^ layoutView
]

{ #category : 'accessing' }
SlmdLayoutComponentView >> layoutView: anObject [

	layoutView := anObject
]

{ #category : 'accessing' }
SlmdLayoutComponentView >> layoutViewLazy [

	layoutView ifNil: [
		layoutView := self layoutViewFind ].

	^ layoutView
]

{ #category : 'actions' }
SlmdLayoutComponentView >> primaryPaneOnly [

	self layoutViewLazy paneLayoutView primaryPaneOnly
]
