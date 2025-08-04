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
		actionItemsAdd: (app editItemNamed: #delete);
		actionItemsAdd: (app editItemNamed: #update);
		valueChanged;
		yourself
]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> appBar2ButtonsSetSaveCancel [
	| app |

	app := self application.
	app layout appBar2
		actionItemsClear;
		actionItemsAdd: (app editItemNamed: #save);
		actionItemsAdd: (app editItemNamed: #cancel);
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
	| listDetail |

	self view primaryPaneOnly.
	listDetail := self layout pane1 paneContent.
	listDetail removeDetail.
	self application setDetailWithIndex: 1.

]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doLayoutSettings: anObject [
	| aspect aspectValue |

	self logTrace5: anObject printString method: 'handleViewAction:'.
	aspect := anObject parameterAt: #aspect.
	aspectValue := anObject parameterAt: #value.

	aspect = #layoutUpdate ifTrue: [
		self layoutUpdate: aspectValue.
		^ self ].

	self logTrace5: aspect asString, ' BEFORE: ', (self model layoutSettings perform: aspect) printString.
	self model layoutSettings perform: (aspect, ':') asSymbol with: aspectValue.
	self logTrace5: aspect asString, '  AFTER: ', (self model layoutSettings perform: aspect) printString.

]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doRefresh: anObject [

	self logTrace: anObject printString method: 'doRefresh:'.

	self model pane1 paneContent valueChanged.
	self model pane1 valueChanged.

]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doSave: anObject [
	| theModel |

	theModel := self layout pane2 paneContent.
	theModel wrappedModel handleSave: anObject.
	theModel valueChanged.
	self layout pane2 valueChanged.
	self appBar2ButtonsSetEditDelete.
	theModel isNew ifTrue: [
		self layout pane1 paneContent listAdd: theModel.
		self application setDetailWithIndex: 1 ].

]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> doSetDetail: anObject [

	self logTrace: anObject printString method: 'doSetDetail:'.

	self view secondaryPaneOnly.
	self application setDetailWithIndex: (anObject parameterAt: #index).

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

	self logTrace: anObject printString method: 'handleAction:'.

	subtype := anObject parameterAt: #subtype.

	subtype = #back ifTrue: [
		^ self view primaryPaneOnly ].

	subtype = #setDetail ifTrue: [
		^ self doSetDetail: anObject ].

	subtype = #layoutSettingChange ifTrue: [
		^ self doLayoutSettings: anObject ].

	subtype = 'refresh' ifTrue: [
		^ self doRefresh: anObject ].

	subtype = 'save' ifTrue: [
		^ self doSave: anObject].

	subtype = 'cancel' ifTrue: [
		^ self doCancel: anObject ].

	subtype = 'update' ifTrue: [
		^ self doUpdate: anObject ].

	subtype = 'delete' ifTrue: [
		^ self doDelete: anObject ].

	subtype = 'create' ifTrue: [
		^ self doCreate: anObject ].

	self model pane1 handleUserEvent: anObject; valueChanged.

]

{ #category : 'events' }
SlmdResponsiveLayoutPresenter >> layoutUpdate: props [
	| m |

	self logTrace5: props printString method: 'layoutUpdate:'.

	m := self model layoutSettings.
	props keysAndValuesDo: [ :k :v | | setAccessor |
		setAccessor := (k, ':') asSymbol.
		self logTrace5: k asString, ' BEFORE: ', (m perform: k) printString.
		m perform: setAccessor with: v.
		self logTrace5: k asString, '  AFTER: ', (m perform: k) printString.
		].

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

	self subscribeToUserEvent.

]
