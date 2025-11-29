Class {
	#name : 'SlmdNavActionPresenter',
	#superclass : 'SlmdNavAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
SlmdNavActionPresenter >> renderView [

	self application layout layoutSettings navRailExpanded
		ifTrue: [ self view renderNavExpanded: self model asDictionary ]
		ifFalse: [ self view renderNavNarrow: self model asDictionary ].

]

{ #category : 'view' }
SlmdNavActionPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent

]
