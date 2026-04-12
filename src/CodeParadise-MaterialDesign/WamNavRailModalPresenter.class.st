Class {
	#name : 'WamNavRailModalPresenter',
	#superclass : 'WamNavElementPresenter',
	#category : 'CodeParadise-MaterialDesign-NavElement',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavElement'
}

{ #category : 'rendering' }
WamNavRailModalPresenter >> renderView [

	self view
		drawerSetup;
		renderBottom: (self application session email ifNil: [ '?' ] ifNotNil: [ :value | value asString ]).

	self
		renderAllChildViewsForModels: self model navItems
		usingPresenter: WamNavActionExpandedPresenter
		atSlotNamed: nil
]
