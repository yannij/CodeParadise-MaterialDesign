Class {
	#name : 'WamView',
	#superclass : 'CpView',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'accessing' }
WamView class >> eventAspectCrud [

	^ #crud
]

{ #category : 'utilities' }
WamView >> beEditablePane2 [

	self layoutViewLazy beEditablePane2
]

{ #category : 'utilities' }
WamView >> beNotEditablePane2 [

	self layoutViewLazy beNotEditablePane2
]

{ #category : 'utilities' }
WamView >> dropdownAppbar: actionList [
	| menu iconName trigger dropdown div |

	menu := self dropdownMenuItems: actionList.
	iconName := 'ellipsis-vertical'.

	trigger := #div asHtmlTag
		appendChild: (WaIcon fullyNamed: iconName).
	trigger addClass: 'wam-toolbar-icon'.

	dropdown := WaDropdown new
		replaceAllChildrenWith: trigger atSlotNamed: #trigger;
		appendChild: menu;
		yourself.

	div := #div asHtmlTag appendChild: dropdown; addClass: 'wam-toolbar-item'; yourself.

	^ div

]

{ #category : 'utilities' }
WamView >> dropdownMenuItems: actionList [
	| menu |

	menu := #div asHtmlTag.
	menu addClass: 'wam-menu'.
	actionList do: [ :each | | icon |
		icon := (WaIcon fullyNamed: (each at: #iconName))
			label: (each at: #iconName);
			addClass: 'wam-menu-icon';
			yourself.
		menu appendChild: (WaDropdownItem new
			addClass: 'wam-menu-item';
			when: CpClickEvent basicPrimary do: [ self triggerNavEvent: each ] for: self;
			icon: icon;
			textContent: (each at: #iconLabel);
			yourself) ].

	^ menu

]

{ #category : 'utilities' }
WamView >> dropdownNavbar: actionList [
	| menu iconName trigger dropdown div |

	menu := self dropdownMenuItems: actionList.
	iconName := 'ellipsis-vertical'.

	trigger := #div asHtmlTag
		appendChild: (WaIcon fullyNamed: iconName).
	trigger addClass: 'wam-navbar-dropdown'.

	dropdown := WaDropdown new
		replaceAllChildrenWith: trigger atSlotNamed: #trigger;
		appendChild: menu;
		yourself.

	div := #div asHtmlTag appendChild: dropdown; addClass: 'wam-navbar-item'; yourself.

	^ div

]

{ #category : 'utilities' }
WamView >> element: element display: aBoolean [

	"self logTrace: element printString method: 'element:display:'."

	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ]
]

{ #category : 'utilities' }
WamView >> element: element show: aBoolean [

	"self logTrace: element printString method: 'element:show:'."

	element ifNotNil: [
		element classed: #'wam-hidden' if: aBoolean not ]
]

{ #category : 'utilities' }
WamView >> findByIdInLightDom: anId [

	^ self
		findByIdInLightDom: anId
		ifNone: [ self error: '#findByIdInLightDom: ', anId asString, ' is nil' ].
]

{ #category : 'utilities' }
WamView >> findByIdInLightDom: anId ifNone: aBlock [
	| element |

	element := CpHtmlElement documentBody firstDescendantMatching: '#', anId.
	element ifNil: [ ^ aBlock value ].
	^ element

]

{ #category : 'utilities' }
WamView >> findByIdInShadowDom: anId [

	^ self
		findByIdInShadowDom: anId
		ifNone: [ self error: '#findByIdInShadowDom: ', anId asString, ' is nil' ].
]

{ #category : 'utilities' }
WamView >> findByIdInShadowDom: anId ifNone: aBlock [
	| element |

	element := self shadowedElementWithId: anId.
	element ifNil: [ ^ aBlock value ].
	^ element

]

{ #category : 'utilities' }
WamView >> findFirstDescendantInShadowDom: anId [

	^ self
		findFirstDescendantInShadowDom: anId
		ifNone: [ self error: '#findFirstDescendantInShadowDom: ', anId asString, ' is nil' ].
]

{ #category : 'utilities' }
WamView >> findFirstDescendantInShadowDom: anId ifNone: aBlock [
	| element |

	element := self shadowedFirstDescendantMatching: anId.
	element ifNil: [ ^ aBlock value ].
	^ element

]

{ #category : 'utilities' }
WamView >> iconButton: iconName navAction: aNavAction [

	^ WaButton new
		appendChild: (WaIcon fullyNamed: iconName);
		when: CpClickEvent primary do: [ :event | self triggerNavEvent: aNavAction ] for: self;
		yourself
]

{ #category : 'utilities' }
WamView >> iconButtonForAction: aNavAction [
	| iconName |

	iconName := aNavAction at: #iconName.
	^ self iconButton: iconName navAction: aNavAction
]

{ #category : 'utilities' }
WamView >> iconButtonForAction: aNavAction css: cssClass [
	| iconName tag |

	iconName := aNavAction at: #iconName.

	tag := #div asHtmlTag
		appendChild: ((WaIcon fullyNamed: iconName)
			label: iconName;
			addClass: 'wam-toolbar-icon';
			when: CpClickEvent primary do: [ :event | self triggerNavEvent: aNavAction ] for: self;
			yourself);
		yourself.

	cssClass ifNotNil: [ tag addClass: cssClass ].

	^ tag
]

{ #category : 'utilities' }
WamView >> iconButtonNamed: iconName class: cssClass navAction: aNavAction [

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
WamView >> layoutViewFind [

	^ WamResponsiveLayoutView first
]

{ #category : 'accessing' }
WamView >> layoutViewLazy [

	self subclassResponsibility
]

{ #category : 'find element' }
WamView >> modalNavElementOrNil [
	| component |

	component := self layoutViewLazy navRailModalView.
	^ component ifNil: [ nil ] ifNotNil: [ component drawer ].
]

{ #category : 'utilities' }
WamView >> moveChildrenFromSlot: fromSlot to: toSlot [
	| list |

	list := self childrenAtSlotNamed: fromSlot.
	list do: [ :each | self appendChild: each atSlotNamed: toSlot ].

]

{ #category : 'utilities' }
WamView >> pillButtonForAction: aNavAction css: cssClass [
	| iconName iconLabel tag |

	iconName := aNavAction at: #iconName.
	iconLabel := aNavAction at: #iconLabel.

	tag := #div asHtmlTag
		"addClass: 'wam-toolbar-icon';"
		appendChild: (self pillButtonLabel: iconLabel class: '' navAction: aNavAction);
		yourself.

	"cssClass ifNotNil: [ tag addClass: cssClass ]."

	^ tag
]

{ #category : 'utilities' }
WamView >> pillButtonLabel: buttonLabal class: cssClass navAction: aNavAction [

	^ (WaButton label: buttonLabal)
		pillBeOn;
		when: CpClickEvent primary do: [ :event | self triggerNavEvent: aNavAction ] for: self;
		"addClass: cssClass;"
		yourself
]

{ #category : 'actions' }
WamView >> primaryPaneOnly [

	self layoutViewLazy paneLayoutView primaryPaneOnly
]

{ #category : 'rendering' }
WamView >> renderString: aString [
	"Render aString to default slot.
	Useful when developing new code"

	self replaceAllChildrenWith: aString asHtmlElement
]

{ #category : 'utilities' }
WamView >> secondaryPaneOnly [

	self layoutViewLazy secondaryPaneOnly
]

{ #category : 'utilities' }
WamView >> shadowElementId: elementId display: aBoolean [
	| element |

	element := self findByIdInShadowDom: elementId ifNone: [ nil ].
	self element: element display: aBoolean.

]

{ #category : 'utilities' }
WamView >> shadowElementId: elementId show: aBoolean [
	| element |

	element := self findByIdInShadowDom: elementId ifNone: [ nil ].
	self element: element show: aBoolean.

]

{ #category : 'utilities' }
WamView >> shadowFirstDescendantMatching: cssSelectorString show: aBoolean [
	| element |

	element := self shadowedFirstDescendantMatching: cssSelectorString.
	self element: element show: aBoolean.

]

{ #category : 'accessing' }
WamView >> systemLog [

	^ WamLog
]

{ #category : 'actions' }
WamView >> triggerNavEvent: aNavAction [
	| eventId data navActionEvent |

	eventId := aNavAction at: #eventId.

	eventId = #modalNav ifTrue: [
		^ self layoutViewLazy modalNavOpen ].
	eventId = #login ifTrue: [
		^ self layoutViewLazy requestLogin ].

	data := aNavAction at: #data.
	navActionEvent := data
		ifNil: [ WamNavActionEvent id: eventId ]
		ifNotNil: [ :value | WamNavActionEvent id: eventId parameter: value ].
	self serverAnnounce: navActionEvent.
]
