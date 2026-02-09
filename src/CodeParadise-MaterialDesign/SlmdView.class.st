Class {
	#name : 'SlmdView',
	#superclass : 'CpView',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'accessing' }
SlmdView class >> eventAspectCrud [

	^ #crud
]

{ #category : 'utilities' }
SlmdView >> beEditablePane2 [

	self layoutViewLazy beEditablePane2
]

{ #category : 'utilities' }
SlmdView >> beNotEditablePane2 [

	self layoutViewLazy beNotEditablePane2
]

{ #category : 'utilities' }
SlmdView >> dropdownAppbar: actionList [
	| menu iconName trigger dropdown div |

	menu := self dropdownMenuItems: actionList.
	iconName := 'ellipsis-vertical'.

	trigger := #div asHtmlTag
		appendChild: (WaIcon fullyNamed: iconName).
	trigger addClass: 'smd-toolbar-icon'.

	dropdown := WaDropdown new
		replaceAllChildrenWith: trigger atSlotNamed: #trigger;
		appendChild: menu;
		yourself.

	div := #div asHtmlTag appendChild: dropdown; addClass: 'smd-toolbar-item'; yourself.

	^ div

]

{ #category : 'utilities' }
SlmdView >> dropdownMenuItems: actionList [
	| menu |

	menu := #div asHtmlTag.
	menu addClass: 'smd-menu'.
	actionList do: [ :each | | icon |
		icon := (WaIcon fullyNamed: (each at: #iconName))
			label: (each at: #iconName);
			addClass: 'smd-menu-icon';
			yourself.
		menu appendChild: (WaDropdownItem new
			addClass: 'smd-menu-item';
			when: CpClickEvent basicPrimary do: [ self triggerNavEvent: each ] for: self;
			icon: icon;
			textContent: (each at: #iconLabel);
			yourself) ].

	^ menu

]

{ #category : 'utilities' }
SlmdView >> dropdownNavbar: actionList [
	| menu iconName trigger dropdown div |

	menu := self dropdownMenuItems: actionList.
	iconName := 'ellipsis-vertical'.

	trigger := #div asHtmlTag
		appendChild: (WaIcon fullyNamed: iconName).
	trigger addClass: 'smd-navbar-dropdown'.

	dropdown := WaDropdown new
		replaceAllChildrenWith: trigger atSlotNamed: #trigger;
		appendChild: menu;
		yourself.

	div := #div asHtmlTag appendChild: dropdown; addClass: 'smd-navbar-item'; yourself.

	^ div

]

{ #category : 'utilities' }
SlmdView >> element: element display: aBoolean [

	"self logTrace: element printString method: 'element:display:'."

	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ]
]

{ #category : 'utilities' }
SlmdView >> element: element show: aBoolean [

	"self logTrace: element printString method: 'element:show:'."

	element ifNotNil: [
		element classed: #'smd-hidden' if: aBoolean not ]
]

{ #category : 'utilities' }
SlmdView >> findByIdInLightDom: anId [

	^ self
		findByIdInLightDom: anId
		ifNone: [ self error: '#findByIdInLightDom: ', anId asString, ' is nil' ].
]

{ #category : 'utilities' }
SlmdView >> findByIdInLightDom: anId ifNone: aBlock [
	| element |

	element := CpHtmlElement documentBody firstDescendantMatching: '#', anId.
	element ifNil: [ ^ aBlock value ].
	^ element

]

{ #category : 'utilities' }
SlmdView >> findByIdInShadowDom: anId [

	^ self
		findByIdInShadowDom: anId
		ifNone: [ self error: '#findByIdInShadowDom: ', anId asString, ' is nil' ].
]

{ #category : 'utilities' }
SlmdView >> findByIdInShadowDom: anId ifNone: aBlock [
	| element |

	element := self shadowedElementWithId: anId.
	element ifNil: [ ^ aBlock value ].
	^ element

]

{ #category : 'utilities' }
SlmdView >> findFirstDescendantInShadowDom: anId [

	^ self
		findFirstDescendantInShadowDom: anId
		ifNone: [ self error: '#findFirstDescendantInShadowDom: ', anId asString, ' is nil' ].
]

{ #category : 'utilities' }
SlmdView >> findFirstDescendantInShadowDom: anId ifNone: aBlock [
	| element |

	element := self shadowedFirstDescendantMatching: anId.
	element ifNil: [ ^ aBlock value ].
	^ element

]

{ #category : 'utilities' }
SlmdView >> iconButton: iconName navAction: aNavAction [

	^ WaButton new
		appendChild: (WaIcon fullyNamed: iconName);
		when: CpClickEvent primary do: [ :event | self triggerNavEvent: aNavAction ] for: self;
		yourself
]

{ #category : 'utilities' }
SlmdView >> iconButtonForAction: aNavAction [
	| iconName |

	iconName := aNavAction at: #iconName.
	^ self iconButton: iconName navAction: aNavAction
]

{ #category : 'utilities' }
SlmdView >> iconButtonForAction: aNavAction css: cssClass [
	| iconName tag |

	iconName := aNavAction at: #iconName.

	tag := #div asHtmlTag
		appendChild: ((WaIcon fullyNamed: iconName)
			label: iconName;
			addClass: 'smd-toolbar-icon';
			when: CpClickEvent primary do: [ :event | self triggerNavEvent: aNavAction ] for: self;
			yourself);
		yourself.

	cssClass ifNotNil: [ tag addClass: cssClass ].

	^ tag
]

{ #category : 'utilities' }
SlmdView >> iconButtonNamed: iconName class: cssClass navAction: aNavAction [

	"^ #div asHtmlTag
		addClass: cssClass;
		appendChild: ((WaIcon fullyNamed: iconName) label: iconName; yourself);
		when: CpClickEvent primary do: [ :event | self triggerNavEvent: aNavAction ] for: self;
		yourself"
	^ (WaIcon fullyNamed: iconName)
		label: iconName;
		addClass: cssClass;
		when: CpClickEvent primary do: [ :event | self triggerNavEvent: aNavAction ] for: self;
		yourself
]

{ #category : 'find element' }
SlmdView >> layoutViewFind [
	| appComponent |

	"^ WamResponsiveLayoutView first"
	"^ self class document firstDescendantMatching: WamResponsiveLayoutView asCssSelector"
	appComponent := CpHtmlElement documentBody children detect: [ :each | each isWebComponent ] ifNone: [].
	"self systemLog logTrace: appComponent printString."
	^ appComponent firstChildAtSlotNamed: #layout
]

{ #category : 'accessing' }
SlmdView >> layoutViewLazy [

	self subclassResponsibility
]

{ #category : 'find element' }
SlmdView >> modalDivFind [
	"Locate the div where modal components can attach"

	^ self layoutViewFind findByIdInShadowDom: 'smdModalDiv'

]

{ #category : 'find element' }
SlmdView >> modalNavElementOrNil [
	| component |

	component := self layoutViewLazy navRailModalView.
	^ component ifNil: [ nil ] ifNotNil: [ component drawer ].
]

{ #category : 'utilities' }
SlmdView >> moveChildrenFromSlot: fromSlot to: toSlot [
	| list |

	list := self childrenAtSlotNamed: fromSlot.
	list do: [ :each | self appendChild: each atSlotNamed: toSlot ].

]

{ #category : 'utilities' }
SlmdView >> pillButtonForAction: aNavAction css: cssClass [
	| iconName iconLabel tag |

	iconName := aNavAction at: #iconName.
	iconLabel := aNavAction at: #iconLabel.

	tag := #div asHtmlTag
		"addClass: 'smd-toolbar-icon';"
		appendChild: (self pillButtonLabel: iconLabel class: '' navAction: aNavAction);
		yourself.

	"cssClass ifNotNil: [ tag addClass: cssClass ]."

	^ tag
]

{ #category : 'utilities' }
SlmdView >> pillButtonLabel: buttonLabal class: cssClass navAction: aNavAction [

	^ (WaButton label: buttonLabal)
		pillBeOn;
		when: CpClickEvent primary do: [ :event | self triggerNavEvent: aNavAction ] for: self;
		"addClass: cssClass;"
		yourself
]

{ #category : 'actions' }
SlmdView >> primaryPaneOnly [

	self layoutViewLazy paneLayoutView primaryPaneOnly
]

{ #category : 'rendering' }
SlmdView >> renderString: aString [
	"Render aString to default slot.
	Useful when developing new code"

	self replaceAllChildrenWith: aString asHtmlElement
]

{ #category : 'utilities' }
SlmdView >> secondaryPaneOnly [

	self layoutViewLazy secondaryPaneOnly
]

{ #category : 'utilities' }
SlmdView >> shadowElementId: elementId display: aBoolean [
	| element |

	element := self findByIdInShadowDom: elementId ifNone: [ nil ].
	self element: element display: aBoolean.

]

{ #category : 'utilities' }
SlmdView >> shadowElementId: elementId show: aBoolean [
	| element |

	element := self findByIdInShadowDom: elementId ifNone: [ nil ].
	self element: element show: aBoolean.

]

{ #category : 'utilities' }
SlmdView >> shadowFirstDescendantMatching: cssSelectorString show: aBoolean [
	| element |

	element := self shadowedFirstDescendantMatching: cssSelectorString.
	self element: element show: aBoolean.

]

{ #category : 'accessing' }
SlmdView >> systemLog [

	^ SlmdLog
]

{ #category : 'actions' }
SlmdView >> triggerNavEvent: aNavAction [
	| eventId data navActionEvent |

	eventId := aNavAction at: #eventId.

	eventId = #modalNav ifTrue: [
		^ self layoutViewLazy modalNavOpen ].
	eventId = #settingsOpen ifTrue: [
		^ self layoutViewLazy modalSettingsOpen ].
	eventId = #login ifTrue: [
		^ self layoutViewLazy loginOpen ].

	data := aNavAction at: #data.
	navActionEvent := data
		ifNil: [ WamNavActionEvent id: eventId ]
		ifNotNil: [ :value | WamNavActionEvent id: eventId parameter: value ].
	self serverAnnounce: navActionEvent.
]
