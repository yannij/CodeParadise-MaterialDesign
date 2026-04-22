Class {
	#name : 'WamBrandDialogModel',
	#superclass : 'WamModel',
	#instVars : [
		'label',
		'open',
		'tabGroupItems'
	],
	#category : 'CodeParadise-MaterialDesign-Preferences',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Preferences'
}

{ #category : 'initialization' }
WamBrandDialogModel >> initialize [

	super initialize.

	open := false.
	"There are 5 tabs hardcoded in the template"
	tabGroupItems := Array new: 5.

]

{ #category : 'accessing' }
WamBrandDialogModel >> label [

	^ label
]

{ #category : 'accessing' }
WamBrandDialogModel >> label: anObject [

	label := anObject
]

{ #category : 'accessing' }
WamBrandDialogModel >> open [

	^ open
]

{ #category : 'accessing' }
WamBrandDialogModel >> open: anObject [

	open := anObject
]

{ #category : 'initialization' }
WamBrandDialogModel >> setOpen: aBoolean [

	self open: aBoolean.
	self valueChanged.

]

{ #category : 'accessing' }
WamBrandDialogModel >> tabGroupItemAt: index put: aTabGroupItem [

	self tabGroupItems at: index put: aTabGroupItem
]

{ #category : 'accessing' }
WamBrandDialogModel >> tabGroupItems [

	^ tabGroupItems
]

{ #category : 'accessing' }
WamBrandDialogModel >> tabGroupItems: anObject [

	tabGroupItems := anObject
]
