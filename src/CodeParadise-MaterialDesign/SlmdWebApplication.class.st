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

	self systemLog logTrace5: anObject printString method: 'handleViewAction:'.
	aspect := anObject parameterAt: #aspect.
	aspectValue := anObject parameterAt: #value.

	aspect = #layoutUpdate ifTrue: [
		self layoutUpdate: aspectValue.
		^ self ].

	self systemLog logTrace5: aspect asString, ' BEFORE: ', (self layout layoutSettings perform: aspect) printString.
	self layout layoutSettings perform: (aspect, ':') asSymbol with: aspectValue.
	self systemLog logTrace5: aspect asString, '  AFTER: ', (self layout layoutSettings perform: aspect) printString.

]

{ #category : 'actions - toolbar' }
SlmdWebApplication >> doLogout [

]

{ #category : 'events' }
SlmdWebApplication >> doNavTo: anObject [

	self navTo: (anObject parameterAt: #data).

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

	self traceCr: 'handleLoginRequested:'.

]

{ #category : 'events' }
SlmdWebApplication >> handleSetDetail: anObject [

	self traceCr: 'handleSetDetail:'.

	self setDetailWithIndex: (anObject parameterAt: #index).

]

{ #category : 'events' }
SlmdWebApplication >> handleUserEvent: anObject [
	| subtype |

	subtype := anObject parameterAt: #subtype.

	subtype = #navTo ifTrue: [
		^ self doNavTo: anObject ].

	subtype = #setDetail ifTrue: [
		^ self doSetDetail: anObject ].

	subtype = #layoutSettingChange ifTrue: [
		^ self doLayoutSettings: anObject ].

	subtype = #refresh ifTrue: [
		^ self doRefresh: anObject ].

	subtype = #logout ifTrue: [
		^ self doLogout ].

	subtype = #save ifTrue: [
		^ self doSave: anObject].

	subtype = #cancel ifTrue: [
		^ self doCancel: anObject ].

	subtype = #update ifTrue: [
		^ self doUpdate: anObject ].

	subtype = #delete ifTrue: [
		^ self doDelete: anObject ].

	subtype = #create ifTrue: [
		^ self doCreate: anObject ].

	self layout pane1 handleUserEvent: anObject; valueChanged.

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

	self systemLog logTrace5: props printString method: 'layoutUpdate:'.

	m := self layout layoutSettings.
	props keysAndValuesDo: [ :k :v | | setAccessor |
		setAccessor := (k, ':') asSymbol.
		self systemLog logTrace5: k asString, ' BEFORE: ', (m perform: k) printString.
		m perform: setAccessor with: v.
		self systemLog logTrace5: k asString, '  AFTER: ', (m perform: k) printString.
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

{ #category : 'logging' }
SlmdWebApplication >> logTrace5: aString method: methodName [

	self logTrace: aString aspect: self class name, '>>', methodName level: 5
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
SlmdWebApplication >> navTo: data [
]

{ #category : 'actions' }
SlmdWebApplication >> postLoad [
	| toolbar |

	super postLoad.

	self layout navRail navItems: self navItemsToUse; valueChanged.

	self layout fab fab: self userEventSpecFAB; valueChanged.

	toolbar := self layout floatingToolbar.
	(self userEventSpecsInGroup: toolbar actionGroupToUse) do: [ :each |
		toolbar addItem: each ].
	toolbar valueChanged.

	toolbar := self layout dockedToolbar.
	(self userEventSpecsInGroup: toolbar actionGroupToUse) do: [ :each |
		toolbar addItem: each ].
	toolbar valueChanged.

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
		addNativeSubtype: #read groupTag: #toolbar iconName: 'file-ruled' iconLabel: 'View';
		addNativeSubtype: #update groupTag: #toolbar iconName: 'pencil' iconLabel: 'Edit';
		addNativeSubtype: #delete groupTag: #toolbar iconName: 'trash' iconLabel: 'Delete';
		addNativeSubtype: #save groupTag: #toolbar iconName: 'check' iconLabel: 'Save';
		addNativeSubtype: #cancel groupTag: #toolbar iconName: 'x' iconLabel: 'Cancel';
		addNativeSubtype: #refresh groupTag: #primary iconName: 'arrow-clockwise' iconLabel: 'Refresh';
		addNativeSubtype: #home groupTag: #primary iconName: 'house' iconLabel: 'Home';
		addNativeSubtype: #back groupTag: #primary iconName: 'arrow-left' iconLabel: 'Back';
		addNativeSubtype: #modalNav groupTag: #primary iconName: 'list' iconLabel: 'Menu';
		addNativeSubtype: #settingsOpen groupTag: #primary iconName: 'gear' iconLabel: 'Settings';
		addNativeSubtype: #login groupTag: #primary iconName: 'box-arrow-in-right' iconLabel: 'Login';
		addNativeSubtype: #logout groupTag: #primary iconName: 'box-arrow-left' iconLabel: 'Logout';
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

{ #category : 'accessing' }
SlmdWebApplication >> userEventSpecsInGroup: aGroupName [

	^ self actionItems select: [ :each | each groupTag = aGroupName ]
]
