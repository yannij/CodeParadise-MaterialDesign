Class {
	#name : 'WamBrandDialogPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Preferences',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Preferences'
}

{ #category : 'rendering' }
WamBrandDialogPresenter >> renderView [

	self model label ifNotNil: [ :value |
		self view renderLabel: value ].

self systemLog logTrace: self model tabGroupItems printString.
	self model tabGroupItems doWithIndex: [ :eachItem :i |
		eachItem ifNotNil: [
		| key |
		key := 'p', i printString.
		self view renderTab: key label: eachItem tabName.
		self renderChildViewForModel: eachItem atSlotNamed: key ] ].

	self view renderOpen: self model open.

]
