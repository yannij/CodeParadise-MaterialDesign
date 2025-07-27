Class {
	#name : 'SlmdLayoutComponentView',
	#superclass : 'SlmdView',
	#instVars : [
		'layoutView'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'initialization' }
SlmdLayoutComponentView >> actionItemAt: id [
	| item |

	item := self layoutViewLazy actionItems at: id.
	item ifNotNil: [ ^ item ].
	^ self layoutViewLazy navItems at: id

]

{ #category : 'actions' }
SlmdLayoutComponentView >> doAction: aNavAction [

	^ self layoutViewLazy doAction: aNavAction
]

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
