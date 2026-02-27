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

	self
		renderAllChildViewsForModels: self model navItems
		usingPresenter: presenter
		atSlotNamed: nil
]
