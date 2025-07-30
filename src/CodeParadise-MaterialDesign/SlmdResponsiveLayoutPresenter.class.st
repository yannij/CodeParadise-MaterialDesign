Class {
	#name : 'SlmdResponsiveLayoutPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> appBar2ButtonsSetEditDelete [
	| app |

	app := self application.
	app layout appBar2
		actionItemsClear;
		actionItemsAdd: (app actionItemNamed: #crudDelete);
		actionItemsAdd: (app actionItemNamed: #crudUpdate);
		valueChanged;
		yourself
]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> appBar2ButtonsSetSaveCancel [
	| app |

	app := self application.
	app layout appBar2
		actionItemsClear;
		actionItemsAdd: (app actionItemNamed: #crudSave);
		actionItemsAdd: (app actionItemNamed: #crudCancel);
		valueChanged;
		yourself
]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> handleAction: anObject [
	| type |

	self logTrace5: anObject printString method: 'handleAction:'.

	type := anObject parameterAt: #type.

	type = 'save' ifTrue: [ | theModel |
		theModel := self layout pane2 paneContent.
		theModel wrappedModel handleSave: anObject.
		theModel valueChanged.
		self layout pane2 valueChanged.
		self appBar2ButtonsSetEditDelete.
		theModel isNew ifTrue: [
			self layout pane1 paneContent listAdd: theModel.
			self application setDetailWithIndex: 1 ] ].

	type = 'cancel' ifTrue: [
		self appBar2ButtonsSetEditDelete ].

	type = 'update' ifTrue: [
		self layout pane2 valueChanged.
		self appBar2ButtonsSetSaveCancel.
		self view beEditablePane2 ].

	type = 'delete' ifTrue: [ | listDetail |
		self view primaryPaneOnly.
		listDetail := self layout pane1 paneContent.
		listDetail removeDetail.
		self application setDetailWithIndex: 1 ].

	type = 'create' ifTrue: [
		self application setDetailAddNew.
		self layout pane2 valueChanged.
		self view beEditablePane2.
		self view secondaryPaneOnly.
		self appBar2ButtonsSetSaveCancel ].

]

{ #category : 'rendering' }
SlmdResponsiveLayoutPresenter >> renderView [

	self model navRail ifNotNil: [ :value |
		"Render the navRail before the panes, so AppBar can find
		the modal navRail pane for menu button to open"
		self renderChildViewForModel: value atSlotNamed: #navRegion ].

	self model navBar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #navBar ].

	self model paneLayout ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #paneLayout ].

	self model sidesheet ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ].

	self model dockedToolbar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #dockedToolbar ].

	self model floatingToolbar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #floatingToolbar ].

	self model fab ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #fab ].

	self model layoutSettings ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: nil ].

]

{ #category : 'view' }
SlmdResponsiveLayoutPresenter >> viewCreated [

	super viewCreated.

	self subscribeToActionRequest.
	self subscribeToNavRequest.

]
