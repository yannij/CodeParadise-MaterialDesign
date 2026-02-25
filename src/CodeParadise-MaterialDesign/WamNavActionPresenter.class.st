Class {
	#name : 'WamNavActionPresenter',
	#superclass : 'WamNavAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
WamNavActionPresenter >> renderView [

	self application layout layoutSettings navRailExpanded
		ifTrue: [ self view renderNavExpanded: self model asDictionary ]
		ifFalse: [ self view renderNavNarrow: self model asDictionary ].

]

{ #category : 'view' }
WamNavActionPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent

]
