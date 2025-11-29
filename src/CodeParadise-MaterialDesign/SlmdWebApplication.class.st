Class {
	#name : 'SlmdWebApplication',
	#superclass : 'CpMvpWebApplication',
	#instVars : [
		'layout',
		'nativeEventSpecs',
		'userEventSpecs'
	],
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'class initialization' }
SlmdWebApplication class >> beLoaded [

	SlmdLog beLoaded
]

{ #category : 'accessing' }
SlmdWebApplication >> actionItems [

	^ self userEventSpecs select: [ :each | each isActionType ]
]

{ #category : 'accessing' }
SlmdWebApplication >> actionItemsInGroup: aGroupName [

	^ self actionItems select: [ :each | each groupTag = aGroupName ]
]

{ #category : 'events' }
SlmdWebApplication >> addActionSubtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel [

	self userEventSpecs add: (SlmdNavActionModel newActionSubtype: subtype groupTag: groupTag iconName: iconName iconLabel: itemLabel data: nil).

]

{ #category : 'events' }
SlmdWebApplication >> addNativeSubtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel [

	self nativeEventSpecs at: subtype put: (SlmdNavActionModel newNativeSubtype: subtype groupTag: groupTag iconName: iconName iconLabel: itemLabel data: nil).

]

{ #category : 'events' }
SlmdWebApplication >> addNavSubtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel data: data [

	self userEventSpecs add: (SlmdNavActionModel newNavSubtype: subtype groupTag: groupTag iconName: iconName iconLabel: itemLabel data: data)
]

{ #category : 'model' }
SlmdWebApplication >> allModels [

	self subclassResponsibility
]

{ #category : 'accessing' }
SlmdWebApplication >> applicationModel [

	"Answer the Model for the receiver, which is the receiver itself"

	^ self
]

{ #category : 'accessing' }
SlmdWebApplication >> customColorTheme [

	^ nil
]

{ #category : 'events' }
SlmdWebApplication >> doLayoutSettings: anObject [
	| aspect aspectValue |

	self systemLog logTrace: anObject printString level: 5.
	aspect := anObject parameterAt: #aspect.
	aspectValue := anObject parameterAt: #value.

	aspect = #layoutUpdate ifTrue: [
		self layoutUpdate: aspectValue.
		^ self ].

	self systemLog logTrace: aspect asString, ' BEFORE: ', (self layout layoutSettings perform: aspect) printString level: 5.
	self layout layoutSettings perform: (aspect, ':') asSymbol with: aspectValue.
	self systemLog logTrace: aspect asString, '  AFTER: ', (self layout layoutSettings perform: aspect) printString level: 5.

]

{ #category : 'actions - toolbar' }
SlmdWebApplication >> doLogout [

]

{ #category : 'events' }
SlmdWebApplication >> doNavToItemNamed: aNavName [
	| item |

	item := self navItemNamed: aNavName.
	item ifNil: [
		self systemLog logError: 'Not found: doNavToItemNamed:', aNavName.
		^ self ].
	self navTo: item.

]

{ #category : 'events' }
SlmdWebApplication >> doRefresh: anObject [

	"self logTrace: anObject printString method: 'doRefresh:'."

	self refresh.
	"self model pane1 paneContent valueChanged.
	self model pane1 valueChanged."

]

{ #category : 'events' }
SlmdWebApplication >> handleLoginRequested: anObject [

	self systemLog logTrace: ' Login Requested'.

]

{ #category : 'events' }
SlmdWebApplication >> handleSetDetail: anObject [

	self systemLog logTrace: 'handleSetDetail:'.

	self setDetailWithIndex: (anObject parameterAt: #index).

]

{ #category : 'initialization' }
SlmdWebApplication >> initialize [

	super initialize.

	self setUpNativeEvents.
	self setUpCustomEvents.

	layout := SlmdResponsiveLayoutModel new.

]

{ #category : 'accessing' }
SlmdWebApplication >> layout [

	^ layout
]

{ #category : 'accessing' }
SlmdWebApplication >> layout: anObject [

	layout := anObject
]

{ #category : 'events' }
SlmdWebApplication >> layoutUpdate: props [
	| m |

	self systemLog logTrace: props printString level: 5.

	m := self layout layoutSettings.
	props keysAndValuesDo: [ :k :v | | setAccessor |
		setAccessor := (k, ':') asSymbol.
		self systemLog logTrace: k asString, ' BEFORE: ', (m perform: k) printString level: 5.
		m perform: setAccessor with: v.
		self systemLog logTrace: k asString, '  AFTER: ', (m perform: k) printString level: 5.
		].

	"The appbar leading action might depend on two pane mode"
	self layout appBar1 valueChanged.
	self layout appBar2 valueChanged.

	self layout navRail valueChanged.
	"self layout navRailModal valueChanged."

]

{ #category : 'model' }
SlmdWebApplication >> listDetailAdd: anObject [
	| theModel listDetail |

	theModel := self layout pane2 paneContent.
	theModel wrappedModel handleSave: anObject.
	theModel valueChanged.

	listDetail := self layout pane1 paneContent.
	theModel isNew
		ifTrue: [
			self modelAdd: listDetail detail wrappedModel.
			listDetail listSet: self allModels.
			self setDetailWithIndex: 1 ]
		ifFalse: [
			self modelUpdate: listDetail detail wrappedModel ].
.

]

{ #category : 'model' }
SlmdWebApplication >> listDetailRemove: ignored [
	| listDetail |

	listDetail := self layout pane1 paneContent.
	self modelRemove: listDetail detail wrappedModel.
	listDetail listSet: self allModels.
	self setDetailWithIndex: 1.

]

{ #category : 'model' }
SlmdWebApplication >> modelAdd: aModel [

	self subclassResponsibility
]

{ #category : 'accessing' }
SlmdWebApplication >> modelClass [

	self subclassResponsibility
]

{ #category : 'model' }
SlmdWebApplication >> modelRemove: aModel [

	self subclassResponsibility
]

{ #category : 'model' }
SlmdWebApplication >> modelUpdate: aModel [

	"self subclassResponsibility"
]

{ #category : 'accessing' }
SlmdWebApplication >> nativeEventSpecAt: aKey [

	^ self nativeEventSpecs at: aKey ifAbsent: []
]

{ #category : 'accessing' }
SlmdWebApplication >> nativeEventSpecs [

	^ nativeEventSpecs
]

{ #category : 'accessing' }
SlmdWebApplication >> nativeEventSpecs: anObject [

	nativeEventSpecs := anObject
]

{ #category : 'accessing' }
SlmdWebApplication >> navItemNamed: aNavName [
	"Look at layout's nav model for a nav item that matches aNavName,
	and answer it, or nil"
	| navAction |

	navAction := self layout navRail navActionDetect: [ :each | each "itemName" iconLabel = aNavName ] ifNone: [].
	navAction ifNotNil: [ :value | ^ value ].

	^ nil
]

{ #category : 'accessing' }
SlmdWebApplication >> navItemSpecsInGroup: aGroupName [

	^ self navItemsSpecs select: [ :each | each groupTag = aGroupName ]
]

{ #category : 'accessing' }
SlmdWebApplication >> navItemsSpecs [

	^ self userEventSpecs select: [ :each | each isNavType ]
]

{ #category : 'accessing' }
SlmdWebApplication >> navItemsToUse [

	^ self navItemSpecsInGroup: #primary
]

{ #category : 'events' }
SlmdWebApplication >> navTo: aNavActionEvent [

	self layout pane1 processNavActionEvent: aNavActionEvent; valueChanged.
]

{ #category : 'actions' }
SlmdWebApplication >> postLoad [
	| toolbar appBar leadingAction |

	super postLoad.

	self layout navRail navItems: self navItemsToUse; valueChanged.

	self layout fab fab: self userEventSpecFAB; valueChanged.

	toolbar := self layout floatingToolbar.
	(self actionItemsInGroup: toolbar actionGroupToUse) do: [ :each |
		toolbar addItem: each ].
	toolbar valueChanged.

	toolbar := self layout dockedToolbar.
	(self actionItemsInGroup: toolbar actionGroupToUse) do: [ :each |
		toolbar addItem: each ].
	toolbar valueChanged.

	appBar := self layout appBar1.
	leadingAction := self nativeEventSpecAt: (appBar isPrimary ifTrue: [ #modalNav ] ifFalse: [ #back ]).
	appBar leadingAction: leadingAction.

	appBar := self layout appBar2.
	leadingAction := self nativeEventSpecAt: (appBar isPrimary ifTrue: [ #modalNav ] ifFalse: [ #back ]).
	appBar leadingAction: leadingAction.

]

{ #category : 'events' }
SlmdWebApplication >> processNavActionEvent: anObject [
	| subtype |

	subtype := anObject parameterAt: #subtype.

	subtype = #layoutSettingChange ifTrue: [
		^ self doLayoutSettings: anObject ].

	subtype = #refresh ifTrue: [
		^ self doRefresh: anObject ].

	subtype = #logout ifTrue: [
		^ self doLogout ].

	self layout pane1 processNavActionEvent: anObject; valueChanged.

]

{ #category : 'events' }
SlmdWebApplication >> refresh [
]

{ #category : 'model' }
SlmdWebApplication >> setDetailAddNew [
	| detail |

	detail := SlmdItemWrapperModel onNewModel: self modelClass new.

	self layout pane1 paneContent detail: detail.
	self layout pane2 setPaneContent: detail.

]

{ #category : 'model' }
SlmdWebApplication >> setDetailNone [

	self layout pane1 paneContent detail: nil.
	self layout pane2 setPaneContent: nil.

]

{ #category : 'model' }
SlmdWebApplication >> setDetailWithIndex: index [
	| list detail |

	list := self layout pane1 paneContent list.
	list isEmpty ifTrue: [
		^ self setDetailNone ].

	detail := list at: index.
	self layout pane1 paneContent detail: detail.
	self layout pane2 setPaneContent: detail.

]

{ #category : 'events' }
SlmdWebApplication >> setUpCustomEvents [
	"Subclasses may enhance"

	userEventSpecs := OrderedCollection new
]

{ #category : 'events' }
SlmdWebApplication >> setUpNativeEvents [

	nativeEventSpecs := IdentityDictionary new.
	self
		addNativeSubtype: #create groupTag: #fab iconName: 'plus' iconLabel: 'Add';
		addNativeSubtype: #read groupTag: #toolbar iconName: 'file-lines' iconLabel: 'View';
		addNativeSubtype: #update groupTag: #toolbar iconName: 'pencil' iconLabel: 'Edit';
		addNativeSubtype: #delete groupTag: #toolbar iconName: 'trash' iconLabel: 'Delete';
		addNativeSubtype: #save groupTag: #toolbar iconName: 'check' iconLabel: 'Save';
		addNativeSubtype: #cancel groupTag: #toolbar iconName: 'xmark' iconLabel: 'Cancel';
		addNativeSubtype: #refresh groupTag: #primary iconName: 'rotate-right' iconLabel: 'Refresh';
		addNativeSubtype: #home groupTag: #primary iconName: 'house' iconLabel: 'Home';
		addNativeSubtype: #back groupTag: #primary iconName: 'arrow-left' iconLabel: 'Back';
		addNativeSubtype: #modalNav groupTag: #primary iconName: 'bars' iconLabel: 'Menu';
		addNativeSubtype: #settingsOpen groupTag: #primary iconName: 'gear' iconLabel: 'Settings';
		addNativeSubtype: #login groupTag: #primary iconName: 'right-to-bracket' iconLabel: 'Login';
		addNativeSubtype: #logout groupTag: #primary iconName: 'right-from-bracket' iconLabel: 'Logout';
		yourself.

]

{ #category : 'accessing' }
SlmdWebApplication >> systemLog [

	^ SlmdLog
]

{ #category : 'accessing' }
SlmdWebApplication >> userEventSpecFAB [

	^ self nativeEventSpecs detect: [ :each | each groupTag = #fab ] ifNone: []
]

{ #category : 'accessing' }
SlmdWebApplication >> userEventSpecs [

	^ userEventSpecs
]

{ #category : 'accessing' }
SlmdWebApplication >> userEventSpecs: anObject [

	userEventSpecs := anObject
]
