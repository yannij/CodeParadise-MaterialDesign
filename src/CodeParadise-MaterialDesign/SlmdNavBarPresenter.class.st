Class {
	#name : 'SlmdNavBarPresenter',
	#superclass : 'SlmdNavPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'rendering' }
SlmdNavBarPresenter >> renderView [
	| list |

	list := self model navItems collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderNavContent: list asArray.
]
