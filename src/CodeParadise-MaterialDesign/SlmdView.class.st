Class {
	#name : 'SlmdView',
	#superclass : 'CpView',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'accessing' }
SlmdView class >> eventAspectCrud [

	^ #crud
]

{ #category : 'events' }
SlmdView >> announceActionSubtype: subtype [

	self serverAnnounce: (SlmdUserEvent eventParameter: {
		#type -> #action.
		#subtype -> subtype
	} asDictionary).

]

{ #category : 'events' }
SlmdView >> announceActionSubtype: subtype key: key value: value [

	self serverAnnounce: (SlmdUserEvent eventParameter: {
		#type -> #action.
		#subtype -> subtype.
		key -> value.
	} asDictionary).

]

{ #category : 'events' }
SlmdView >> announceNavKey: key value: value [

	self serverAnnounce: (SlmdUserEvent eventParameter: {
		#type -> #nav.
		#subtype -> #nav.
		key -> value
	} asDictionary).

]

{ #category : 'events' }
SlmdView >> announceNavSubtype: subtype navTo: value [

	self serverAnnounce: (SlmdUserEvent eventParameter: {
		#type -> #nav.
		#subtype -> subtype.
		#data -> value
	} asDictionary).

]

{ #category : 'events' }
SlmdView >> announceSetting: aspect value: anObject [

	self serverAnnounce: (SlmdUserEvent eventParameter: {
		#type -> #action.
		#subtype -> #layoutSettingChange.
		#aspect -> aspect.
		#value -> anObject
	} asDictionary).

]

{ #category : 'utilities' }
SlmdView >> dropdownMenu: actionList css: cssClass [
	| menu trigger dropdown |

	menu := SlMenu new.
	menu addClass: 'smd-menu'.
	actionList do: [ :each | | icon |
		icon := (SlIcon named: (each at: #iconName)) addClass: 'smd-menu-icon'; yourself.
		menu appendChild: (SlMenuItem new
			addClass: 'smd-menu-item';
			when: CpClickEvent basicPrimary do: [ self layoutViewLazy triggerUserEvent: each ] for: self;
			prefix: icon;
			textContent: (each at: #iconLabel);
			yourself) ].

	trigger := #div asHtmlTag
		appendChild: ((SlIconButton named: 'three-dots-vertical') addClass: 'smd-toolbar-icon'; yourself);
		yourself.
	cssClass ifNotNil: [ trigger addClass: cssClass ].

	dropdown := SlDropdown new
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

	^ (SlIconButton named: iconName)
		when: CpClickEvent primary do: [ :event | self layoutViewLazy triggerUserEvent: aNavAction ] for: self;
		addClass: cssClass;
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

{ #category : 'logging' }
SlmdView >> logTrace: aString method: methodName [

	"Invoked by presenter via view proxy,
	so extra definition here, else the method reported DNU."
	self systemLog logTrace: aString method: methodName
]

{ #category : 'find element' }
SlmdView >> modalDivFind [
	"Locate the div where modal components can attach"

	^ SlmdResponsiveLayoutView first findByIdInShadowDom: 'smdModalDiv'

]

{ #category : 'find element' }
SlmdView >> modalNavElementOrNil [
	| component |

	component := SlmdNavRailView first.
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
		appendChild: (self pillButtonLabel: iconLabel class: 'smd-toolbar-icon' navAction: aNavAction);
		yourself.

	cssClass ifNotNil: [ tag addClass: cssClass ].

	^ tag
]

{ #category : 'utilities' }
SlmdView >> pillButtonLabel: buttonLabal class: cssClass navAction: aNavAction [

	^ (SlButton label: buttonLabal)
		bePill;
		when: CpClickEvent primary do: [ :event | self layoutViewLazy triggerUserEvent: aNavAction ] for: self;
		addClass: cssClass;
		yourself
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
