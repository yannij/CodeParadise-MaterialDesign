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

	self application wrapperCancel: aNavActionEvent.
	self view beNotEditablePane2.

]

{ #category : 'events' }
WamToolbarPresenter >> doCreate: aNavActionEvent [

	self application setDetailAddNew.
	self view beEditablePane2.
	self view secondaryPaneOnly.

]

{ #category : 'events' }
WamToolbarPresenter >> doDelete: aNavActionEvent [

	self application wrapperDelete: aNavActionEvent.
	self view primaryPaneOnly.

]

{ #category : 'events' }
WamToolbarPresenter >> doSave: aNavActionEvent [
	| result |

	result := self application wrapperSave: aNavActionEvent.
	result = true ifTrue: [
		self view beNotEditablePane2 ].

]

{ #category : 'events' }
WamToolbarPresenter >> doUpdate: aNavActionEvent [

	self application wrapperUpdate: aNavActionEvent.
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
