Class {
	#name : 'WamResponsiveLayoutView',
	#superclass : 'WamView',
	#instVars : [
		'debounceTransition',
		'layoutWidthCached',
		'layoutBreakpoints',
		'popups'
	],
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'class initialization' }
WamResponsiveLayoutView class >> beLoaded [

	CpTransition beLoaded.
	WaIcon beLoaded.
	WaSplitPanel beLoaded

]

{ #category : 'web resources' }
WamResponsiveLayoutView class >> globalStyle [
	<webResource: #css>

	^ self globalStyleMenu
	, self globalStyleTable

]

{ #category : 'web resources' }
WamResponsiveLayoutView class >> globalStyleMenu [
	<webResource: #css>

	^ '
.wam-menu {
  padding: 8px 0;
}

.wam-menu-item::part(base) {
  padding: 0;
}

.wam-menu-item::part(checked-icon) {
  display: none;
}

.wam-menu-item::part(prefix) {
  padding: 0;
}

.wam-menu-item::part(label) {
  padding: 8px 0;
}

.wam-menu-item {
  padding: 0;
  height: 48px;
  min-width: 112px;
  max-width: 280px;
}

.wam-menu-icon {
  padding: 12px;
  font-size: 24px;
  margin-inline-end: 0;
}

.wam-details::part(base) {
  padding: var(--wa-space-s);
  background: var(--wa-color-brand-80);
}

.wam-details::part(summary) {
  padding: 0;
  background: var(--wa-color-brand-80);
}

.wam-details::part(content) {
  padding: 0;
  background: var(--wa-color-brand-80);
}

.wam-navrailx-item {
  display: flex;
  border-radius: 28px;
  height: 56px;
  width: 100%;
  align-items: center;
}

.wam-navrailx-icon {
  padding-left: 20px;
  font-size: 24px;
}

.wam-navrailx-labelText {
  padding-left: 16px;
  font-size: 16px;
}
'

]

{ #category : 'web resources' }
WamResponsiveLayoutView class >> globalStyleTable [
	<webResource: #css>

	^ '
.wam-table {
  width: 100%;
}

table, th, td {
  border-style: solid;
}

caption {
  caption-side: top;
  text-align: left;
  padding: 8px 0;
}
'

]

{ #category : 'web resources' }
WamResponsiveLayoutView class >> style [

	<webResource: #css>

	^ '
.wam-hidden {
  position: absolute !important;
  top: -9999px !important;
  left: -9999px !important;
}

.wam-layout {
  background: var(--wa-color-brand-fill-quiet);
}

.wam-settings-pane {
  padding: 0;
  overflow-y: auto;
}
'

]

{ #category : 'web resources' }
WamResponsiveLayoutView class >> template [

	<webResource: #html>

	^ WamView linkUtilitiesCss, '
<wa-resize-observer>
  <div class="wa-cloak wa-stack wa-gap-0 wa-align-items-stretch">
    <div class="wa-cluster wa-gap-0 wa-align-items-stretch wa-flex-nowrap">
      <slot name="navRail"></slot>
      <slot name="paneLayout"></slot>
    </div>
    <slot name="navBar"></slot>
    <slot name="dockedToolbar"></slot>
  </div>
</wa-resize-observer>
<slot name="navRailModal"></slot>
<slot name="floatingToolbar"></slot>
<slot name="fab"></slot>
<slot name="dialog"></slot>
<slot name="brandDialog"></slot>
'
]

{ #category : 'actions' }
WamResponsiveLayoutView >> announceSetting: aspect value: anObject [

	self serverAnnounce: (WamNavActionEvent id: #layoutSettingChange parameter: {
		#type -> #action.
		#aspect -> aspect.
		#value -> anObject
	} asDictionary).

]

{ #category : 'panes' }
WamResponsiveLayoutView >> appBar2Display: anObject [
	| components |

	self systemLog logTrace5: anObject printString.
	components := WamAppBarView all.

	components do: [ :each |
		each isSecondary ifTrue: [
			each appBarDisplay: anObject ] ].

]

{ #category : 'panes' }
WamResponsiveLayoutView >> appBar2LeadingButtonDisplay: anObject [
	| components |

	components := WamAppBarView all.
	components ifEmpty: [ self systemLog logError: 'appBarMenuDisplay: - No App bar found' ].

	components do: [ :each |
		each isSecondary ifTrue: [
			each appBarLeadingButtonDisplay: anObject ] ].

]

{ #category : 'panes' }
WamResponsiveLayoutView >> appBarDisplay: anObject [
	| components |

	self systemLog logTrace5: anObject printString.
	components := WamAppBarView all.

	components do: [ :each |
		each isPrimary ifTrue: [
			each appBarDisplay: anObject ] ].

]

{ #category : 'panes' }
WamResponsiveLayoutView >> appBarLeadingButtonDisplay: anObject [
	| components |

	components := WamAppBarView all.
	components ifEmpty: [ self systemLog logError: 'appBarMenuDisplay: - No App bar found' ].

	components do: [ :each |
		each isPrimary ifTrue: [
			each appBarLeadingButtonDisplay: anObject ] ].

]

{ #category : 'theme' }
WamResponsiveLayoutView >> applyDesignTokensTheme [

	CpHtmlElement documentBody
		"customPropertyAt: 'wa-form-control-border-style' put: 'none';"
		"customPropertyAt: 'wa-color-brand-fill-quiet' put: 'var(--wa-color-brand-95)';
		customPropertyAt: 'wa-color-brand-fill-normal' put: 'var(--wa-color-brand-90)';"
		"customPropertyAt: 'wa-form-control-height' put: '64px';"
		customPropertyAt: 'wam-space' put: 'var(--wa-space-s)';
		customPropertyAt: 'wam-gap' put: 'var(--wa-space-s)';
		yourself
]

{ #category : 'layout' }
WamResponsiveLayoutView >> applyLayoutProfile: props [

	self navRailExpandedAdapt: (props at: #navRailExpanded ifAbsent: [ false ]).
	self showNavMenuButtonAdapt: (props at: #showNavMenuButton ifAbsent: [ false ]).
	self useModalNavAdapt: (props at: #useModalNav ifAbsent: [ false ]).
	self showNavBarAdapt: (props at: #showNavBar ifAbsent: [ false ]).
	self useTwoPaneBodyAdapt: (props at: #useTwoPaneBody ifAbsent: [ false ]).
	self showSidesheetAdapt: (props at: #showSidesheet ifAbsent: [ false ]).
	self showAppBarAdapt: (props at: #showAppBar ifAbsent: [ false ]).
	self showDockedToolbarAdapt: (props at: #showDockedToolbar ifAbsent: [ false ]).
	self showFloatingToolbarAdapt: (props at: #showFloatingToolbar ifAbsent: [ false ]).

	self resizeBodyRegion.

]

{ #category : 'actions' }
WamResponsiveLayoutView >> beEditablePane2 [

	self fabDisplay: false.
	"self pane2Content wrappedView do: [ :each | each setEditable: true ]."
	self pane2Content setEditable: true.

]

{ #category : 'actions' }
WamResponsiveLayoutView >> beNotEditablePane2 [

	self fabDisplay: true.
	self pane2Content ifNotNil: [ :value | value setEditable: false ].

]

{ #category : 'panes' }
WamResponsiveLayoutView >> bodyHeightAdapt [
	| bodyHeightReduction bodyHeightString |

	bodyHeightReduction := (self showNavBar or: [ self showDockedToolbar ]) ifTrue: [ 64 ] ifFalse: [ 0 ].

	bodyHeightString := bodyHeightReduction > 0
		ifTrue: [ 'calc(100vh - ', bodyHeightReduction printString, 'px)' ]
		ifFalse: [ '100vh' ].

	self styleAt: 'height' put: bodyHeightString.

	self paneLayoutView bodyHeightAdapt: bodyHeightReduction.

]

{ #category : 'panes' }
WamResponsiveLayoutView >> bodySplitPanelAdapt [

	self paneLayoutView pane1WidthSet: self pane1WidthCompute.

]

{ #category : 'panes' }
WamResponsiveLayoutView >> bodyWidthAdapt [

	self paneLayoutView bodyWidthAdapt: self bodyWidthAsCssProperty
]

{ #category : 'panes' }
WamResponsiveLayoutView >> bodyWidthAsCssProperty [
	| reduceByWidth widthString |

	reduceByWidth := self bodyWidthReduction.
	"self showSidesheet ifTrue: [ reduceByWidth := reduceByWidth + 300 ]."
	widthString := reduceByWidth > 0
		ifTrue: [ 'calc(100vw - ', reduceByWidth printString, 'px)' ]
		ifFalse: [ '100vw' ].

	^ widthString

]

{ #category : 'panes' }
WamResponsiveLayoutView >> bodyWidthReduction [

	^ self useModalNav ifTrue: [ 0 ] ifFalse: [ self navRailWidth ]

]

{ #category : 'actions' }
WamResponsiveLayoutView >> brandDialogOpen [

	self brandDialogView brandDialogOpen
]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> brandDialogView [

	^ self firstChildAtSlotNamed: #brandDialog
]

{ #category : 'login' }
WamResponsiveLayoutView >> buttonLabel: label icon: icon send: selector [

	^ self buttonLabel: label icon: icon send: selector receiver: self
]

{ #category : 'login' }
WamResponsiveLayoutView >> buttonLabel: label icon: icon send: selector receiver: receiver [

	^ WaButton new
		label: label;
		start: (WaIcon fullyNamed: icon);
		when: CpClickEvent basicPrimary send: selector to: receiver;
		styleAt: 'width' put: '100%';
		styleAt: 'padding' put: '0 8px 8px 8px';
		yourself.
]

{ #category : 'resize' }
WamResponsiveLayoutView >> debounceResizeEvent: anEvent [

	self systemLog logString: 'debounce'.

	"If a running debounce transition is available, we're done"
	(debounceTransition isNotNil and: [ debounceTransition isRunning ])
		ifTrue: [ ^ self ].

	"Create new debounce transition, run it once"
	debounceTransition
		ifNotNil: [ debounceTransition stop ]
		ifNil: [
			debounceTransition := (CpTransition onBlock: [ self handleResizeEvent: anEvent ])
				duration: 0 "Execute once" ].

	"Set timeout for the debounce"
	debounceTransition startDelayedBy: 50.
]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> dialogView [

	^ self firstChildAtSlotNamed: #dialog
]

{ #category : 'toolbar' }
WamResponsiveLayoutView >> dockedToolbarOff [

	self showDockedToolbar: false.
	self showDockedToolbarAdapt: false.

]

{ #category : 'toolbar' }
WamResponsiveLayoutView >> dockedToolbarOn [

	self showDockedToolbar: true.
	self showDockedToolbarAdapt: true.

]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> dockedToolbarView [

	^ self firstChildAtSlotNamed: #dockedToolbar
]

{ #category : 'toolbar' }
WamResponsiveLayoutView >> fabDisplay: aBoolean [

	self fabView
		ifNil: [ self systemLog logTrace: 'Missing FAB view' ]
		ifNotNil: [ :value |
			"The fab CSS uses fixed position, so use display none"
			value shadowElementId: #container display: aBoolean ]
]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> fabView [

	^ self firstChildAtSlotNamed: #fab
]

{ #category : 'login' }
WamResponsiveLayoutView >> fieldAt: key label: aLabel input: aText [

	^ WaInput new
		name: key;
		addClass: 'wam-input';
		label: aLabel;
		value: aText;
		hint: 'Help text...', aLabel;
		disabled: false;
		attributeAdd: #filled;
		yourself.

]

{ #category : 'login' }
WamResponsiveLayoutView >> findLoginDialog [

	^ CpHtmlElement documentBody firstDescendantMatching: '#login-dialog'

]

{ #category : 'toolbar' }
WamResponsiveLayoutView >> floatingToolbarOff [

	self showFloatingToolbar: false.
	self showFloatingToolbarAdapt: false.

]

{ #category : 'toolbar' }
WamResponsiveLayoutView >> floatingToolbarOn [

	self showFloatingToolbar: true.
	self showFloatingToolbarAdapt: true.

]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> floatingToolbarView [

	^ self firstChildAtSlotNamed: #floatingToolbar
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> fontFamily [

	^ self layoutSettingAt: #fontFamily
]

{ #category : 'theme' }
WamResponsiveLayoutView >> fontFamilyAdapt: aFontFamily [

	CpHtmlElement documentBody customPropertyAt: 'wa-font-family-body' put: aFontFamily.

]

{ #category : 'resize' }
WamResponsiveLayoutView >> handleResizeEvent: anEvent [
	| newWidth |

	debounceTransition := nil.

	anEvent detail valuesDo: [ :eachDetail |
		eachDetail do: [ :eachEntry |
			| rect |
			rect := eachEntry apply: 'contentRect'.
			newWidth := rect apply: 'width'.
			self systemLog logString: 'resize width=', newWidth printString.
			"Don't bother with height. It seems to report 0. Probably no browser support"
			"height := rect apply: 'height'." ] ].

	layoutWidthCached = newWidth ifTrue: [
		self systemLog logString: 'resize width is unchanged'.
		^ self ].

	layoutWidthCached := newWidth.

	self useAutoLayout ifNotNil: [ :value |
		(value not and: [ layoutWidthCached > 0 ]) ifFalse: [
			self systemLog logString: 'resize using layoutAdaptToWidth'.
			^ self layoutAdaptToWidth ] ].

	self systemLog logString: 'resize to newWidth: ', newWidth printString.
	self bodySplitPanelAdapt.
	self bodyWidthAdapt.

]

{ #category : 'actions' }
WamResponsiveLayoutView >> hideNavModal [
	| modalElement |

	modalElement := self modalNavElementOrNil.
	modalElement ifNotNil: [
		modalElement beNotOpen ].
]

{ #category : 'initialization' }
WamResponsiveLayoutView >> initialize [

	super initialize.

	layoutWidthCached := 0.
	layoutBreakpoints := WamLayoutType defaultLayoutBreakpoints.
	popups := IdentityDictionary new.

]

{ #category : 'testing' }
WamResponsiveLayoutView >> isUsingSinglePaneLayout [

	^ self paneLayoutView isUsingSinglePaneLayout.
]

{ #category : 'layout' }
WamResponsiveLayoutView >> layoutAdaptToWidth [

	self layoutBreakpoints do: [ :each |
		layoutWidthCached < each key ifTrue: [
			^ self layoutTypeAdapt: each value ] ].

	self layoutTypeAdapt: self layoutBreakpoints last value.

]

{ #category : 'accessing' }
WamResponsiveLayoutView >> layoutBreakpoints [

	^ layoutBreakpoints
]

{ #category : 'accessing' }
WamResponsiveLayoutView >> layoutBreakpoints: anObject [

	layoutBreakpoints := anObject
]

{ #category : 'initialization' }
WamResponsiveLayoutView >> layoutInitialSetUp: props [
	"Invoked by presenter's viewCreated"

	self systemLog logTrace5: props printString.

	CpHtmlElement documentHtml addClass: 'wa-palette-default'.
	props at: #webAwesomeTheme ifPresent: [ :value | self webAwesomeThemeInitial: value ].
	props at: #variantBrandColor ifPresent: [ :value | self variantBrandColorInitial: value ].
	props at: #fontFamily ifPresent: [ :value | self fontFamilyAdapt: value ].

	self resizeSetUp.

	self applyLayoutProfile: props.
	self layoutAdaptToWidth.
	"(props at: #useAutoLayout ifAbsent: [ true ]) ifTrue: [
		self layoutAdaptToWidth ]."

]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> layoutSettingAt: key [
.
	"^ self customPropertyAt: key"
	^ self settingsView perform: key
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> layoutSettingAt: key put: anObject [
.
	"self customPropertyAt: key put: anObject"
	self settingsView perform: (key, ':') asSymbol with: anObject
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> layoutSettingAtQ: key [
.
	"^ (self customPropertyAt: key) = 'true'"
	^ self settingsView
		ifNil: [ false ]
		ifNotNil: [ :v | v perform: key ]
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> layoutType [

	^ self layoutSettingAt: #layoutType

]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> layoutType: anObject [

	self layoutSettingAt: #layoutType put: anObject
]

{ #category : 'layout' }
WamResponsiveLayoutView >> layoutTypeAdapt: aLayoutType [

	self systemLog logTrace: '**** ', aLayoutType printString.

	self layoutType: (aLayoutType at: #name).
	self setLayoutSettings: aLayoutType.
	self applyLayoutProfile: aLayoutType.
	self settingsView layoutUpdate.

]

{ #category : 'actions' }
WamResponsiveLayoutView >> layoutUpdate [
	| props |

	props := {
		#navRailExpanded -> self navRailExpanded.
		#showNavBar -> self showNavBar.
		#useTwoPaneBody -> self useTwoPaneBody.
		#showAppBar -> self showAppBar.
		#useModalNav -> self useModalNav.
	} asDictionary.

	self announceSetting: #layoutUpdate value: props
]

{ #category : 'accessing' }
WamResponsiveLayoutView >> layoutViewLazy [

	^ self
]

{ #category : 'accessing' }
WamResponsiveLayoutView >> layoutWidthCached [

	^ layoutWidthCached
]

{ #category : 'accessing' }
WamResponsiveLayoutView >> layoutWidthCached: anObject [

	layoutWidthCached := anObject
]

{ #category : 'actions' }
WamResponsiveLayoutView >> modalNavOpen [
	| drawer |

	drawer := self modalNavElementOrNil.
	drawer
		ifNil: [ self systemLog logError: 'modal nav element is nil' ]
		ifNotNil: [ drawer beOpen ]
]

{ #category : 'navbar' }
WamResponsiveLayoutView >> navBarDisplay: aBoolean [

	self navBarView
		ifNil: [ self systemLog logTrace: 'Missing navbar view' ]
		ifNotNil: [ :value | value shadowElementId: #container display: aBoolean ]

]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> navBarView [

	^ self firstChildAtSlotNamed: #navBar
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> navRailExpanded [

	^ self layoutSettingAtQ: #navRailExpanded
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> navRailExpanded: anObject [

	^ self layoutSettingAt: #navRailExpanded put: anObject
]

{ #category : 'navrail' }
WamResponsiveLayoutView >> navRailExpandedAdapt: aBoolean [

	self systemLog logTrace5: aBoolean printString.

	self navRailExpanded: aBoolean.

	self navRegionFind ifNotNil: [ :value |
		value styleAt: 'flex' put: '0 0 ', self navRailWidth printString, 'px' ].

	self modalNavElementOrNil ifNotNil: [ :value |
		value customPropertyAt: 'size' put: self navRailWidth printString, 'px' ].

	self bodySplitPanelAdapt.

]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> navRailModalView [

	^ self firstChildAtSlotNamed: #navRailModal
]

{ #category : 'navrail' }
WamResponsiveLayoutView >> navRailWidth [
	"Answer with of navrail.
	- regular is 96
	- expanded is 220
	- the right border is 1px"

	^ self navRailExpanded ifTrue: [ 221 ] ifFalse: [ 97 ]
]

{ #category : 'navrail' }
WamResponsiveLayoutView >> navRegionDisplay: aBoolean [
	| element |

	element := self navRegionFind.
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> navRegionFind [

	^ self firstChildAtSlotNamed: #navRail
]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> pane1View [

	^ self paneLayoutView pane1View
]

{ #category : 'panes' }
WamResponsiveLayoutView >> pane1WidthCompute [
	| w |

	self isUsingSinglePaneLayout ifTrue: [ | reduceByWidth |
		reduceByWidth := self bodyWidthReduction.
self systemLog logTrace: 'bodyWidthReduction: ', self bodyWidthReduction asString.
self systemLog logTrace: 'layoutWidthCached: ', self layoutWidthCached asString.
		^ reduceByWidth > 0
			ifTrue: [ self layoutWidthCached - self bodyWidthReduction ]
			ifFalse: [ self layoutWidthCached ] ].

	w := (self layoutWidthCached / 2) asInteger.
self systemLog logTrace: 'w1: ', w asString.
	self useModalNav ifFalse: [  w := w - self navRailWidth ].
self systemLog logTrace: 'w2: ', w asString.
	w < self pane1WidthMin ifTrue: [ w := self pane1WidthMin ].
self systemLog logTrace: 'w3: ', w asString.
	^ w
]

{ #category : 'panes' }
WamResponsiveLayoutView >> pane1WidthMin [

	^ 300
]

{ #category : 'panes' }
WamResponsiveLayoutView >> pane2Content [
	| view |

	view := self pane2View firstChildAtSlotNamed: #paneContent.
	"self systemLog logTrace: view printString."

	^ view
]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> pane2View [

	^ self paneLayoutView pane2View
]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> paneLayoutView [

	^ self firstChildAtSlotNamed: #paneLayout
]

{ #category : 'accessing' }
WamResponsiveLayoutView >> popups [

	^ popups
]

{ #category : 'accessing' }
WamResponsiveLayoutView >> popups: anObject [

	popups := anObject
]

{ #category : 'panes' }
WamResponsiveLayoutView >> primaryPaneDisplay: aBoolean [

	self paneLayoutView shadowElementId: 'wamSinglePaneLayoutP1' show: aBoolean.

]

{ #category : 'panes' }
WamResponsiveLayoutView >> primaryPaneOnly [

	self systemLog logTrace5: 'primaryPaneOnly'.

	self isUsingSinglePaneLayout not ifTrue: [
		^ self ].

	self
		showNavBar: true;
		showNavBarAdapt: true;
		"floatingToolbarOff;"
		resizeBodyRegion.
	self primaryPaneDisplay: true.
	self secondaryPaneDisplay: false.

]

{ #category : 'login' }
WamResponsiveLayoutView >> requestLogin [

	self serverAnnounce: (WamSessionEvent id: #login).

]

{ #category : 'panes' }
WamResponsiveLayoutView >> resizeBodyRegion [

	self bodyHeightAdapt.
	self bodyWidthAdapt.

]

{ #category : 'resize' }
WamResponsiveLayoutView >> resizeSetUp [

	(self shadowedFirstDescendantMatching: WaResizeObserver asCssSelector)
		when: WaResizeEvent send: #debounceResizeEvent: to: self
]

{ #category : 'panes' }
WamResponsiveLayoutView >> secondaryPaneDisplay: aBoolean [

	self paneLayoutView shadowElementId: 'wamSinglePaneLayoutP2' show: aBoolean.

]

{ #category : 'panes' }
WamResponsiveLayoutView >> secondaryPaneOnly [

	self systemLog logTrace5: 'secondaryPaneOnly'.

	self isUsingSinglePaneLayout not ifTrue: [
		^ self ].

	self
		showNavBar: false;
		showNavBarAdapt: false;
		"floatingToolbarOn;"
		resizeBodyRegion.
	self primaryPaneDisplay: false.
	self secondaryPaneDisplay: true.

]

{ #category : 'layout' }
WamResponsiveLayoutView >> setLayoutSettings: props [

	self navRailExpanded: (props at: #navRailExpanded ifAbsent: [ false ]).
	self showNavMenuButton: (props at: #showNavMenuButton ifAbsent: [ false ]).
	self useModalNav: (props at: #useModalNav ifAbsent: [ false ]).
	self showNavBar: (props at: #showNavBar ifAbsent: [ false ]).
	self useTwoPaneBody: (props at: #useTwoPaneBody ifAbsent: [ false ]).
	self showAppBar: (props at: #showAppBar ifAbsent: [ false ]).
	self showSidesheet: (props at: #showSidesheet ifAbsent: [ false ]).
	self showDockedToolbar: (props at: #showDockedToolbar ifAbsent: [ false ]).
	self showFloatingToolbar: (props at: #showFloatingToolbar ifAbsent: [ false ]).

]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> settingsView [

	^ self brandDialogView settingsView
]

{ #category : 'actions' }
WamResponsiveLayoutView >> sharedDialogClose [

	self dialogView sharedDialogClose
]

{ #category : 'actions' }
WamResponsiveLayoutView >> sharedDialogOpen [

	self dialogView sharedDialogOpen
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> showAppBar [

	^ self layoutSettingAtQ: #showAppBar
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> showAppBar: anObject [

	self layoutSettingAt: #showAppBar put: anObject
]

{ #category : 'toolbar' }
WamResponsiveLayoutView >> showAppBarAdapt: aBoolean [

	self systemLog logTrace5: aBoolean printString.

	self appBarDisplay: aBoolean.

]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> showDockedToolbar [

	^ self layoutSettingAtQ: #showDockedToolbar
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> showDockedToolbar: anObject [

	self layoutSettingAt: #showDockedToolbar put: anObject
]

{ #category : 'toolbar' }
WamResponsiveLayoutView >> showDockedToolbarAdapt: aBoolean [

	self systemLog logTrace5: aBoolean printString.

	self toolbarDockedDisplay: aBoolean.

]

{ #category : 'toolbar' }
WamResponsiveLayoutView >> showFabAdapt: aBoolean [

	self systemLog logTrace5: aBoolean printString.

	self fabDisplay: aBoolean.

]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> showFloatingToolbar [

	^ self layoutSettingAtQ: #showFloatingToolbar
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> showFloatingToolbar: anObject [

	self layoutSettingAt: #showFloatingToolbar put: anObject
]

{ #category : 'toolbar' }
WamResponsiveLayoutView >> showFloatingToolbarAdapt: aBoolean [

	self systemLog logTrace5: aBoolean printString.

	self toolbarFloatingDisplay: aBoolean.

]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> showNavBar [

	^ self layoutSettingAtQ: #showNavBar
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> showNavBar: anObject [

	self layoutSettingAt: #showNavBar put: anObject
]

{ #category : 'navbar' }
WamResponsiveLayoutView >> showNavBarAdapt: aBoolean [
	| fabView |

	self systemLog logTrace5: aBoolean printString.

	self navBarDisplay: aBoolean.

	fabView := WamFabView first.
	fabView ifNotNil: [ fabView setExtraOffset: aBoolean ].

]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> showNavMenuButton: anObject [

	self layoutSettingAt: #showNavMenuButton put: anObject
]

{ #category : 'panes' }
WamResponsiveLayoutView >> showNavMenuButtonAdapt: aBoolean [

	self appBarLeadingButtonDisplay: aBoolean.

]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> showSidesheet [

	^ self layoutSettingAtQ: #showSidesheet
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> showSidesheet: anObject [

	self layoutSettingAt: #showSidesheet put: anObject
]

{ #category : 'panes' }
WamResponsiveLayoutView >> showSidesheetAdapt: aBoolean [

	self systemLog logTrace5: aBoolean printString.

	self sidesheetDisplay: aBoolean.

]

{ #category : 'panes' }
WamResponsiveLayoutView >> sidesheetDisplay: aBoolean [

	self sidesheetView
		ifNil: [ self systemLog logTrace: 'Missing sidesheet view' ]
		ifNotNil: [ :value | value shadowElementId: #container display: aBoolean ]
]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> sidesheetView [

	^ self paneLayoutView sidesheetView
]

{ #category : 'toolbar' }
WamResponsiveLayoutView >> toolbarDockedDisplay: aBoolean [

	self dockedToolbarView
		ifNil: [ self systemLog logTrace: 'Missing docked toolbar view' ]
		ifNotNil: [ :value | value shadowElementId: #container display: aBoolean ]

]

{ #category : 'toolbar' }
WamResponsiveLayoutView >> toolbarFloatingDisplay: aBoolean [

	self floatingToolbarView
		ifNil: [ self systemLog logTrace: 'Missing floating toolbar view' ]
		ifNotNil: [ :value | value shadowElementId: #container display: aBoolean ]
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> useAutoLayout [

	^ self layoutSettingAtQ: #useAutoLayout
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> useAutoLayout: anObject [

	self layoutSettingAt: #useAutoLayout put: anObject
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> useModalNav [

	^ self layoutSettingAtQ: #useModalNav
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> useModalNav: anObject [

	self layoutSettingAt: #useModalNav put: anObject
]

{ #category : 'navrail' }
WamResponsiveLayoutView >> useModalNavAdapt: aBoolean [

	self systemLog logTrace5: aBoolean printString.

	self navRegionDisplay: aBoolean not.
	self bodySplitPanelAdapt.

]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> useTwoPaneBody [

	^ self layoutSettingAtQ: #useTwoPaneBody
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> useTwoPaneBody: anObject [

	self layoutSettingAt: #useTwoPaneBody put: anObject
]

{ #category : 'panes' }
WamResponsiveLayoutView >> useTwoPaneBodyAdapt: aBoolean [

	self systemLog logTrace5: aBoolean printString.

	aBoolean
		ifTrue: [
			self paneLayoutView useTwoPaneLayout ]
		ifFalse: [
			self paneLayoutView useSinglePaneLayout.
			self primaryPaneOnly.
			self appBar2Display: true ].

]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> variantBrandColor [

	^ self layoutSettingAt: #variantBrandColor
]

{ #category : 'theme' }
WamResponsiveLayoutView >> variantBrandColorAdapt: aColorName from: oldColorName [

	self systemLog logTrace5: aColorName printString.
	aColorName ifNil: [
		^ self ].

	CpHtmlElement documentHtml
		removeClass: ('wa-brand-', oldColorName);
		addClass: ('wa-brand-', aColorName).
]

{ #category : 'theme' }
WamResponsiveLayoutView >> variantBrandColorInitial: aColorName [

	self systemLog logTrace5: aColorName printString.
	aColorName ifNil: [
		^ self ].

	CpHtmlElement documentHtml addClass: ('wa-brand-', aColorName).
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> webAwesomeTheme [

	^ self layoutSettingAt: #webAwesomeTheme
]

{ #category : 'theme' }
WamResponsiveLayoutView >> webAwesomeThemeAdapt: aThemeName from: oldThemeName [

	self systemLog logTrace5: aThemeName printString.
	aThemeName ifNil: [
		^ self ].

	CpHtmlElement documentHtml
		removeClass: ('wa-theme-', oldThemeName);
		addClass: ('wa-theme-', aThemeName).
]

{ #category : 'theme' }
WamResponsiveLayoutView >> webAwesomeThemeInitial: aThemeName [

	self systemLog logTrace5: aThemeName printString.
	aThemeName ifNil: [
		^ self ].

	CpHtmlElement documentHtml addClass: ('wa-theme-', aThemeName).
]
