Class {
	#name : 'SlmdToolbarPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'initialization' }
SlmdToolbarPresenter >> actionGroupToUse [

	self subclassResponsibility
]

{ #category : 'view' }
SlmdToolbarPresenter >> actionItemFabOrNil [
	| list |

	list := self application actionItems.
	^ list detect: [ :each | each groupTag = #fab ] ifNone: []
]

{ #category : 'view' }
SlmdToolbarPresenter >> actionItemsToUse [
	| list groupName |

	list := self application actionItems.
	groupName := self actionGroupToUse.
	^ list select: [ :each | each groupTag = groupName ]
]
