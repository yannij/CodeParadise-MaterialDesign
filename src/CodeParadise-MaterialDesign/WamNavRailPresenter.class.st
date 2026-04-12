Class {
	#name : 'WamNavRailPresenter',
	#superclass : 'WamNavElementPresenter',
	#category : 'CodeParadise-MaterialDesign-NavElement',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavElement'
}

{ #category : 'rendering' }
WamNavRailPresenter >> renderView [
	| presenter |

	presenter := self application layout layoutSettings navRailExpanded
		ifTrue: [ WamNavActionExpandedPresenter ]
		ifFalse: [ WamNavActionNarrowPresenter ].

	self view renderBottom: (self application session email ifNil: [ '?' ] ifNotNil: [ :value | value asString ]).
	self
		renderAllChildViewsForModels: self model navItems
		usingPresenter: presenter
		atSlotNamed: nil
]
