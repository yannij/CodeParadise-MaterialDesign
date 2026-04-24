Class {
	#name : 'WamBrandDialogModel',
	#superclass : 'WamModel',
	#instVars : [
		'label',
		'tabGroupItems'
	],
	#category : 'CodeParadise-MaterialDesign-Preferences',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Preferences'
}

{ #category : 'initialization' }
WamBrandDialogModel >> initialize [

	super initialize.

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
