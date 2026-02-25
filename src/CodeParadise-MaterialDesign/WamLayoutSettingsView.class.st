Class {
	#name : 'WamLayoutSettingsView',
	#superclass : 'WamLayoutComponentView',
	#instVars : [
		'colorThemeName',
		'fontFamily'
	],
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'class initialization' }
WamLayoutSettingsView class >> beLoaded [

	WaDrawer beLoaded
]

{ #category : 'web resources' }
WamLayoutSettingsView class >> template [
	<webResource: #html>

	^ '
<wa-drawer>
  <slot></slot>
</wa-drawer>
'
]

{ #category : 'utilities' }
WamLayoutSettingsView >> addAttributeContainerStyle: element [

	^ element styleAt: 'padding-bottom' put: '12px'; yourself
]

{ #category : 'actions' }
WamLayoutSettingsView >> announceSetting: aspect value: anObject [

	self serverAnnounce: (WamNavActionEvent id: #layoutSettingChange parameter: {
		#type -> #action.
		#aspect -> aspect.
		#value -> anObject
	} asDictionary).

]

{ #category : 'settings - choosers' }
WamLayoutSettingsView >> colorThemeBuildChooser: props [
	| chooser selectedItem |

	selectedItem := props at: #colorThemeName ifAbsent: [].
	chooser := WaSelect new
		id: 'smdColorThemeChooser';
		labelText: 'Use color theme:';
		propertyAt: 'value' put: selectedItem asString;
		yourself.
	self colorThemeName: selectedItem.

	chooser when: WaChangeEvent do: [ self colorThemeNameSet: chooser value ] for: self.

	#(
red orange yellow green cyan blue indigo purple pink gray
	) do: [ :each |
		chooser appendChild: (WaOption new value: each; textContent: each capitalized; yourself) ].

	^ self addAttributeContainerStyle: chooser
]

{ #category : 'accessing' }
WamLayoutSettingsView >> colorThemeName [

	^ colorThemeName
]

{ #category : 'accessing' }
WamLayoutSettingsView >> colorThemeName: anObject [

	colorThemeName := anObject asString
]

{ #category : 'settings - choosers' }
WamLayoutSettingsView >> colorThemeNameSet: anObject [

	self colorThemeName = anObject ifTrue: [
		^ self ].

	self layoutViewLazy colorThemeAdapt: anObject from: self colorThemeName.
	self colorThemeName: anObject.
	self announceSetting: #colorThemeName value: anObject.

]

{ #category : 'accessing' }
WamLayoutSettingsView >> drawer [

	^ self shadowedFirstDescendantMatching: WaDrawer asCssSelector
]

{ #category : 'utilities' }
WamLayoutSettingsView >> elementId: id [

	^ self firstDescendantMatching: '#', id
]

{ #category : 'utilities' }
WamLayoutSettingsView >> elementId: id propertyAt: key ifMissing: aBlock [
	| element settingValue |

	element := self elementId: id.
	element ifNil: [ ^ aBlock value ].
	settingValue := element propertyAt: key.
	settingValue ifNil: [ ^ aBlock value ].
	^ settingValue
]

{ #category : 'utilities' }
WamLayoutSettingsView >> elementId: id propertyAt: key put: value ifMissing: aBlock [
	| element |

	element := self elementId: id.
	element ifNil: [
		self systemLog logTrace: 'Missing: ', id printString.
		^ aBlock value ].
	element propertyAt: key put: value.

]

{ #category : 'accessing' }
WamLayoutSettingsView >> fontFamily [

	^ fontFamily
]

{ #category : 'accessing' }
WamLayoutSettingsView >> fontFamily: anObject [

	fontFamily := anObject
]

{ #category : 'settings - choosers' }
WamLayoutSettingsView >> fontFamilyChooser: props [
	| chooser selectedItem |

	selectedItem := props at: #fontFamily ifAbsent: [].
	chooser := WaSelect new
		id: 'smdFontFamilyChooser';
		labelText: 'Use font family:';
		propertyAt: 'value' put: selectedItem asString;
		yourself.

	chooser when: WaChangeEvent do: [ self fontFamilySet: chooser value ] for: self.

	{
nil -> 'Default'.
#'sans-serif' -> 'Sans'.
#'serif' -> 'Serif'.
#'monospace' -> 'Mono'
	} do: [ :each |
		chooser appendChild: (WaOption new value: each key; textContent: each value capitalized; yourself) ].

	^ self addAttributeContainerStyle: chooser
]

{ #category : 'settings - choosers' }
WamLayoutSettingsView >> fontFamilySet: anObject [

	self fontFamily = anObject ifTrue: [
		^ self ].

	self fontFamily: anObject.
	self layoutViewLazy fontFamilyAdapt: anObject.
	self announceSetting: #fontFamily value: anObject.

]

{ #category : 'initalize' }
WamLayoutSettingsView >> layoutInitialSetUp: props [

	self layoutViewLazy layoutInitialSetUp: props.

]

{ #category : 'settings - choosers' }
WamLayoutSettingsView >> layoutType [

	^ self elementId: 'smdLayoutTypeChooser' propertyAt: #value ifMissing: nil
]

{ #category : 'settings - choosers' }
WamLayoutSettingsView >> layoutType: aLayoutType [

	self elementId: 'smdLayoutTypeChooser' propertyAt: #value put: aLayoutType ifMissing: nil
]

{ #category : 'settings - choosers' }
WamLayoutSettingsView >> layoutTypeBuildChooser: props [
	| radioGroup selectedItem |

	selectedItem := props at: #layoutType ifAbsent: [].

	radioGroup := WaRadioGroup new
		id: 'smdLayoutTypeChooser';
		propertyAt: 'label' put: 'Use layout style:';
		propertyAt: 'value' put: selectedItem asString;
		yourself.

	radioGroup when: WaChangeEvent do: [ self layoutTypeSet: radioGroup value ] for: self.

	WamLayoutType layoutTypeList do: [ :each |
		radioGroup appendChild: (WaRadio new value: each key; textContent: each value; yourself) ].

	^ self addAttributeContainerStyle: radioGroup
]

{ #category : 'settings - choosers' }
WamLayoutSettingsView >> layoutTypeSet: anObject [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy layoutTypeAdapt: (WamLayoutType byName at: anObject ifAbsent: []).
	self announceSetting: #layoutType value: anObject.

]

{ #category : 'actions' }
WamLayoutSettingsView >> layoutUpdate [
	| props |

	props := {
		#navRailExpanded -> self navRailExpanded.
		#showNavBar -> self showNavBar.
		#showSidesheet -> self showSidesheet.
		#useTwoPaneBody -> self useTwoPaneBody.
		#showAppBar -> self showAppBar.
		#useModalNav -> self useModalNav.
	} asDictionary.

	self announceSetting: #layoutUpdate value: props
]

{ #category : 'initalize' }
WamLayoutSettingsView >> modalDivContentWith: props [
	| element |

	element := #div asHtmlTag
		addClass: 'smd-settings-pane';
		appendChild: (self useAutoLayoutNewSwitch: props);
		appendChild: (self layoutTypeBuildChooser: props);
		appendChild: (self navRailExpandedNewSwitch: props);
		appendChild: (self useModalNavNewSwitch: props);
		appendChild: (self useTwoPaneBodyNewSwitch: props);
		appendChild: (self showSidesheetNewSwitch: props);
		appendChild: (self showNavMenuButtonNewSwitch: props);
		appendChild: (self showNavBarNewSwitch: props);
		appendChild: (self showAppBarNewSwitch: props);
		appendChild: (self showDockedToolbarNewSwitch: props);
		appendChild: (self showFloatingToolbarNewSwitch: props);
		appendChild: (self colorThemeBuildChooser: props);
		appendChild: (self fontFamilyChooser: props);
		yourself.

	^ element
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> navRailExpanded [

	^ self switchId: self navRailExpandedId ifMissing: true
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> navRailExpanded: aBoolean [

	self switchId: self navRailExpandedId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> navRailExpandedId [

	^ 'navRailExpanded'
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> navRailExpandedNewSwitch: props [

	^ self
		switchNewWithId: self navRailExpandedId
		label: 'Nav rail expanded'
		checked: (props at: #navRailExpanded ifAbsent: [ false ])
		do: [ self navRailExpandedSet: self navRailExpanded ].

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> navRailExpandedSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy navRailExpandedAdapt: aBoolean.
	self announceSetting: #navRailExpanded value: aBoolean.

]

{ #category : 'initalize' }
WamLayoutSettingsView >> renderContent: aDictionary [

	self drawer
		label: 'Layout settings';
		customPropertyAt: 'size' put: '50vw';
		yourself.

	self replaceAllChildrenWith: (self modalDivContentWith: aDictionary) atSlotNamed: nil
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showAppBar [

	^ self switchId: self showAppBarId ifMissing: true
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showAppBar: aBoolean [

	self switchId: self showAppBarId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showAppBarId [

	^ 'showAppBar'
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showAppBarLeadingButtonId [

	^ 'showAppBarLeadingButton'
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showAppBarNewSwitch: props [

	^ self
		switchNewWithId: self showAppBarId
		label: 'Show App bar'
		checked: (props at: #showAppBar ifAbsent: [ false ])
		do: [ self showAppBarSet: self showAppBar ].

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showAppBarSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy appBarDisplay: aBoolean; resizeBodyRegion.
	self announceSetting: #showAppBar value: aBoolean.

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showDockedToolbar [

	^ self switchId: self showDockedToolbarId ifMissing: false
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showDockedToolbar: aBoolean [

	self switchId: self showDockedToolbarId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showDockedToolbarId [

	^ 'showDockedToolbar'
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showDockedToolbarNewSwitch: props [

	^ self
		switchNewWithId: self showDockedToolbarId
		label: 'Show Docked Toolbar'
		checked: (props at: #showDockedToolbar ifAbsent: [ false ])
		do: [ self showDockedToolbarSet: self showDockedToolbar ].

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showDockedToolbarSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy showDockedToolbarAdapt: aBoolean; resizeBodyRegion.
	self announceSetting: #showDockedToolbar value: aBoolean.

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showFloatingToolbar [

	^ self switchId: self showFloatingToolbarId ifMissing: false
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showFloatingToolbar: aBoolean [

	self switchId: self showFloatingToolbarId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showFloatingToolbarId [

	^ 'showFloatingToolbar'
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showFloatingToolbarNewSwitch: props [

	^ self
		switchNewWithId: self showFloatingToolbarId
		label: 'Show Floating Toolbar'
		checked: (props at: #showFloatingToolbar ifAbsent: [ false ])
		do: [ self showFloatingToolbarSet: self showFloatingToolbar ].

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showFloatingToolbarSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy showFloatingToolbarAdapt: aBoolean.
	self announceSetting: #showFloatingToolbar value: aBoolean.

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showNavBar [

	^ self switchId: self showNavBarId ifMissing: false
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showNavBar: aBoolean [

	self switchId: self showNavBarId put: aBoolean ifMissing: false
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showNavBarId [

	^ 'showNavBar'
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showNavBarNewSwitch: props [

	^ self
		switchNewWithId: self showNavBarId
		label: 'Show Nav bar'
		checked: (props at: #showNavBar ifAbsent: [ false ])
		do: [ self showNavBarSet: self showNavBar ].

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showNavBarSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy showNavBarAdapt: aBoolean; resizeBodyRegion.
	self announceSetting: #showNavBar value: aBoolean.

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showNavMenuButton [

	^ self switchId: self showNavMenuButtonId ifMissing: false
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showNavMenuButton: aBoolean [

	self switchId: self showNavMenuButtonId put: aBoolean ifMissing: false
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showNavMenuButtonId [

	^ 'showNavMenuButton'
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showNavMenuButtonNewSwitch: props [

	^ self
		switchNewWithId: self showNavMenuButtonId
		label: 'Show Nav menu button'
		checked: (props at: #showMenuButtonBar ifAbsent: [ false ])
		do: [ self showNavMenuButtonSet: self showNavMenuButton ].

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showNavMenuButtonSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy showNavMenuButtonAdapt: aBoolean.
	self announceSetting: #showNavMenuButton value: aBoolean.

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showSidesheet [

	^ self switchId: self showSidesheetId ifMissing: true
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showSidesheet: aBoolean [

	self switchId: self showSidesheetId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showSidesheetId [

	^ 'showSidesheet'
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showSidesheetNewSwitch: props [

	^ self
		switchNewWithId: self showSidesheetId
		label: 'Show Sidesheet'
		checked: (props at: #showSidesheet ifAbsent: [ false ])
		do: [ self showSidesheetSet: self showSidesheet ].

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> showSidesheetSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy sidesheetDisplay: aBoolean.
	self announceSetting: #showSidesheet value: aBoolean.

]

{ #category : 'utilities' }
WamLayoutSettingsView >> switchId: id ifMissing: aBlock [

	^ self elementId: id propertyAt: #checked ifMissing: aBlock
]

{ #category : 'utilities' }
WamLayoutSettingsView >> switchId: id put: value ifMissing: aBlock [

	^ self elementId: id propertyAt: #checked put: value ifMissing: nil
]

{ #category : 'utilities' }
WamLayoutSettingsView >> switchNewWithId: id label: label checked: checked do: aBlock [
	| toggle |

	toggle := WaSwitch new
		id: id;
		label: label;
		checked: checked;
		when: WaChangeEvent do: aBlock for: self;
		yourself.

	^ (CpHtmlElement newWithTag: #div)
		styleAt: 'padding-bottom' put: '12px';
		appendChild: toggle;
		yourself.

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useAutoLayout [

	^ self switchId: self useAutoLayoutId ifMissing: true
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useAutoLayout: aBoolean [

	self switchId: self useAutoLayoutId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useAutoLayoutId [

	^ 'useAutoLayout'
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useAutoLayoutNewSwitch: props [

	^ self
		switchNewWithId: self useAutoLayoutId
		label: 'Use auto layout'
		checked: (props at: #useAutoLayout ifAbsent: [ false ])
		do: [ self useAutoLayoutSet: self useAutoLayout ].

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useAutoLayoutSet: aBoolean [

	aBoolean ifTrue: [ self layoutViewLazy layoutAdaptToWidth ].
	self announceSetting: #useAutoLayout value: aBoolean.

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useAutoLayoutUpdate: aBoolean [

	self useAutoLayout: aBoolean.
	self announceSetting: #useAutoLayout value: aBoolean.

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useModalNav [

	^ self switchId: self useModalNavId ifMissing: false
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useModalNav: aBoolean [

	self switchId: self useModalNavId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useModalNavId [

	^ 'useModalNav'
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useModalNavNewSwitch: props [

	^ self
		switchNewWithId: self useModalNavId
		label: 'Nav rail modal'
		checked: (props at: #useModalNav ifAbsent: [ false ])
		do: [ self useModalNavSet: self useModalNav ].

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useModalNavSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy
		useModalNavAdapt: aBoolean;
		showNavMenuButtonAdapt: aBoolean.
	self announceSetting: #useModalNav value: aBoolean.

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useTwoPaneBody [

	^ self switchId: self useTwoPaneBodyId ifMissing: true
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useTwoPaneBody: aBoolean [

	self switchId: self useTwoPaneBodyId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useTwoPaneBodyId [

	^ 'useTwoPaneBody'
]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useTwoPaneBodyNewSwitch: props [

	^ self
		switchNewWithId: self useTwoPaneBodyId
		label: 'Use two pane layout'
		checked: (props at: #useTwoPaneBody ifAbsent: [ false ])
		do: [ self useTwoPaneBodySet: self useTwoPaneBody ].

]

{ #category : 'settings - switches' }
WamLayoutSettingsView >> useTwoPaneBodySet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy useTwoPaneBodyAdapt: aBoolean.
	self announceSetting: #useTwoPaneBody value: aBoolean.

]
