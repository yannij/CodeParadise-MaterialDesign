Class {
	#name : 'SlmdToolbarDockedPresenter',
	#superclass : 'SlmdToolbarPresenter',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'rendering' }
SlmdToolbarDockedPresenter >> renderView [
	| list |

	list := self model navActionItems collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderButtons: list asArray.
	self model fab ifNotNil: [ :value |
		self view renderFab: value asDictionary ].

]
