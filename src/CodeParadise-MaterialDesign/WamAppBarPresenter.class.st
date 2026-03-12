Class {
	#name : 'WamAppBarPresenter',
	#superclass : 'WamToolbarPresenter',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'view' }
WamAppBarPresenter >> actionGroupToUse [

	^ self model actionGroupToUse
]

{ #category : 'view' }
WamAppBarPresenter >> actionItemsToUse [
	"| list groupName |

	self model navActionItems ifNotEmpty: [ :value |
		^ value ].

	list := self application navActionItems.
	groupName := self actionGroupToUse.
	^ list select: [ :each | each groupTag = groupName ]"

	^ self model navActionItems
]

{ #category : 'events' }
WamAppBarPresenter >> handleNavEvent: aNavEvent [
	| item |

	self systemLog logTrace: aNavEvent printString.

	item := self model navActionAtId: aNavEvent id.
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
WamAppBarPresenter >> renderView [
	| list |

	self model leadingAction
		ifNil: [ self view renderLeadingAction: nil ]
		ifNotNil: [ :value |
			self model isPrimary
				ifTrue: [ self view renderLeadingAction: value asDictionary ]
				ifFalse: [
					(value eventId = #back and: [ self application layout layoutSettings useTwoPaneBody not ])
						ifTrue: [ self view renderLeadingAction: value asDictionary ]
						ifFalse: [ self view renderLeadingAction: nil ] ] ].

	self view appBarSetWidth; renderHeadline: self model headline.

	list := self actionItemsToUse collect: [ :each | each asDictionary ].
	self view renderTrailingActions: list asArray.

]

{ #category : 'view' }
WamAppBarPresenter >> viewInitialized [

	super viewInitialized.

	self view primary: self model primary.

]
