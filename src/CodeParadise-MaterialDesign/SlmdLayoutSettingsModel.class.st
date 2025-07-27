Class {
	#name : 'SlmdLayoutSettingsModel',
	#superclass : 'SlmdModel',
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
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'converting' }
SlmdLayoutSettingsModel >> asProperties [

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
SlmdLayoutSettingsModel >> colorThemeName [

	^ colorThemeName
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> colorThemeName: anObject [

	colorThemeName := anObject
]

{ #category : 'color theme' }
SlmdLayoutSettingsModel >> defaultColorThemeName [

	^ #blue
]

{ #category : 'typography' }
SlmdLayoutSettingsModel >> defaultFontFamily [

	^ #'var(--sl-font-mono)'
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> fontFamily [

	^ fontFamily
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> fontFamily: anObject [

	fontFamily := anObject
]

{ #category : 'initialization' }
SlmdLayoutSettingsModel >> initialize [

	super initialize.

	colorThemeName := self defaultColorThemeName.
	fontFamily := self defaultFontFamily.
	layoutType := self layoutTypeDefault.
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
SlmdLayoutSettingsModel >> layoutType [

	^ layoutType
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> layoutType: anObject [

	layoutType := anObject
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> layoutTypeDefault [

	^ SlmdResponsiveLayoutView layoutTypeExpanded
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> layoutWidth [

	^ layoutWidth
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> layoutWidth: anObject [

	layoutWidth := anObject
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> navRailExpanded [

	^ navRailExpanded
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> navRailExpanded: anObject [

	navRailExpanded := anObject
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> showAppBar [

	^ showAppBar
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> showAppBar: anObject [

	showAppBar := anObject
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> showDockedToolbar [

	^ showDockedToolbar
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> showDockedToolbar: anObject [

	showDockedToolbar := anObject
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> showFloatingToolbar [

	^ showFloatingToolbar
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> showFloatingToolbar: anObject [

	showFloatingToolbar := anObject
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> showNavBar [

	^ showNavBar
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> showNavBar: anObject [

	showNavBar := anObject
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> showNavMenuButton [

	^ showNavMenuButton
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> showNavMenuButton: anObject [

	showNavMenuButton := anObject
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> showSidesheet [

	^ showSidesheet
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> showSidesheet: anObject [

	showSidesheet := anObject
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> useAutoLayout [

	^ useAutoLayout
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> useAutoLayout: anObject [

	useAutoLayout := anObject
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> useModalNav [

	^ useModalNav
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> useModalNav: anObject [

	useModalNav := anObject
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> useTwoPaneBody [

	^ useTwoPaneBody
]

{ #category : 'accessing' }
SlmdLayoutSettingsModel >> useTwoPaneBody: anObject [

	useTwoPaneBody := anObject
]
