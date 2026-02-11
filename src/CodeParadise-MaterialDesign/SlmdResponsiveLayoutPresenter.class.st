Class {
	#name : 'SlmdResponsiveLayoutPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doCancel: aNavActionEvent [

	self application setAppBar2EditDelete.
	self view beNotEditablePane2.

]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doCreate: aNavActionEvent [

	self application setDetailAddNew.
	self layout pane2 valueChanged.
	self view beEditablePane2.
	self view secondaryPaneOnly.
	self application setAppBar2SaveCancel.


]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doDelete: aNavActionEvent [

	self view primaryPaneOnly.
	self application listDetailRemove: aNavActionEvent.

]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doSave: aNavActionEvent [
	| result |

	result := self application listDetailAdd: aNavActionEvent.
	self layout pane2 valueChanged.
	self layout pane2 paneContent valueChanged.
	self application setAppBar2EditDelete.
	result = true ifTrue: [
		self view beNotEditablePane2 ].

]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doUpdate: aNavActionEvent [

	self layout pane2 valueChanged.
	self application setAppBar2SaveCancel.
	self view beEditablePane2.

]

{ #category : 'accessing - model' }
SlmdResponsiveLayoutPresenter >> layout [

	^ self model
]

{ #category : 'rendering' }
SlmdResponsiveLayoutPresenter >> renderView [

	self model navRail ifNotNil: [ :value |
		"Render the navRail before the panes, so AppBar can find
		the modal navRail pane for menu button to open"
		self renderChildViewForModel: value usingPresenter: SlmdNavRailPresenter atSlotNamed: #navRail.
		self renderChildViewForModel: value usingPresenter: SlmdNavRailModalPresenter atSlotNamed: #navRailModal.
		self renderChildViewForModel: value usingPresenter: SlmdNavBarPresenter atSlotNamed: #navBar ].

	self model paneLayout ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #paneLayout ].

	self model sidesheet ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ].

	self model dialog ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #dialog ].

	self model dockedToolbar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #dockedToolbar ].

	self model floatingToolbar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #floatingToolbar ].

	self model fab ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #fab ].

	self model layoutSettings ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #layoutSettings ].

	self view layoutInitialSetUp: self model layoutSettings asMap.

]

{ #category : 'view' }
SlmdResponsiveLayoutPresenter >> viewCreated [

	super viewCreated.

	self view addLoginDialog: self application class appName.

]

{ #category : 'view' }
SlmdResponsiveLayoutPresenter >> viewInitialized [

	super viewInitialized.

	self application customColorTheme ifNotNil: [ :value |
		self view colorThemePut: value ].

	"self view popupSetUp"

]
