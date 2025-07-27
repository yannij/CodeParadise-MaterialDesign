Class {
	#name : 'SlmdFabPresenter',
	#superclass : 'SlmdToolbarPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'initialization' }
SlmdFabPresenter >> actionGroupToUse [

	^ #fab
]

{ #category : 'rendering' }
SlmdFabPresenter >> renderView [
	| list |

	list := self actionItemsToUse collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderFab: self actionItemFabOrNil asDictionary.

]
