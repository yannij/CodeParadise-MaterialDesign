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
	^ list select: [ :each | each actionGroup = groupName ]
]

{ #category : 'view' }
SlmdAppBarPresenter >> renderView [
	| list |

	self model isPrimary
		ifTrue: [ self view setUpLeadingAction ]
		ifFalse: [ self view setUpBackAction ].

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
