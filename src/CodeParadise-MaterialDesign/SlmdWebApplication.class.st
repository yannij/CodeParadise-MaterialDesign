Class {
	#name : 'SlmdWebApplication',
	#superclass : 'CpMvpWebApplication',
	#instVars : [
		'layout',
		'nativeEventSpecs',
		'userEventSpecs'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'accessing' }
SlmdWebApplication >> actionItems [

	^ self userEventSpecs select: [ :each | each isActionType ]
]

{ #category : 'events' }
SlmdWebApplication >> addActionSubtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel [

	self userEventSpecs add: (SlmdUserEventSpec type: #action subtype: subtype groupTag: groupTag iconName: iconName iconLabel: itemLabel).

]

{ #category : 'events' }
SlmdWebApplication >> addNativeSubtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel [

	self nativeEventSpecs at: subtype put: (SlmdUserEventSpec type: #native subtype: subtype groupTag: groupTag iconName: iconName iconLabel: itemLabel).

]

{ #category : 'events' }
SlmdWebApplication >> addNavSubtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel data: data [

	self userEventSpecs add: (SlmdUserEventSpec type: #nav subtype: subtype groupTag: groupTag iconName: iconName iconLabel: itemLabel data: data)
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

{ #category : 'actions - toolbar' }
SlmdWebApplication >> doLogout [

]

{ #category : 'events' }
SlmdWebApplication >> handleLoginRequested: anObject [

	self traceCr: 'handleLoginRequested:'.

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
SlmdWebApplication >> navItems [

	^ OrderedCollection new
]

{ #category : 'accessing' }
SlmdWebApplication >> navItemsSpecs [

	^ self userEventSpecs select: [ :each | each isNavType ]
]

{ #category : 'events' }
SlmdWebApplication >> navTo: data [
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
SlmdWebApplication >> setDetailWithIndex: index [
	| list detail |

	list := self layout pane1 paneContent list.
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
SlmdWebApplication >> userEventSpecFAB [
	"Subclasses may override"

	^ nil
]

{ #category : 'accessing' }
SlmdWebApplication >> userEventSpecs [

	^ userEventSpecs
]

{ #category : 'accessing' }
SlmdWebApplication >> userEventSpecs: anObject [

	userEventSpecs := anObject
]
