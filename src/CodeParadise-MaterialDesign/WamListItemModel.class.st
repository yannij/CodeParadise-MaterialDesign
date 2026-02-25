Class {
	#name : 'WamListItemModel',
	#superclass : 'WamModel',
	#instVars : [
		'headline',
		'supportingText',
		'leadingAvatarContainer',
		'leadingAvatarLabelText',
		'leadingIcon',
		'leadingVideoThumbnail',
		'trailingIcon',
		'trailingSupportingText',
		'divider'
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

{ #category : 'accessing' }
WamListItemModel >> headline [

	^ headline
]

{ #category : 'accessing' }
WamListItemModel >> headline: anObject [

	headline := anObject
]

{ #category : 'initialization' }
WamListItemModel >> initialize [

	super initialize.

	headline := ''.

]

{ #category : 'accessing' }
WamListItemModel >> leadingAvatarContainer [

	^ leadingAvatarContainer
]

{ #category : 'accessing' }
WamListItemModel >> leadingAvatarContainer: anObject [

	leadingAvatarContainer := anObject
]

{ #category : 'accessing' }
WamListItemModel >> leadingAvatarLabelText [

	^ leadingAvatarLabelText
]

{ #category : 'accessing' }
WamListItemModel >> leadingAvatarLabelText: anObject [

	leadingAvatarLabelText := anObject
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
WamListItemModel >> leadingVideoThumbnail [

	^ leadingVideoThumbnail
]

{ #category : 'accessing' }
WamListItemModel >> leadingVideoThumbnail: anObject [

	leadingVideoThumbnail := anObject
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
WamListItemModel >> trailingSupportingText [

	^ trailingSupportingText
]

{ #category : 'accessing' }
WamListItemModel >> trailingSupportingText: anObject [

	trailingSupportingText := anObject
]
