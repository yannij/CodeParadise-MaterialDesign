Class {
	#name : 'SlmdAppBarPresenter',
	#superclass : 'SlmdToolbarPresenter',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'view' }
SlmdAppBarPresenter >> actionGroupToUse [

	^ self model actionGroupToUse
]

{ #category : 'view' }
SlmdAppBarPresenter >> actionItemsToUse [
	"| list groupName |

	self model navActionItems ifNotEmpty: [ :value |
		^ value ].

	list := self application navActionItems.
	groupName := self actionGroupToUse.
	^ list select: [ :each | each groupTag = groupName ]"

	^ self model navActionItems
]

{ #category : 'view' }
SlmdAppBarPresenter >> renderView [
	| list leadingAction |

	leadingAction := self model leadingAction.
	leadingAction ifNotNil: [
	(self application layout layoutSettings useTwoPaneBody and: [ leadingAction eventSubtype = #back ])
		ifTrue: [ self view renderLeadingAction: nil ]
		ifFalse: [ self view renderLeadingAction: leadingAction asDictionary ] ].

	self model isPrimary ifTrue: [
		self view renderHeadline: self model headline ].

	list := self actionItemsToUse collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderTrailingActions: list asArray.

]

{ #category : 'view' }
SlmdAppBarPresenter >> viewInitialized [

	super viewInitialized.

	self view primary: self model primary.

]
