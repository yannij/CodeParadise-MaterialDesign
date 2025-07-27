Class {
	#name : 'SlmdListDetailListPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceListDetail'
}

{ #category : 'events' }
SlmdListDetailListPresenter >> handleAction: event [

	self setDetail: event
]

{ #category : 'rendering' }
SlmdListDetailListPresenter >> renderView [

	self view
		renderTextSlot: 'listItem'
		value: self model wrappedModel title
		index: self model index
]

{ #category : 'events' }
SlmdListDetailListPresenter >> setDetail: request [

	self logTrace5: request printString method: 'setDetail:'.

	self view secondaryPaneOnly.
	self application setDetailWithIndex: (request parameterAt: #index).

]

{ #category : 'view' }
SlmdListDetailListPresenter >> viewCreated [

	super viewCreated.

	self subscribeToActionRequest.

]
