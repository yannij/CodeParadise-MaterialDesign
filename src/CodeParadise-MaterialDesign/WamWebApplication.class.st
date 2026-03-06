Class {
	#name : 'WamWebApplication',
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

{ #category : 'accessing' }
WamWebApplication class >> appIcon [
	"Answer icon name to use for Nav item.
	Subclasses should override.

	Note: this method is defined on class side because
	during initialization a widget's application may still be nil."

	^ #gem
]

{ #category : 'accessing' }
WamWebApplication class >> appName [
	"Answer name to be shown in AppBar headline, and in Nav icon label.
	Subclasses should override.

	Note: this method is defined on class side because
	during initialization a widget's application may still be nil."

	^ #Brand
]

{ #category : 'class initialization' }
WamWebApplication class >> beLoaded [

	WamLog beLoaded
]

{ #category : 'events' }
WamWebApplication >> addNativeSubtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel [

	self nativeEventSpecs at: subtype put: (WamNavActionModel newNavAction: subtype groupTag: groupTag iconName: iconName iconLabel: itemLabel data: nil).

]

{ #category : 'events' }
WamWebApplication >> addNavActionAt: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel data: data [

	self userEventSpecs add: (WamNavActionModel newNavAction: subtype groupTag: groupTag iconName: iconName iconLabel: itemLabel data: data)
]

{ #category : 'model' }
WamWebApplication >> allModels [

	self subclassResponsibility
]

{ #category : 'accessing' }
WamWebApplication >> applicationModel [

	"Answer the Model for the receiver, which is the receiver itself"

	^ self
]

{ #category : 'actions' }
WamWebApplication >> brandDialogOpen [
	| d |

	d := self layout brandDialog.
		"label: 'Brand';
		setContentModel: self layout layoutSettings;"
	"d contentModel valueChanged."
	d open: true.
	d valueChanged.

]

{ #category : 'accessing' }
WamWebApplication >> customColorTheme [

	^ nil
]

{ #category : 'actions - toolbar' }
WamWebApplication >> doLogout [

]

{ #category : 'events' }
WamWebApplication >> doRefresh: anObject [

	"self logTrace: anObject printString method: 'doRefresh:'."

	self refresh.
	"self model pane1 paneContent valueChanged.
	self model pane1 valueChanged."

]

{ #category : 'accessing' }
WamWebApplication >> eventSpecMeta [

	^ self nativeEventSpecAt: #meta
]

{ #category : 'events' }
WamWebApplication >> handleLoginRequested: anObject [

	self systemLog logTrace: ' Login Requested'.

]

{ #category : 'initialization' }
WamWebApplication >> initialize [

	super initialize.

	self setUpNativeEvents.
	self setUpCustomEvents.

	layout := WamResponsiveLayoutModel new.

]

{ #category : 'accessing' }
WamWebApplication >> layout [

	^ layout
]

{ #category : 'accessing' }
WamWebApplication >> layout: anObject [

	layout := anObject
]

{ #category : 'model' }
WamWebApplication >> listDetailAdd: anObject [
	| theModel listDetail result |

	theModel := self layout pane2 paneContent.
	theModel wrappedModel handleSave: anObject.
	theModel valueChanged.

	listDetail := self layout paneLayout.
	theModel isCreating
		ifTrue: [
			result := self modelAdd: listDetail detail wrappedModel.
			listDetail list listSet: self allModels.
			self listDetailReset. ]
		ifFalse: [
			result := self modelUpdate: listDetail detail wrappedModel ].

	^ result

]

{ #category : 'model' }
WamWebApplication >> listDetailRemove: ignored [
	| listDetail |

	listDetail := self layout paneLayout.
	self modelRemove: listDetail detail wrappedModel.
	listDetail list listSet: self allModels.
	self setDetailNone.

]

{ #category : 'model' }
WamWebApplication >> listDetailReset [
	"| list detail |

	list := self layout pane1 paneContent list.
	list isEmpty ifTrue: [
		^ self setDetailNone ].

	detail := list first.
	self layout pane1 paneContent detail: detail.
	self layout pane2 setPaneContent: detail."
	self layout pane2 setPaneContent: nil.
	self setAppBar2EditDelete.

]

{ #category : 'model' }
WamWebApplication >> modelAdd: aModel [

	self subclassResponsibility
]

{ #category : 'accessing' }
WamWebApplication >> modelClass [

	self subclassResponsibility
]

{ #category : 'model' }
WamWebApplication >> modelRemove: aModel [

	self subclassResponsibility
]

{ #category : 'model' }
WamWebApplication >> modelUpdate: aModel [

	"self subclassResponsibility"
]

{ #category : 'accessing' }
WamWebApplication >> nativeEventSpecAt: aKey [

	^ self nativeEventSpecs at: aKey ifAbsent: []
]

{ #category : 'accessing' }
WamWebApplication >> nativeEventSpecs [

	^ nativeEventSpecs
]

{ #category : 'accessing' }
WamWebApplication >> nativeEventSpecs: anObject [

	nativeEventSpecs := anObject
]

{ #category : 'accessing' }
WamWebApplication >> navItemNamed: aNavName [
	"Look at layout's nav model for a nav item that matches aNavName,
	and answer it, or nil"
	| navAction |

	navAction := self layout navRail navActionDetect: [ :each | each "itemName" iconLabel = aNavName ] ifNone: [].
	navAction ifNotNil: [ :value | ^ value ].

	^ nil
]

{ #category : 'accessing' }
WamWebApplication >> navItemSpecsInGroup: aGroupName [

	^ self userEventSpecs select: [ :each | each groupTag = aGroupName ]
]

{ #category : 'accessing' }
WamWebApplication >> navItemsToUse [

	^ self navItemSpecsInGroup: #primary
]

{ #category : 'events' }
WamWebApplication >> navTo: aNavActionEvent [

	aNavActionEvent eventId = #brand ifTrue: [
		^ self brandDialogOpen ].

	self layout pane1 processNavActionEvent: aNavActionEvent; valueChanged.
]

{ #category : 'model' }
WamWebApplication >> newModelInstance [

	^ self modelClass new

]

{ #category : 'actions' }
WamWebApplication >> postLoad [
	| toolbar appBar leadingAction |

	super postLoad.

	self layout navRail navItems: self navItemsToUse; valueChanged.
	self layout fab fab: self userEventSpecFAB; valueChanged.

	toolbar := self layout floatingToolbar.
	(self navItemSpecsInGroup: toolbar actionGroupToUse) do: [ :each |
		toolbar addItem: each ].
	toolbar valueChanged.

	toolbar := self layout dockedToolbar.
	(self navItemSpecsInGroup: toolbar actionGroupToUse) do: [ :each |
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
WamWebApplication >> processNavActionEvent: aNavEvent model: aModel [
	| eventId |

	self systemLog logTrace: aNavEvent printString.

	eventId := aNavEvent id.

	aNavEvent id = #setDetail ifTrue: [
		self layout paneLayout detail: aModel.
		self layout pane2 setPaneContent: aModel.
		self setAppBar2EditDelete.
		^ self ].

	eventId = #refresh ifTrue: [
		^ self doRefresh: aNavEvent ].

	eventId = #logout ifTrue: [
		^ self doLogout ].

	self layout pane1 processNavActionEvent: aNavEvent; valueChanged.

]

{ #category : 'events' }
WamWebApplication >> refresh [
]

{ #category : 'model' }
WamWebApplication >> setAppBar2EditDelete [

	self layout appBar2
		navActionItemsClear;
		navActionItemsAdd: (self nativeEventSpecAt: #delete);
		navActionItemsAdd: (self nativeEventSpecAt: #update);
		valueChanged;
		yourself.

]

{ #category : 'model' }
WamWebApplication >> setAppBar2SaveCancel [

	self layout appBar2
		navActionItemsClear;
		navActionItemsAdd: (self nativeEventSpecAt: #save);
		navActionItemsAdd: (self nativeEventSpecAt: #cancel);
		valueChanged;
		yourself.

]

{ #category : 'model' }
WamWebApplication >> setDetailAddNew [
	| detail |

	detail := self layout pane1 paneContent modelWrapperClass onNewModel: self newModelInstance.

	self layout paneLayout detail: detail.
	self layout pane2 setPaneContent: detail.

]

{ #category : 'model' }
WamWebApplication >> setDetailNone [

	self layout paneLayout detail: nil.
	self layout pane2 setPaneContent: nil.

]

{ #category : 'events' }
WamWebApplication >> setUpCustomEvents [
	"Subclasses may enhance"

	userEventSpecs := OrderedCollection new
]

{ #category : 'events' }
WamWebApplication >> setUpNativeEvents [

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
		addNativeSubtype: #meta groupTag: #toolbar iconName: 'star' iconLabel: 'Meta';
		addNativeSubtype: #modalNav groupTag: #primary iconName: 'bars' iconLabel: 'Menu';
		addNativeSubtype: #brand groupTag: #brand iconName: self class appIcon iconLabel: self class appName;
		addNativeSubtype: #login groupTag: #primary iconName: 'right-to-bracket' iconLabel: 'Login';
		addNativeSubtype: #logout groupTag: #primary iconName: 'right-from-bracket' iconLabel: 'Logout';
		yourself.

]

{ #category : 'accessing' }
WamWebApplication >> systemLog [

	^ WamLog
]

{ #category : 'accessing' }
WamWebApplication >> userEventSpecFAB [

	^ self nativeEventSpecs detect: [ :each | each groupTag = #fab ] ifNone: []
]

{ #category : 'accessing' }
WamWebApplication >> userEventSpecs [

	^ userEventSpecs
]

{ #category : 'accessing' }
WamWebApplication >> userEventSpecs: anObject [

	userEventSpecs := anObject
]
