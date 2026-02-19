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

{ #category : 'events' }
SlmdAppBarPresenter >> handleNavEvent: aNavEvent [
	| item |

	self systemLog logTrace: aNavEvent printString.

	item := self model navActionFind: aNavEvent id.
	item ifNil: [
		self systemLog logError: 'Not found: ', aNavEvent id printString.
		^ self ].
	item = #back ifTrue: [
		^ self view primaryPaneOnly ].
	item eventId = #update ifTrue: [
		^ self doUpdate: aNavEvent ].
	item eventId = #save ifTrue: [
		^ self doSave: aNavEvent ].
	item eventId = #cancel ifTrue: [
		^ self doCancel: aNavEvent ].
	item eventId = #delete ifTrue: [
		^ self doDelete: aNavEvent ].

	super handleNavEvent: aNavEvent.

]

{ #category : 'view' }
SlmdAppBarPresenter >> renderView [
	| list leadingAction |

	leadingAction := self model leadingAction.
	leadingAction ifNotNil: [
	(self application layout layoutSettings useTwoPaneBody and: [ leadingAction eventId = #back ])
		ifTrue: [ self view renderLeadingAction: nil ]
		ifFalse: [ self view renderLeadingAction: leadingAction asDictionary ] ].

	self view renderHeadline: self model headline.

	list := self actionItemsToUse collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderTrailingActions: list asArray.

]

{ #category : 'view' }
SlmdAppBarPresenter >> viewInitialized [

	super viewInitialized.

	self view primary: self model primary.

]
