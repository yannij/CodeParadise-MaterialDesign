Class {
	#name : 'WamListItemModel',
	#superclass : 'WamModel',
	#instVars : [
		'leadingIcon',
		'leadingAvatar',
		'leadingMedia',
		'overline',
		'supportingText',
		'trailingIcon',
		'trailingText',
		'divider',
		'labelText'
	],
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'accessing' }
WamListItemModel >> divider [

	^ divider
]

{ #category : 'accessing' }
WamListItemModel >> divider: anObject [

	divider := anObject
]

{ #category : 'initialization' }
WamListItemModel >> initialize [

	super initialize.

	labelText := ''.

]

{ #category : 'accessing' }
WamListItemModel >> labelText [

	^ labelText
]

{ #category : 'accessing' }
WamListItemModel >> labelText: anObject [

	labelText := anObject
]

{ #category : 'accessing' }
WamListItemModel >> leadingAvatar [

	^ leadingAvatar
]

{ #category : 'accessing' }
WamListItemModel >> leadingAvatar: anObject [

	leadingAvatar := anObject
]

{ #category : 'accessing' }
WamListItemModel >> leadingIcon [

	^ leadingIcon
]

{ #category : 'accessing' }
WamListItemModel >> leadingIcon: anObject [

	leadingIcon := anObject
]

{ #category : 'accessing' }
WamListItemModel >> leadingMedia [

	^ leadingMedia
]

{ #category : 'accessing' }
WamListItemModel >> leadingMedia: anObject [

	leadingMedia := anObject
]

{ #category : 'accessing' }
WamListItemModel >> overline [

	^ overline
]

{ #category : 'accessing' }
WamListItemModel >> overline: anObject [

	overline := anObject
]

{ #category : 'presenter' }
WamListItemModel >> preferredPresenterClass [

	^ WamListItemPresenter
]

{ #category : 'accessing' }
WamListItemModel >> supportingText [

	^ supportingText
]

{ #category : 'accessing' }
WamListItemModel >> supportingText: anObject [

	supportingText := anObject
]

{ #category : 'accessing' }
WamListItemModel >> trailingIcon [

	^ trailingIcon
]

{ #category : 'accessing' }
WamListItemModel >> trailingIcon: anObject [

	trailingIcon := anObject
]

{ #category : 'accessing' }
WamListItemModel >> trailingText [

	^ trailingText
]

{ #category : 'accessing' }
WamListItemModel >> trailingText: anObject [

	trailingText := anObject
]
