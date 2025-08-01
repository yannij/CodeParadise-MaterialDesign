Class {
	#name : 'SlmdAppBarPresenter',
	#superclass : 'SlmdToolbarPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'view' }
SlmdAppBarPresenter >> actionGroupToUse [

	^ self model actionGroupToUse
]

{ #category : 'view' }
SlmdAppBarPresenter >> actionItemsToUse [
	| list groupName |

	self model actionItems ifNotEmpty: [ :value |
		^ value ].

	list := self application actionItems.
	groupName := self actionGroupToUse.
	^ list select: [ :each | each groupTag = groupName ]
]

{ #category : 'view' }
SlmdAppBarPresenter >> renderView [
	| list leadingActionName leadingAction |

	leadingActionName := self model isPrimary ifTrue: [ #modalNav ] ifFalse: [ #back ].
	leadingAction := self application editItemNamed: leadingActionName.
	self view renderLeadingAction: leadingAction asDictionary.

	self model isPrimary ifTrue: [
		self view renderHeadline: self application class appName ].

	list := self actionItemsToUse collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderTrailingActions: list asArray.

]

{ #category : 'view' }
SlmdAppBarPresenter >> viewInitialized [

	super viewInitialized.

	self view primary: self model primary.

]
