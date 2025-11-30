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

{ #category : 'events' }
SlmdView >> announceActionSubtype: subtype [

	self serverAnnounce: (WamNavActionEvent id: subtype).

]

{ #category : 'events' }
SlmdView >> announceActionSubtype: subtype key: key value: value [

	self serverAnnounce: (SlmdUserEvent eventParameter: {
		#type -> #action.
		#subtype -> subtype.
		key -> value.
	} asDictionary).

]

{ #category : 'utilities' }
SlmdView >> beEditablePane2 [

	self layoutViewLazy beEditablePane2
]

{ #category : 'utilities' }
SlmdView >> beNotEditable [

	self layoutViewLazy beNotEditable
]

{ #category : 'utilities' }
SlmdView >> dropdownMenu: actionList css: cssClass [

	^ self dropdownMenu: actionList icon: 'ellipsis-vertical' css: cssClass
]

{ #category : 'utilities' }
SlmdView >> dropdownMenu: actionList icon: iconName css: cssClass [
	| menu trigger dropdown |

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

	trigger := #div asHtmlTag
		appendChild: (WaButton new label: ((WaIcon fullyNamed: iconName) label: iconName; yourself); yourself
		"addClass: 'smd-toolbar-icon';"
		).
	cssClass ifNotNil: [ trigger addClass: cssClass ].

	dropdown := WaDropdown new
		replaceAllChildrenWith: trigger atSlotNamed: #trigger;
		appendChild: menu;
		yourself.

	^ dropdown

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
SlmdView >> iconButtonForAction: aNavAction css: cssClass [
	| iconName tag |

	iconName := aNavAction at: #iconName.

	tag := #div asHtmlTag
		appendChild: (self iconButtonNamed: iconName class: 'smd-toolbar-icon' navAction: aNavAction);
		yourself.

	cssClass ifNotNil: [ tag addClass: cssClass ].

	^ tag
]

{ #category : 'utilities' }
SlmdView >> iconButtonNamed: iconName class: cssClass navAction: aNavAction [

	^ #div asHtmlTag
		addClass: cssClass;
		appendChild: ((WaIcon fullyNamed: iconName) label: iconName; yourself);
		when: CpClickEvent primary do: [ :event | self triggerNavEvent: aNavAction ] for: self;
		yourself
]

{ #category : 'find element' }
SlmdView >> layoutViewFind [

	^ SlmdResponsiveLayoutView first
]

{ #category : 'accessing' }
SlmdView >> layoutViewLazy [

	self subclassResponsibility
]

{ #category : 'find element' }
SlmdView >> modalDivFind [
	"Locate the div where modal components can attach"

	^ SlmdResponsiveLayoutView first findByIdInShadowDom: 'smdModalDiv'

]

{ #category : 'find element' }
SlmdView >> modalNavElementOrNil [
	| component |

	component := SlmdNavRailModalView first.
	^ component ifNil: [ nil ] ifNotNil: [ component drawer ].
]

{ #category : 'find element' }
SlmdView >> modalSettingsElement [
	| component |

	component := SlmdLayoutSettingsView first.
	^ component ifNil: [ self error: 'Not found: layout settings view' ] ifNotNil: [ component drawer ].
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
	| subtype data |

	subtype := aNavAction at: #subtype.
	data := aNavAction at: #data.

	subtype = #modalNav ifTrue: [
		^ self layoutViewLazy modalNavOpen ].
	subtype = #settingsOpen ifTrue: [
		^ self layoutViewLazy modalSettingsOpen ].
	subtype = #login ifTrue: [
		^ self layoutViewLazy loginOpen ].

	self serverAnnounce: (WamNavActionEvent id: subtype parameter: data).
]

{ #category : 'events' }
SlmdView >> triggerUserEvent: aUserEventSpec [
	"Announce user event to presenter.
	Subclasses may override.
	Default is to route event through layout view"

	self layoutViewLazy triggerUserEvent: aUserEventSpec
]
