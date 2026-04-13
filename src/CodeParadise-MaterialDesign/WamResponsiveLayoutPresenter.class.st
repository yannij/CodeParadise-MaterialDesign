Class {
	#name : 'WamResponsiveLayoutPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'events' }
WamResponsiveLayoutPresenter >> doCancel: aNavActionEvent [

	self application wrapperCancel: aNavActionEvent.
	self view beNotEditablePane2.

]

{ #category : 'events' }
WamResponsiveLayoutPresenter >> doDelete: aNavActionEvent [

	self application wrapperDelete: aNavActionEvent.
	self view primaryPaneOnly.

]

{ #category : 'events' }
WamResponsiveLayoutPresenter >> doSave: aNavActionEvent [
	| result |

	result := self application wrapperSave: aNavActionEvent.
	result = true ifTrue: [
		self view beNotEditablePane2 ].

]

{ #category : 'events' }
WamResponsiveLayoutPresenter >> doUpdate: aNavActionEvent [

	self application wrapperUpdate: aNavActionEvent.
	self view beEditablePane2.

]

{ #category : 'events' }
WamResponsiveLayoutPresenter >> handleNavEvent: aNavEvent [
	| eventId item |

	self systemLog logTrace: '**** ', aNavEvent printString.

	eventId := aNavEvent id.
	eventId = #layoutSettingChange ifTrue: [
		^ self model layoutSettings doLayoutSettings: aNavEvent ].

	item := self model navActionAtId: eventId.
	item ifNotNil: [
		^ self application navTo: item ].

	self systemLog logError: 'Not found: ', aNavEvent id printString.

]

{ #category : 'accessing - model' }
WamResponsiveLayoutPresenter >> layout [

	^ self model
]

{ #category : 'rendering' }
WamResponsiveLayoutPresenter >> renderView [

	self model brandDialog ifNotNil: [ :value |
		"Render this part first,
		so settings are accessible to other widgets"
		self renderChildViewForModel: value atSlotNamed: #brandDialog ].

	self model dialog ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #dialog ].

	self model navRail ifNotNil: [ :value |
		"Render the navRail before the panes, so AppBar can find
		the modal navRail pane for menu button to open"
		self renderChildViewForModel: value usingPresenter: WamNavRailPresenter atSlotNamed: #navRail.
		self renderChildViewForModel: value usingPresenter: WamNavRailModalPresenter atSlotNamed: #navRailModal.
		self renderChildViewForModel: value usingPresenter: WamNavBarPresenter atSlotNamed: #navBar ].

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

	self model layoutReady ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #layoutReady ].

]

{ #category : 'view' }
WamResponsiveLayoutPresenter >> viewCreated [

	super viewCreated.

	self view when: (WamSessionEvent id: #login) send: #handleLoginRequested: to: self application.

]

{ #category : 'view' }
WamResponsiveLayoutPresenter >> viewInitialized [

	super viewInitialized.

	self application customColorTheme ifNotNil: [ :value |
		self view colorThemePut: value ].

	self view applyDesignTokensTheme.

	"self view popupSetUp"

]
