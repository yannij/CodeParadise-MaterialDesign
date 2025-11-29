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

{ #category : 'model' }
SlmdToolbarPresenter >> modelChanged: aValueChanged [

	self clearAllSlots.

]

{ #category : 'view' }
SlmdToolbarPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent

]
