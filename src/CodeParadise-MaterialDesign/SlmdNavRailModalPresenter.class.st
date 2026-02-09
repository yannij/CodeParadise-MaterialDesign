Class {
	#name : 'SlmdNavRailModalPresenter',
	#superclass : 'SlmdNavAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
SlmdNavRailModalPresenter >> renderView [
	| list |

	list := self model navItems collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderNavContent: list asArray.
]

{ #category : 'view' }
SlmdNavRailModalPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent

]
