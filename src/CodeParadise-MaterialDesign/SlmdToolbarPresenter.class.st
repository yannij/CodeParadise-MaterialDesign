Class {
	#name : 'SlmdToolbarPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
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
