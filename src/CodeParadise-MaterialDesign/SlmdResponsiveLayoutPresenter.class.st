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
		actionItemsAdd: (app nativeEventSpecAt: #delete);
		actionItemsAdd: (app nativeEventSpecAt: #update);
		valueChanged;
		yourself
]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> appBar2ButtonsSetSaveCancel [
	| app |

	app := self application.
	app layout appBar2
		actionItemsClear;
		actionItemsAdd: (app nativeEventSpecAt: #save);
		actionItemsAdd: (app nativeEventSpecAt: #cancel);
		valueChanged;
		yourself
]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doCancel: anObject [

	self appBar2ButtonsSetEditDelete

]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doCreate: anObject [

	self application setDetailAddNew.
	self layout pane2 valueChanged.
	self view beEditablePane2.
	self view secondaryPaneOnly.
	self appBar2ButtonsSetSaveCancel.


]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doDelete: anObject [

	self view primaryPaneOnly.
	self application listDetailRemove: anObject.

]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doSave: anObject [

	self application listDetailAdd: anObject.
	self layout pane2 valueChanged.
	self appBar2ButtonsSetEditDelete.

]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doSetDetail: anObject [

	self systemLog logTrace: anObject printString method: 'doSetDetail:'.

	anObject isMXSystem ifTrue: [
		self logTrace: 'anObject is MXSystem' ].

	self view secondaryPaneOnly.
	self application handleSetDetail: anObject.

]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doUpdate: anObject [

	self layout pane2 valueChanged.
	self appBar2ButtonsSetSaveCancel.
	self view beEditablePane2.

]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> handleUserEvent: anObject [
	| subtype |

	self systemLog logTrace: anObject printString method: 'handleUserEvent:'.

	subtype := anObject parameterAt: #subtype.

	subtype = #back ifTrue: [
		^ self view primaryPaneOnly ].

	subtype = #setDetail ifTrue: [
		^ self doSetDetail: anObject ].

	subtype = #update ifTrue: [
		^ self doUpdate: anObject ].

	subtype = #save ifTrue: [
		^ self doSave: anObject].

	subtype = #cancel ifTrue: [
		^ self doCancel: anObject ].

	subtype = #delete ifTrue: [
		^ self doDelete: anObject ].

	subtype = #create ifTrue: [
		^ self doCreate: anObject ].

	self application handleUserEvent: anObject.

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
		self renderChildViewForModel: value atSlotNamed: #navRail ].

	self model navRailModal ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #navRailModal ].

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

	self subscribeToUserEvent.
	self application customColorTheme ifNotNil: [ :value |
		self view colorThemePut: value ].
]
