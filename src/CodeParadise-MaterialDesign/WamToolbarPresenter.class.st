Class {
	#name : 'WamToolbarPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'initialization' }
WamToolbarPresenter >> clearAllSlots [

	self renderAllChildViewsForModels: {} atSlotNamed: #toolbar.
	self renderAllChildViewsForModels: {} atSlotNamed: #fab.

]

{ #category : 'events' }
WamToolbarPresenter >> doCancel: aNavActionEvent [

	self application setAppBar2EditDelete.
	self view beNotEditablePane2.

]

{ #category : 'events' }
WamToolbarPresenter >> doCreate: aNavActionEvent [

	self application setDetailAddNew.
	self layout pane2 valueChanged.
	self view beEditablePane2.
	self view secondaryPaneOnly.
	self application setAppBar2SaveCancel.


]

{ #category : 'events' }
WamToolbarPresenter >> doDelete: aNavActionEvent [

	self view primaryPaneOnly.
	self application listDetailRemove: aNavActionEvent.

]

{ #category : 'events' }
WamToolbarPresenter >> doSave: aNavActionEvent [
	| result |

	result := self application listDetailAdd: aNavActionEvent.
	self layout pane2 valueChanged.
	self layout pane2 paneContent ifNotNil: [ :value | value valueChanged ].
	self application setAppBar2EditDelete.
	result = true ifTrue: [
		self view beNotEditablePane2 ].

]

{ #category : 'events' }
WamToolbarPresenter >> doUpdate: aNavActionEvent [

	self layout pane2 valueChanged.
	self application setAppBar2SaveCancel.
	self view beEditablePane2.

]

{ #category : 'model' }
WamToolbarPresenter >> modelChanged: aValueChanged [

	self clearAllSlots.

]

{ #category : 'view' }
WamToolbarPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavActionEvent

]
