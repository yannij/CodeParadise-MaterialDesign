Class {
	#name : 'SlmdNavBarPresenter',
	#superclass : 'SlmdNavAbstractPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
SlmdNavBarPresenter >> renderView [
	| list |

	list := self model navItems collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderNavContent: list asArray.
]

{ #category : 'view' }
SlmdNavBarPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent

]
