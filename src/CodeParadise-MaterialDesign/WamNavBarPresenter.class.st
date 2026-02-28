Class {
	#name : 'WamNavBarPresenter',
	#superclass : 'WamNavElementPresenter',
	#category : 'CodeParadise-MaterialDesign-NavElement',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavElement'
}

{ #category : 'events' }
WamNavBarPresenter >> handleNavEvent: aNavEvent [

	self application navToNavAction: aNavEvent.

]

{ #category : 'rendering' }
WamNavBarPresenter >> navLists [
	| items navList overflowList |

	items := self model navItems.

	items size <= 4 ifTrue: [
		^ { items. {} } ].

	navList := items copyFrom: 1 to: 3.
	overflowList := items copyFrom: 4 to: items size.
	^ { navList. overflowList }
]

{ #category : 'rendering' }
WamNavBarPresenter >> renderView [
	| lists |

	lists := self navLists.

	self
		renderAllChildViewsForModels: lists first
		usingPresenter: WamNavActionNavBarPresenter
		atSlotNamed: nil.

	self view dropdownDisplay: lists second notEmpty.
	self
		renderAllChildViewsForModels: lists second
		usingPresenter: WamNavActionNavBarPresenter
		atSlotNamed: #overflow
]

{ #category : 'view' }
WamNavBarPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent

]
