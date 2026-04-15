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

{ #category : 'initialization' }
WamLayoutComponentView >> setElement: element gap: gap [

	element removeClasses: #('wa-gap-3xs' 'wa-gap-2xs' 'wa-gap-xs' 'wa-gap-s' 'wa-gap-m').
	element addClass: gap.

]

{ #category : 'initialization' }
WamLayoutComponentView >> setElement: element padding: pad [

	element styleAt: 'padding' put: pad.

]

{ #category : 'initialization' }
WamLayoutComponentView >> setElementGap: element [

	element removeClasses: #('wa-gap-3xs' 'wa-gap-2xs' 'wa-gap-xs' 'wa-gap-s' 'wa-gap-m').
	element addClass: self layoutViewLazy wamGap.

]

{ #category : 'initialization' }
WamLayoutComponentView >> setElementPadding: element [

	self setElement: element padding: self layoutViewLazy wamPadding.

]
