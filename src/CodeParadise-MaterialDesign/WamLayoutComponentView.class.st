Class {
	#name : 'WamLayoutComponentView',
	#superclass : 'WamView',
	#instVars : [
		'layoutView'
	],
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'actions' }
WamLayoutComponentView >> closeBrandDialog [

	self layoutViewLazy brandDialogView closeBrandDialog
]

{ #category : 'actions' }
WamLayoutComponentView >> closeDialog [

	self layoutViewLazy dialogView closeDialog
]

{ #category : 'accessing' }
WamLayoutComponentView >> layoutView [

	^ layoutView
]

{ #category : 'accessing' }
WamLayoutComponentView >> layoutView: anObject [

	layoutView := anObject
]

{ #category : 'accessing' }
WamLayoutComponentView >> layoutViewLazy [

	layoutView ifNil: [
		layoutView := self layoutViewFind ].

	^ layoutView
]
