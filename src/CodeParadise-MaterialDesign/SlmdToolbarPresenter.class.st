Class {
	#name : 'SlmdToolbarPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'initialization' }
SlmdToolbarPresenter >> clearAllSlots [

	self removeAllChildPresentersAtSlotNamed: #toolbar.
	self view removeChildrenAtSlotNamed: #toolbar.

	self removeAllChildPresentersAtSlotNamed: #fab.
	self view removeChildrenAtSlotNamed: #fab.

]

{ #category : 'events' }
SlmdToolbarPresenter >> handleNavEvent: aNavEvent [
	| item |

	item := self model navActionFind: aNavEvent id.
	item ifNil: [
		self systemLog logTrace: 'Not found: ', aNavEvent id printString method: 'handleNavEvent:'.
		^ self ].
	item = #back ifTrue: [
		^ self view primaryPaneOnly ].
	self application navTo: item.

]

{ #category : 'model' }
SlmdToolbarPresenter >> modelChanged: aValueChanged [

	self clearAllSlots.

]

{ #category : 'view' }
SlmdToolbarPresenter >> viewCreated [

	super viewCreated.

	self view when: WamNavActionEvent send: #handleNavEvent: to: self

]
