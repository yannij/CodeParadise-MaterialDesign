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
SlmdToolbarPresenter >> doCancel: anObject [

	self application setAppBar2EditDelete.
	self view beNotEditable.

]

{ #category : 'events' }
SlmdToolbarPresenter >> doCreate: anObject [

	self application setDetailAddNew.
	self layout pane2 valueChanged.
	self view beEditablePane2.
	self view secondaryPaneOnly.
	self application setAppBar2SaveCancel.


]

{ #category : 'events' }
SlmdToolbarPresenter >> doDelete: anObject [

	self view primaryPaneOnly.
	self application listDetailRemove: anObject.

]

{ #category : 'events' }
SlmdToolbarPresenter >> doSave: anObject [

	self application listDetailAdd: anObject.
	self layout pane2 valueChanged.
	self application setAppBar2EditDelete.

]

{ #category : 'events' }
SlmdToolbarPresenter >> doUpdate: anObject [

	self layout pane2 valueChanged.
	self application setAppBar2SaveCancel.
	self view beEditablePane2.

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
