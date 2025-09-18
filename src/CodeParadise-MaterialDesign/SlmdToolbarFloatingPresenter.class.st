Class {
	#name : 'SlmdToolbarFloatingPresenter',
	#superclass : 'SlmdToolbarPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'rendering' }
SlmdToolbarFloatingPresenter >> renderView [
	| list |

	list := self model iconButtons collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderButtons: list asArray.
	self model fab ifNotNil: [ :value |
		self view renderFab: value asDictionary ].

]
