Class {
	#name : 'SlmdLayoutSettingsView',
	#superclass : 'SlmdLayoutComponentView',
	#instVars : [
		'drawer',
		'colorThemeName',
		'fontFamily'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'class initialization' }
SlmdLayoutSettingsView class >> beLoaded [

	SlDrawer beLoaded
]

{ #category : 'web resources' }
SlmdLayoutSettingsView class >> template [
	<webResource: #html>

	^ '
<div id="container">
  <slot name="content"></slot>
</div>
'
]

{ #category : 'utilities' }
SlmdLayoutSettingsView >> addAttributeContainerStyle: element [

	^ element styleAt: 'padding-bottom' put: '12px'; yourself
]

{ #category : 'settings - choosers' }
SlmdLayoutSettingsView >> colorThemeBuildChooser: props [
	| chooser selectedItem |

	selectedItem := props at: #colorThemeName ifAbsent: [].
	chooser := SlSelect new
		id: 'smdColorThemeChooser';
		labelText: 'Use color theme:';
		propertyAt: 'value' put: selectedItem asString;
		yourself.
	self colorThemeName: selectedItem.

	chooser when: SlChangeEvent do: [ self colorThemeNameSet: chooser value ] for: self.

	#(
gray red orange amber yellow lime green emerald teal cyan sky blue indigo violet purple fuchsia pink rose
	) do: [ :each |
		chooser appendChild: (SlOption new value: each; textContent: each capitalized; yourself) ].

	^ self addAttributeContainerStyle: chooser
]

{ #category : 'accessing' }
SlmdLayoutSettingsView >> colorThemeName [

	^ colorThemeName
]

{ #category : 'accessing' }
SlmdLayoutSettingsView >> colorThemeName: anObject [

	colorThemeName := anObject asString
]

{ #category : 'settings - choosers' }
SlmdLayoutSettingsView >> colorThemeNameSet: anObject [

	self colorThemeName = anObject ifTrue: [
		^ self ].

	self colorThemeName: anObject.
	self layoutViewLazy colorThemeAdapt: anObject.
	self announceSetting: #colorThemeName value: anObject.

]

{ #category : 'accessing' }
SlmdLayoutSettingsView >> drawer [

	^ drawer
]

{ #category : 'accessing' }
SlmdLayoutSettingsView >> drawer: anObject [

	drawer := anObject
]

{ #category : 'utilities' }
SlmdLayoutSettingsView >> elementId: id [

	"^ drawer shadowedFirstDescendantMatching: '#', id"
	"^ drawer shadowedElementWithId: id"
	^ drawer firstDescendantMatching: '#', id
	"^ self findByIdInLightDom: id"
	"^ self findByIdInShadowDom: id"
	"^ CpHtmlElement documentBody firstDescendantMatching: '#', id"
]

{ #category : 'utilities' }
SlmdLayoutSettingsView >> elementId: id propertyAt: key ifMissing: aBlock [
	| element |

	element := self elementId: id.
	element ifNil: [ ^ aBlock value ].
	^ element propertyAt: key
]

{ #category : 'utilities' }
SlmdLayoutSettingsView >> elementId: id propertyAt: key put: value ifMissing: aBlock [
	| element |

	element := self elementId: id.
	element ifNil: [ ^ aBlock value ].
	element propertyAt: key put: value.

]

{ #category : 'accessing' }
SlmdLayoutSettingsView >> fontFamily [

	^ fontFamily
]

{ #category : 'accessing' }
SlmdLayoutSettingsView >> fontFamily: anObject [

	fontFamily := anObject
]

{ #category : 'settings - choosers' }
SlmdLayoutSettingsView >> fontFamilyChooser: props [
	| chooser selectedItem |

	selectedItem := props at: #fontFamily ifAbsent: [].
	chooser := SlSelect new
		id: 'smdFontFamilyChooser';
		labelText: 'Use font family:';
		propertyAt: 'value' put: selectedItem asString;
		yourself.

	chooser when: SlChangeEvent do: [ self fontFamilySet: chooser value ] for: self.

	{
nil -> 'Default'.
#'var(--sl-font-sans)' -> 'Sans'.
#'var(--sl-font-serif)' -> 'Serif'.
#'var(--sl-font-mono)' -> 'Mono'
	} do: [ :each |
		chooser appendChild: (SlOption new value: each key; textContent: each value capitalized; yourself) ].

	^ self addAttributeContainerStyle: chooser
]

{ #category : 'settings - choosers' }
SlmdLayoutSettingsView >> fontFamilySet: anObject [

	self fontFamily = anObject ifTrue: [
		^ self ].

	self fontFamily: anObject.
	self layoutViewLazy fontFamilyAdapt: anObject.
	self announceSetting: #fontFamily value: anObject.

]

{ #category : 'initalize' }
SlmdLayoutSettingsView >> layoutInitialSetUp: props [

	self layoutViewLazy layoutInitialSetUp: props.

]

{ #category : 'settings - choosers' }
SlmdLayoutSettingsView >> layoutType [

	^ self elementId: 'smdLayoutTypeChooser' propertyAt: #value ifMissing: nil
]

{ #category : 'settings - choosers' }
SlmdLayoutSettingsView >> layoutType: aLayoutType [

	self elementId: 'smdLayoutTypeChooser' propertyAt: #value put: aLayoutType ifMissing: nil
]

{ #category : 'settings - choosers' }
SlmdLayoutSettingsView >> layoutTypeBuildChooser: props [
	| radioGroup selectedItem |

	selectedItem := props at: #layoutType ifAbsent: [].

	radioGroup := SlRadioGroup new
		id: 'smdLayoutTypeChooser';
		propertyAt: 'label' put: 'Use layout style:';
		propertyAt: 'value' put: selectedItem asString;
		yourself.

	radioGroup when: SlChangeEvent do: [ self layoutTypeSet: radioGroup value ] for: self.

	SlmdResponsiveLayoutView layoutTypeList do: [ :each |
		radioGroup appendChild: (SlRadio new value: each key; textContent: each value; yourself) ].

	^ self addAttributeContainerStyle: radioGroup
]

{ #category : 'settings - choosers' }
SlmdLayoutSettingsView >> layoutTypeSet: anObject [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy layoutTypeAdapt: anObject.
	self announceSetting: #layoutType value: anObject.

]

{ #category : 'actions' }
SlmdLayoutSettingsView >> layoutUpdate [
	| props |

	props := {
		#navRailExpanded -> self navRailExpanded.
		#showNavBar -> self showNavBar.
		#showSidesheet -> self showSidesheet.
		#useTwoPaneBody -> self useTwoPaneBody.
		#showAppBar -> self showAppBar.
		#useModalNav -> self useModalNav.
	} asDictionary.

	self layoutViewLazy announceSetting: #layoutUpdate value: props
]

{ #category : 'initalize' }
SlmdLayoutSettingsView >> modalDivContentWith: props [
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

{ #category : 'initalize' }
SlmdLayoutSettingsView >> modalDivSetUp: aDictionary [

	drawer := SlDrawer new
		id: 'smdSettings';
		label: 'Layout settings';
		customPropertyAt: 'size' put: '50vw';
		"placement: 'top';"
		appendChild: (self modalDivContentWith: aDictionary);
		yourself.

	self modalDivFind
		appendChild: drawer
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> navRailExpanded [

	^ self switchId: self navRailExpandedId ifMissing: true
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> navRailExpanded: aBoolean [

	self switchId: self navRailExpandedId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> navRailExpandedId [

	^ 'navRailExpanded'
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> navRailExpandedNewSwitch: props [
	| element |

	element := self
		switchNewWithId: self navRailExpandedId
		label: 'Nav rail expanded'
		checked: (props at: #navRailExpanded ifAbsent: [ false ])
		do: [ self navRailExpandedSet: self navRailExpanded ].

	^ self addAttributeContainerStyle: element

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> navRailExpandedSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy navRailExpandedAdapt: aBoolean.
	self announceSetting: #navRailExpanded value: aBoolean.

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showAppBar [

	^ self switchId: self showAppBarId ifMissing: true
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showAppBar: aBoolean [

	self switchId: self showAppBarId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showAppBarId [

	^ 'showAppBar'
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showAppBarLeadingButtonId [

	^ 'showAppBarLeadingButton'
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showAppBarNewSwitch: props [

	^ self
		switchNewWithId: self showAppBarId
		label: 'Show App bar'
		checked: (props at: #showAppBar ifAbsent: [ false ])
		do: [ self showAppBarSet: self showAppBar ].

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showAppBarSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy appBarDisplay: aBoolean.
	self announceSetting: #showAppBar value: aBoolean.

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showDockedToolbar [

	^ self switchId: self showDockedToolbarId ifMissing: false
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showDockedToolbar: aBoolean [

	self switchId: self showDockedToolbarId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showDockedToolbarId [

	^ 'showDockedToolbar'
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showDockedToolbarNewSwitch: props [

	^ self
		switchNewWithId: self showDockedToolbarId
		label: 'Show Docked Toolbar'
		checked: (props at: #showDockedToolbar ifAbsent: [ false ])
		do: [ self showDockedToolbarSet: self showDockedToolbar ].

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showDockedToolbarSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy showDockedToolbarAdapt: aBoolean; adjustBodyHeight.
	self announceSetting: #showDockedToolbar value: aBoolean.

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showFloatingToolbar [

	^ self switchId: self showFloatingToolbarId ifMissing: false
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showFloatingToolbar: aBoolean [

	self switchId: self showFloatingToolbarId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showFloatingToolbarId [

	^ 'showFloatingToolbar'
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showFloatingToolbarNewSwitch: props [

	^ self
		switchNewWithId: self showFloatingToolbarId
		label: 'Show Floating Toolbar'
		checked: (props at: #showFloatingToolbar ifAbsent: [ false ])
		do: [ self showFloatingToolbarSet: self showFloatingToolbar ].

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showFloatingToolbarSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy showFloatingToolbarAdapt: aBoolean.
	self announceSetting: #showFloatingToolbar value: aBoolean.

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showNavBar [

	^ self switchId: self showNavBarId ifMissing: false
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showNavBar: aBoolean [

	self switchId: self showNavBarId put: aBoolean ifMissing: false
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showNavBarId [

	^ 'showNavBar'
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showNavBarNewSwitch: props [

	^ self
		switchNewWithId: self showNavBarId
		label: 'Show Nav bar'
		checked: (props at: #showNavBar ifAbsent: [ false ])
		do: [ self showNavBarSet: self showNavBar ].

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showNavBarSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy showNavBarAdapt: aBoolean; adjustBodyHeight.
	self announceSetting: #showNavBar value: aBoolean.

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showNavMenuButton [

	^ self switchId: self showNavMenuButtonId ifMissing: false
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showNavMenuButton: aBoolean [

	self switchId: self showNavMenuButtonId put: aBoolean ifMissing: false
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showNavMenuButtonId [

	^ 'showNavMenuButton'
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showNavMenuButtonNewSwitch: props [

	^ self
		switchNewWithId: self showNavMenuButtonId
		label: 'Show Nav menu button'
		checked: (props at: #showMenuButtonBar ifAbsent: [ false ])
		do: [ self showNavMenuButtonSet: self showNavMenuButton ].

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showNavMenuButtonSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy showNavMenuButtonAdapt: aBoolean.
	self announceSetting: #showNavMenuButton value: aBoolean.

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showSidesheet [

	^ self switchId: self showSidesheetId ifMissing: true
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showSidesheet: aBoolean [

	self switchId: self showSidesheetId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showSidesheetId [

	^ 'showSidesheet'
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showSidesheetNewSwitch: props [

	^ self
		switchNewWithId: self showSidesheetId
		label: 'Show Sidesheet'
		checked: (props at: #showSidesheet ifAbsent: [ false ])
		do: [ self showSidesheetSet: self showSidesheet ].

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> showSidesheetSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy sidesheetDisplay: aBoolean.
	self announceSetting: #showSidesheet value: aBoolean.

]

{ #category : 'utilities' }
SlmdLayoutSettingsView >> switchId: id ifMissing: aBlock [

	^ self elementId: id propertyAt: #checked ifMissing: aBlock
]

{ #category : 'utilities' }
SlmdLayoutSettingsView >> switchId: id put: value ifMissing: aBlock [

	^ self elementId: id propertyAt: #checked put: value ifMissing: nil
]

{ #category : 'utilities' }
SlmdLayoutSettingsView >> switchNewWithId: id label: label checked: checked do: aBlock [
	| toggle |

	toggle := SlSwitch new
		id: id;
		label: label;
		checked: checked;
		when: SlChangeEvent do: aBlock for: self;
		yourself.

	^ (CpHtmlElement newWithTag: #div)
		styleAt: 'padding-bottom' put: '12px';
		appendChild: toggle;
		yourself.

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useAutoLayout [

	^ self switchId: self useAutoLayoutId ifMissing: true
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useAutoLayout: aBoolean [

	self switchId: self useAutoLayoutId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useAutoLayoutId [

	^ 'useAutoLayout'
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useAutoLayoutNewSwitch: props [

	^ self
		switchNewWithId: self useAutoLayoutId
		label: 'Use auto layout'
		checked: (props at: #useAutoLayout ifAbsent: [ false ])
		do: [ self useAutoLayoutSet: self useAutoLayout ].

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useAutoLayoutSet: aBoolean [

	aBoolean ifTrue: [ self layoutViewLazy layoutAdaptToWidth ].
	self announceSetting: #useAutoLayout value: aBoolean.

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useAutoLayoutUpdate: aBoolean [

	self useAutoLayout: aBoolean.
	self announceSetting: #useAutoLayout value: aBoolean.

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useModalNav [

	^ self switchId: self useModalNavId ifMissing: false
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useModalNav: aBoolean [

	self switchId: self useModalNavId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useModalNavId [

	^ 'useModalNav'
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useModalNavNewSwitch: props [

	^ self
		switchNewWithId: self useModalNavId
		label: 'Nav rail modal'
		checked: (props at: #useModalNav ifAbsent: [ false ])
		do: [ self useModalNavSet: self useModalNav ].

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useModalNavSet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy
		useModalNavAdapt: aBoolean;
		showNavMenuButtonAdapt: aBoolean.
	self announceSetting: #useModalNav value: aBoolean.

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useTwoPaneBody [

	^ self switchId: self useTwoPaneBodyId ifMissing: true
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useTwoPaneBody: aBoolean [

	self switchId: self useTwoPaneBodyId put: aBoolean ifMissing: nil
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useTwoPaneBodyId [

	^ 'useTwoPaneBody'
]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useTwoPaneBodyNewSwitch: props [

	^ self
		switchNewWithId: self useTwoPaneBodyId
		label: 'Use two pane layout'
		checked: (props at: #useTwoPaneBody ifAbsent: [ false ])
		do: [ self useTwoPaneBodySet: self useTwoPaneBody ].

]

{ #category : 'settings - switches' }
SlmdLayoutSettingsView >> useTwoPaneBodySet: aBoolean [

	self useAutoLayoutUpdate: false.

	self layoutViewLazy useTwoPaneBodyAdapt: aBoolean.
	self announceSetting: #useTwoPaneBody value: aBoolean.

]
