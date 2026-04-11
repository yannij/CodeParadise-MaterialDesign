Class {
	#name : 'WamWebApplication',
	#superclass : 'CpMvpWebApplication',
	#instVars : [
		'layout',
		'nativeEventSpecs',
		'userEventSpecs',
		'session'
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

{ #category : 'tags' }
WamWebApplication class >> isAbstractTag [

	"The method is present to indicate the receiver is abstract.
	This method will NOT be evaluated to decide if the receiver is abstract."
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

{ #category : 'navigation' }
WamWebApplication >> appBar1Headline: aString [

	self layout appBar1 headline: aString; valueChanged
]

{ #category : 'navigation' }
WamWebApplication >> appBar2Headline: aString [

	self layout appBar2 headline: aString; valueChanged
]

{ #category : 'accessing' }
WamWebApplication >> applicationModel [

	"Answer the Model for the receiver, which is the receiver itself"

	^ self
]

{ #category : 'iam' }
WamWebApplication >> authenticateLoginRequest: parameters [
	| yesOrNo username password |

	yesOrNo := parameters at: #yesOrNo ifAbsent: [ false ].
	yesOrNo ifFalse: [ ^ self ].

	username := parameters at: #loginUsername ifAbsent: [].
	password := parameters at: #loginPassword ifAbsent: [].

	(self authenticateUsername: username password: password)
		ifTrue: [ "Note the username" ]
		ifFalse: [ self confirm: 'Login failed!' onAnswer: [ :answer | ] ]
]

{ #category : 'iam' }
WamWebApplication >> authenticateUsername: aUsername password: aPassword [

	^ aPassword = 'todo'
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

{ #category : 'events' }
WamWebApplication >> checkRedirectUrl [

	self sendMessage: (MessageSend
		receiver: self clientBehaviorClass clientId
		selector: #announceSessionParameters)

]

{ #category : 'actions' }
WamWebApplication >> confirm: aString onAnswer: aBlock [
	| d |

	d := self layout dialog
		label: '';
		setContentModel: (WamYesOrNoDialogModel new
			message: aString;
			answerBlock: [ :parameters | aBlock value: (parameters at: #yesOrNo ifAbsent: []) ];
			yourself);
		yourself.
	d open: true.
	d valueChanged.

]

{ #category : 'accessing' }
WamWebApplication >> customColorTheme [

	^ nil
]

{ #category : 'actions' }
WamWebApplication >> dialogOpen: aBoolean [
	| d |

	d := self layout dialog.
	d open: aBoolean.
	d valueChanged.

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

{ #category : 'installing' }
WamWebApplication >> extensionMethodCategories [

	"Answer the collection of extension method categories needed for the receiver"

	^ super extensionMethodCategories,
		#(webApplicationWebAwesomeExtension)
]

{ #category : 'iam' }
WamWebApplication >> handleLoginRequested: anObject [

	self systemLog logTrace: 'Login Requested'.
	self loginOnAnswer: [ :parameters | self authenticateLoginRequest: parameters ].

]

{ #category : 'events' }
WamWebApplication >> handleRedirectUrlCallback: anEvent [
	| githubSession emailData primaryEmail |

	self systemLog logTrace: anEvent printString.
	githubSession := ZnOAuth2Session github: SsrLogin githubData.
	githubSession handleAuthenticationCallback: anEvent parameters.
	emailData := githubSession getUserEmails.
	primaryEmail := emailData detect: [ :each | each at:'primary' ] ifNone: [].
	primaryEmail ifNotNil: [ :value |
		self session propertyAt: #email put: (value at: 'email') ]

]

{ #category : 'initialization' }
WamWebApplication >> initialize [

	super initialize.

	self setUpNativeEvents.
	self setUpCustomEvents.

	session := WamSessionModel new.
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
WamWebApplication >> listDetailRemove [
	| listDetail |

	listDetail := self layout paneLayout.
	self modelRemove: listDetail detail wrappedModel.
	listDetail list listSet: self allModels.
	self setDetailNone.

]

{ #category : 'model' }
WamWebApplication >> listDetailRemoveConfirm: aString [
	| result |

	result := false.
	self
		confirm: aString
		onAnswer: [ :answer | answer ifTrue: [ result := self listDetailRemove ] ].
	^ result
]

{ #category : 'model' }
WamWebApplication >> listDetailReset [

	self setDetailNone
]

{ #category : 'actions' }
WamWebApplication >> loginContent: aBlock [

	^ WamLogin new
		message: self class appName;
		answerBlock: aBlock;
		yourself
]

{ #category : 'actions' }
WamWebApplication >> loginOnAnswer: aBlock [
	| d |

	d := self layout dialog
		label: '';
		setContentModel: (self loginContent: aBlock);
		yourself.
	d open: true.
	d valueChanged.

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

{ #category : 'model' }
WamWebApplication >> newWrappedModel [

	^ self layout pane1 paneContent modelWrapperClass onNewModel: self newModelInstance
]

{ #category : 'actions' }
WamWebApplication >> postLoad [
	| toolbar appBar leadingAction |

	super postLoad.

	self systemLog logTrace: 'postLoad'.
	self checkRedirectUrl.

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

{ #category : 'actions' }
WamWebApplication >> postReload [

	super postReload.

	self systemLog logTrace: 'postReload'.
	self checkRedirectUrl.

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

{ #category : 'accessing' }
WamWebApplication >> session [

	^ session
]

{ #category : 'accessing' }
WamWebApplication >> session: anObject [

	session := anObject
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
WamWebApplication >> setAppBar2TrailingActionsNone [

	self layout appBar2
		navActionItemsClear;
		valueChanged;
		yourself.

]

{ #category : 'model' }
WamWebApplication >> setDetailAddNew [
	| detail |

	detail := self newWrappedModel.
	self layout paneLayout detail: detail.
	self layout pane2 setPaneContent: detail.
	self appBar2Headline: detail wrappedModel mdAddingTitle.
	self setAppBar2SaveCancel.

]

{ #category : 'model' }
WamWebApplication >> setDetailNone [

	self layout paneLayout detail: nil.
	self layout pane2 setPaneContent: nil.
	self appBar2Headline: ''.
	self setAppBar2TrailingActionsNone.

]

{ #category : 'initialization' }
WamWebApplication >> setUp [

	"Setup the receiver to handle session events from client"

	super setUp.

	self environment
		when: WamEvent send: #handleRedirectUrlCallback: to: self.

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

{ #category : 'model' }
WamWebApplication >> wrapperCancel: aNavActionEvent [

	self setAppBar2EditDelete.

]

{ #category : 'model' }
WamWebApplication >> wrapperDelete: ignored [
	| confirmString detail |

	detail := self layout paneLayout detail.
	confirmString := 'Remove: ', detail wrappedModel mdPrimaryString, ' ?'.
	self listDetailRemoveConfirm: confirmString.

]

{ #category : 'model' }
WamWebApplication >> wrapperSave: aNavActionEvent [
	| theModel listDetail result |

	theModel := self layout pane2 paneContent.
	theModel handleSave: aNavActionEvent.
	theModel valueChanged.

	listDetail := self layout paneLayout.
	theModel isCreating
		ifTrue: [
			result := self modelAdd: listDetail detail wrappedModel.
			listDetail list listSet: self allModels.
			self listDetailReset. ]
		ifFalse: [
			result := self modelUpdate: listDetail detail wrappedModel ].

	self layout pane2 valueChanged.
	self layout pane2 paneContent ifNotNil: [ :value | value valueChanged ].
	self setAppBar2EditDelete.

	^ result

]

{ #category : 'model' }
WamWebApplication >> wrapperUpdate: aNavActionEvent [

	self layout pane2 valueChanged.
	self setAppBar2SaveCancel.

]
