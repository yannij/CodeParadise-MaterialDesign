Class {
	#name : 'SlmdListItemModel',
	#superclass : 'SlmdModel',
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
SlmdListItemModel >> divider [

	^ divider
]

{ #category : 'accessing' }
SlmdListItemModel >> divider: anObject [

	divider := anObject
]

{ #category : 'accessing' }
SlmdListItemModel >> headline [

	^ headline
]

{ #category : 'accessing' }
SlmdListItemModel >> headline: anObject [

	headline := anObject
]

{ #category : 'initialization' }
SlmdListItemModel >> initialize [

	super initialize.

	headline := ''.

]

{ #category : 'accessing' }
SlmdListItemModel >> leadingAvatarContainer [

	^ leadingAvatarContainer
]

{ #category : 'accessing' }
SlmdListItemModel >> leadingAvatarContainer: anObject [

	leadingAvatarContainer := anObject
]

{ #category : 'accessing' }
SlmdListItemModel >> leadingAvatarLabelText [

	^ leadingAvatarLabelText
]

{ #category : 'accessing' }
SlmdListItemModel >> leadingAvatarLabelText: anObject [

	leadingAvatarLabelText := anObject
]

{ #category : 'accessing' }
SlmdListItemModel >> leadingIcon [

	^ leadingIcon
]

{ #category : 'accessing' }
SlmdListItemModel >> leadingIcon: anObject [

	leadingIcon := anObject
]

{ #category : 'accessing' }
SlmdListItemModel >> leadingVideoThumbnail [

	^ leadingVideoThumbnail
]

{ #category : 'accessing' }
SlmdListItemModel >> leadingVideoThumbnail: anObject [

	leadingVideoThumbnail := anObject
]

{ #category : 'accessing' }
SlmdListItemModel >> supportingText [

	^ supportingText
]

{ #category : 'accessing' }
SlmdListItemModel >> supportingText: anObject [

	supportingText := anObject
]

{ #category : 'accessing' }
SlmdListItemModel >> trailingIcon [

	^ trailingIcon
]

{ #category : 'accessing' }
SlmdListItemModel >> trailingIcon: anObject [

	trailingIcon := anObject
]

{ #category : 'accessing' }
SlmdListItemModel >> trailingSupportingText [

	^ trailingSupportingText
]

{ #category : 'accessing' }
SlmdListItemModel >> trailingSupportingText: anObject [

	trailingSupportingText := anObject
]
