Class {
	#name : 'WamPreferencesModel',
	#superclass : 'WamModel',
	#instVars : [
		'colorThemeName',
		'fontFamily',
		'layoutWidth',
		'layoutType',
		'useAutoLayout',
		'useModalNav',
		'useTwoPaneBody',
		'navRailExpanded',
		'showAppBar',
		'showNavMenuButton',
		'showNavBar',
		'showSidesheet',
		'showDockedToolbar',
		'showFloatingToolbar'
	],
	#category : 'CodeParadise-MaterialDesign-Preferences',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Preferences'
}

{ #category : 'converting' }
WamPreferencesModel >> asMap [

	^ Dictionary new
		at: #colorThemeName put: self colorThemeName;
		at: #fontFamily put: self fontFamily;
		at: #layoutType put: self layoutType;
		at: #navRailExpanded put: self navRailExpanded;
		at: #showSidesheet put: self showSidesheet;
		at: #showAppBar put: self showAppBar;
		at: #showNavMenuButton put: self showNavMenuButton;
		at: #showNavBar put: self showNavBar;
		at: #showDockedToolbar put: self showDockedToolbar;
		at: #showFloatingToolbar put: self showFloatingToolbar;
		at: #useAutoLayout put: self useAutoLayout;
		at: #useModalNav put: self useModalNav;
		at: #useTwoPaneBody put: self useTwoPaneBody;
		yourself
]

{ #category : 'accessing' }
WamPreferencesModel >> colorThemeName [

	^ colorThemeName
]

{ #category : 'accessing' }
WamPreferencesModel >> colorThemeName: anObject [

	colorThemeName := anObject
]

{ #category : 'color theme' }
WamPreferencesModel >> defaultColorThemeName [

	^ nil
]

{ #category : 'typography' }
WamPreferencesModel >> defaultFontFamily [

	^ #'monospace'
]

{ #category : 'events' }
WamPreferencesModel >> doLayoutSettings: anObject [
	| aspect aspectValue |

	self systemLog logTrace5: anObject printString.
	aspect := anObject parameterAt: #aspect.
	aspectValue := anObject parameterAt: #value.

	aspect = #layoutUpdate ifTrue: [
		self layoutUpdate: aspectValue.
		^ self ].

	self systemLog logTrace5: aspect asString, ' BEFORE: ', (self perform: aspect) printString.
	self perform: (aspect, ':') asSymbol with: aspectValue.
	self systemLog logTrace5: aspect asString, '  AFTER: ', (self perform: aspect) printString.

]

{ #category : 'accessing' }
WamPreferencesModel >> fontFamily [

	^ fontFamily
]

{ #category : 'accessing' }
WamPreferencesModel >> fontFamily: anObject [

	fontFamily := anObject
]

{ #category : 'initialization' }
WamPreferencesModel >> initialize [

	super initialize.

	colorThemeName := self defaultColorThemeName.
	fontFamily := self defaultFontFamily.
	layoutType := nil.
	useAutoLayout := true.
	useModalNav := false.
	useTwoPaneBody := true.
	navRailExpanded := false.
	showAppBar := false.
	showNavMenuButton := false.
	showNavBar := false.
	showSidesheet := false.
	showDockedToolbar := false.
	showFloatingToolbar := false.

]

{ #category : 'accessing' }
WamPreferencesModel >> layoutType [

	^ layoutType
]

{ #category : 'accessing' }
WamPreferencesModel >> layoutType: anObject [

	layoutType := anObject
]

{ #category : 'events' }
WamPreferencesModel >> layoutUpdate: props [

	self systemLog logTrace5: props printString.

	props keysAndValuesDo: [ :k :v | | setAccessor |
		setAccessor := (k, ':') asSymbol.
		self systemLog logTrace5: k asString, ' BEFORE: ', (self perform: k) printString.
		self perform: setAccessor with: v.
		self systemLog logTrace5: k asString, '  AFTER: ', (self perform: k) printString.
		].

	self application layout navRail valueChanged.

	"The appbar leading action might depend on two pane mode"
	self application layout appBar1 valueChanged.
	self application layout appBar2 valueChanged.

]

{ #category : 'accessing' }
WamPreferencesModel >> layoutWidth [

	^ layoutWidth
]

{ #category : 'accessing' }
WamPreferencesModel >> layoutWidth: anObject [

	layoutWidth := anObject
]

{ #category : 'accessing' }
WamPreferencesModel >> navRailExpanded [

	^ navRailExpanded
]

{ #category : 'accessing' }
WamPreferencesModel >> navRailExpanded: anObject [

	navRailExpanded := anObject.
	self application layout navRail navItems do: [ :each | each valueChanged ].

]

{ #category : 'accessing' }
WamPreferencesModel >> showAppBar [

	^ showAppBar
]

{ #category : 'accessing' }
WamPreferencesModel >> showAppBar: anObject [

	showAppBar := anObject
]

{ #category : 'accessing' }
WamPreferencesModel >> showDockedToolbar [

	^ showDockedToolbar
]

{ #category : 'accessing' }
WamPreferencesModel >> showDockedToolbar: anObject [

	showDockedToolbar := anObject
]

{ #category : 'accessing' }
WamPreferencesModel >> showFloatingToolbar [

	^ showFloatingToolbar
]

{ #category : 'accessing' }
WamPreferencesModel >> showFloatingToolbar: anObject [

	showFloatingToolbar := anObject
]

{ #category : 'accessing' }
WamPreferencesModel >> showNavBar [

	^ showNavBar
]

{ #category : 'accessing' }
WamPreferencesModel >> showNavBar: anObject [

	showNavBar := anObject
]

{ #category : 'accessing' }
WamPreferencesModel >> showNavMenuButton [

	^ showNavMenuButton
]

{ #category : 'accessing' }
WamPreferencesModel >> showNavMenuButton: anObject [

	showNavMenuButton := anObject
]

{ #category : 'accessing' }
WamPreferencesModel >> showSidesheet [

	^ showSidesheet
]

{ #category : 'accessing' }
WamPreferencesModel >> showSidesheet: anObject [

	showSidesheet := anObject
]

{ #category : 'accessing' }
WamPreferencesModel >> useAutoLayout [

	^ useAutoLayout
]

{ #category : 'accessing' }
WamPreferencesModel >> useAutoLayout: anObject [

	useAutoLayout := anObject
]

{ #category : 'accessing' }
WamPreferencesModel >> useModalNav [

	^ useModalNav
]

{ #category : 'accessing' }
WamPreferencesModel >> useModalNav: anObject [

	useModalNav := anObject
]

{ #category : 'accessing' }
WamPreferencesModel >> useTwoPaneBody [

	^ useTwoPaneBody
]

{ #category : 'accessing' }
WamPreferencesModel >> useTwoPaneBody: anObject [

	useTwoPaneBody := anObject
]
