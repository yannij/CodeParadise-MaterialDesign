Class {
	#name : 'SlmdToolbarFloatingPresenter',
	#superclass : 'SlmdToolbarPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'initialization' }
SlmdToolbarFloatingPresenter >> actionGroupToUse [

	^ #toolbar
]

{ #category : 'rendering' }
SlmdToolbarFloatingPresenter >> renderView [
	| list |

	list := self actionItemsToUse collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderButtons: list asArray.
	self view renderFab: self actionItemFabOrNil asDictionary.

]
