Class {
	#name : 'WamView',
	#superclass : 'CpView',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'accessing' }
WamView class >> importThemeAwesomePath [

	^ WaElement importBasePath, 'styles/themes/awesome.css'
]

{ #category : 'accessing' }
WamView class >> importThemeShoelacePath [

	^ WaElement importBasePath, 'styles/themes/shoelace.css'
]

{ #category : 'accessing' }
WamView class >> linkUtilitiesCss [

	^ '<link rel="stylesheet" href="', WaElement importBasePath, 'styles/utilities.css"></link>'
]

{ #category : 'class initialization' }
WamView class >> loadThemes [

	CpHtmlElement documentAddStylesheet: self importThemeAwesomePath.
	CpHtmlElement documentAddStylesheet: self importThemeShoelacePath.

]

{ #category : 'view modes' }
WamView class >> modeCardGrid [

	^ #cardGrid
]

{ #category : 'view modes' }
WamView class >> modeListItem [

	^ #listItem
]

{ #category : 'class initialization' }
WamView class >> postInstallOnce [

	self loadThemes
]

{ #category : 'accessing' }
WamView class >> registerBootstrapIcons [

	"Register Bootstrap as icon library to load icons from CDN"

	CpHtmlElement documentAddModuleScript: self registerBootstrapIconsCode
]

{ #category : 'accessing' }
WamView class >> registerBootstrapIconsCode [

	^ String streamContents: [ :stream |

		stream
			nextPutAll: 'import { registerIconLibrary } from "' ;
			nextPutAll: WaElement importBasePath ;
			nextPutAll: 'webawesome.js";' ;

			nextPutAll: 'registerIconLibrary("bootstrap", {' ;
			nextPutAll: '  resolver: function(name, family) {' ;
			nextPutAll: '    const suffix = family === "filled" ? "-fill" : "";' ;
			nextPutAll: '    return `https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/icons/${name}${suffix}.svg`;' ;
			nextPutAll: '  },' ;
			nextPutAll: '});' ]
]

{ #category : 'actions' }
WamView >> beEditablePane2 [

	self layoutViewLazy beEditablePane2
]

{ #category : 'actions' }
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
			when: CpClickEvent basicPrimary do: [ self triggerNavEvent: (WamNavActionEvent fromDictionary: each) ] for: self;
			iconElement: icon;
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

{ #category : 'buttons' }
WamView >> icon: iconName action: action [
	| element |

	element := WaIcon fullyNamed: iconName.
	element
		when: CpClickEvent basicPrimary
		do: [ self triggerNavEvent: (WamNavActionEvent id: action) ]
		for: self.

	^ #div asHtmlTag
		appendChild: element;
		yourself
]

{ #category : 'buttons' }
WamView >> icon: iconName eventDictionary: eventDictionary [
	| element |

	element := WaIcon fullyNamed: iconName.
	element
		when: CpClickEvent basicPrimary
		do: [ self triggerNavEvent: (WamNavActionEvent fromDictionary: eventDictionary) ]
		for: self.

	^ #div asHtmlTag
		appendChild: element;
		yourself
]

{ #category : 'find element' }
WamView >> layoutViewFind [

	"^ WamResponsiveLayoutView first"
	^ CpHtmlElement documentBody firstChild firstChildAtSlotNamed: #layout
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

{ #category : 'buttons' }
WamView >> moveChildrenFromSlot: fromSlot to: toSlot [
	| list |

	list := self childrenAtSlotNamed: fromSlot.
	list do: [ :each | self appendChild: each atSlotNamed: toSlot ].

]

{ #category : 'actions' }
WamView >> primaryPaneOnly [

	self layoutViewLazy primaryPaneOnly
]

{ #category : 'rendering' }
WamView >> renderString: aString [
	"Render aString to default slot.
	Useful when developing new code"

	self replaceAllChildrenWith: aString asHtmlElement
]

{ #category : 'actions' }
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

{ #category : 'buttons' }
WamView >> triggerNavEvent: aNavAction [

	self triggerNavEventPre: aNavAction.
	self triggerNavEventBasic: aNavAction.
	self triggerNavEventPost: aNavAction.

]

{ #category : 'buttons' }
WamView >> triggerNavEventBasic: aNavAction [
	| eventId data navActionEvent |

	eventId := aNavAction id.

	eventId = #modalNav ifTrue: [
		^ self layoutViewLazy modalNavOpen ].
	eventId = #brand ifTrue: [
		^ self layoutViewLazy brandDialogOpen ].
	eventId = #login ifTrue: [
		self layoutViewLazy requestLogin.
		self layoutViewLazy sharedDialogOpen.
		^ self ].

	data := aNavAction parameters.
	eventId = #save ifTrue: [ | event changes paneContentView |
		event := WamNavActionEvent id: eventId parameter: data.
		paneContentView := self layoutViewLazy pane2View paneContentView.
		self systemLog logString: '****', paneContentView printString.
		paneContentView ifNil: [ ^ self ].
		changes := paneContentView changeMap.
		self systemLog logString: '****', changes printString.
		event parameters at: #changes put: changes.
		^ paneContentView serverAnnounce: event ].

	navActionEvent := data
		ifNil: [ WamNavActionEvent id: eventId ]
		ifNotNil: [ :value | WamNavActionEvent id: eventId parameter: value ].

	"N.B. self is the subclass instance, and that view's corresponding presenter
	is the receiver of the event on the server side"
	self serverAnnounce: navActionEvent.
]

{ #category : 'buttons' }
WamView >> triggerNavEventPost: aNavAction [
	"Subclasses may override"
]

{ #category : 'buttons' }
WamView >> triggerNavEventPre: aNavAction [
	"Subclasses may override"
]
