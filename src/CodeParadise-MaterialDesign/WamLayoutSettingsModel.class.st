Class {
	#name : 'WamLayoutSettingsModel',
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
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'converting' }
WamLayoutSettingsModel >> asMap [

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
WamLayoutSettingsModel >> colorThemeName [

	^ colorThemeName
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> colorThemeName: anObject [

	colorThemeName := anObject
]

{ #category : 'color theme' }
WamLayoutSettingsModel >> defaultColorThemeName [

	^ nil
]

{ #category : 'typography' }
WamLayoutSettingsModel >> defaultFontFamily [

	^ #'monospace'
]

{ #category : 'events' }
WamLayoutSettingsModel >> doLayoutSettings: anObject [
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
WamLayoutSettingsModel >> fontFamily [

	^ fontFamily
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> fontFamily: anObject [

	fontFamily := anObject
]

{ #category : 'initialization' }
WamLayoutSettingsModel >> initialize [

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
WamLayoutSettingsModel >> layoutType [

	^ layoutType
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> layoutType: anObject [

	layoutType := anObject
]

{ #category : 'events' }
WamLayoutSettingsModel >> layoutUpdate: props [

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
WamLayoutSettingsModel >> layoutWidth [

	^ layoutWidth
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> layoutWidth: anObject [

	layoutWidth := anObject
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> navRailExpanded [

	^ navRailExpanded
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> navRailExpanded: anObject [

	navRailExpanded := anObject.
	self application layout navRail navItems do: [ :each | each valueChanged ].

]

{ #category : 'accessing' }
WamLayoutSettingsModel >> showAppBar [

	^ showAppBar
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> showAppBar: anObject [

	showAppBar := anObject
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> showDockedToolbar [

	^ showDockedToolbar
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> showDockedToolbar: anObject [

	showDockedToolbar := anObject
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> showFloatingToolbar [

	^ showFloatingToolbar
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> showFloatingToolbar: anObject [

	showFloatingToolbar := anObject
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> showNavBar [

	^ showNavBar
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> showNavBar: anObject [

	showNavBar := anObject
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> showNavMenuButton [

	^ showNavMenuButton
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> showNavMenuButton: anObject [

	showNavMenuButton := anObject
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> showSidesheet [

	^ showSidesheet
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> showSidesheet: anObject [

	showSidesheet := anObject
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> useAutoLayout [

	^ useAutoLayout
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> useAutoLayout: anObject [

	useAutoLayout := anObject
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> useModalNav [

	^ useModalNav
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> useModalNav: anObject [

	useModalNav := anObject
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> useTwoPaneBody [

	^ useTwoPaneBody
]

{ #category : 'accessing' }
WamLayoutSettingsModel >> useTwoPaneBody: anObject [

	useTwoPaneBody := anObject
]
