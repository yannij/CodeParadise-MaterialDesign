Class {
	#name : 'WamResponsiveLayoutView',
	#superclass : 'WamView',
	#instVars : [
		'debounceTransition',
		'layoutSettingsView',
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

]

{ #category : 'web resources' }
WamResponsiveLayoutView class >> globalStyle [
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
  padding: 0;
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
, self styleTable

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
WamResponsiveLayoutView class >> styleTable [
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
WamResponsiveLayoutView class >> template [

	<webResource: #html>

	^ WaElement linkUtilitiesCss, '
<wa-resize-observer>
  <div class="wa-cloak wa-stack wa-gap-0 wa-align-items-stretch">
    <div class="wa-cluster wa-gap-0 wa-align-items-stretch wa-flex-nowrap">
      <slot name="navRail"></slot>
      <slot name="paneLayout"></slot>
      <slot name="sidesheet"></slot>
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
<slot name="layoutReady"></slot>
'
]

{ #category : 'login' }
WamResponsiveLayoutView >> addLoginDialog: label [
	| dialog fields |

	fields := 'div' asHtmlTag
		addClass: 'wam-fields';
		appendChild: (self fieldAt: #loginUsername label: 'Username' input: '');
		appendChild: (self fieldAt: #loginPassword label: 'Password' input: '');
		yourself.

	dialog := WaDialog new
		id: 'login-dialog';
		label: label;
		appendChild: fields;
		appendChild: (self buttonLabel: 'Login' icon: 'right-to-bracket' send: #requestLogin);
		yourself.

	"Do separately, so dialog is not nil"
	dialog appendChild: (self buttonLabel: 'Cancel' icon: 'xmark' send: #openBeOff receiver: dialog).

	CpHtmlElement documentBody appendChild: dialog.

]

{ #category : 'actions' }
WamResponsiveLayoutView >> announceSetting: aspect value: anObject [

	self serverAnnounce: (WamNavActionEvent id: #layoutSettingChange parameter: {
		#type -> #action.
		#aspect -> aspect.
		#value -> anObject
	} asDictionary).

]

{ #category : 'body' }
WamResponsiveLayoutView >> appBar2Display: anObject [
	| components |

	self systemLog logTrace5: anObject printString.
	components := WamAppBarView all.

	components do: [ :each |
		each isSecondary ifTrue: [
			each appBarDisplay: anObject ] ].

]

{ #category : 'body' }
WamResponsiveLayoutView >> appBar2LeadingButtonDisplay: anObject [
	| components |

	components := WamAppBarView all.
	components ifEmpty: [ self systemLog logError: 'appBarMenuDisplay: - No App bar found' ].

	components do: [ :each |
		each isSecondary ifTrue: [
			each appBarLeadingButtonDisplay: anObject ] ].

]

{ #category : 'body' }
WamResponsiveLayoutView >> appBarDisplay: anObject [
	| components |

	self systemLog logTrace5: anObject printString.
	components := WamAppBarView all.

	components do: [ :each |
		each isPrimary ifTrue: [
			each appBarDisplay: anObject ] ].

]

{ #category : 'body' }
WamResponsiveLayoutView >> appBarLeadingButtonDisplay: anObject [
	| components |

	components := WamAppBarView all.
	components ifEmpty: [ self systemLog logError: 'appBarMenuDisplay: - No App bar found' ].

	components do: [ :each |
		each isPrimary ifTrue: [
			each appBarLeadingButtonDisplay: anObject ] ].

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
	"self pane2Content wrappedView do: [ :each | each setEditable: false ]."
	self pane2Content setEditable: false.

]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> bodyFind [

	^ CpHtmlElement documentBody
]

{ #category : 'body' }
WamResponsiveLayoutView >> bodyHeightAdapt [
	| bodyRegion bodyHeightReduction bodyHeightString |

	bodyRegion := self bodyRegionFind.
	bodyRegion ifNil: [
		self systemLog logTrace: 'bodyRegion is nil'.
		^ self ].

	bodyHeightReduction := (self showNavBar or: [ self showDockedToolbar ]) ifTrue: [ 64 ] ifFalse: [ 0 ].
	"self systemLog logString: 'bodyHeightReduction: ', bodyHeightReduction printString."
	bodyHeightString := bodyHeightReduction > 0
		ifTrue: [ 'calc(100vh - ', bodyHeightReduction printString, 'px)' ]
		ifFalse: [ '100vh' ].
	bodyRegion styleAt: 'height' put: bodyHeightString.

	self pane1View
		ifNil: [ self systemLog logTrace: 'Missing pane1 component' ]
		ifNotNil: [ :pv | pv setPaneContentHeightReducedBy: bodyHeightReduction ].
	self pane2View
		ifNil: [ self systemLog logTrace: 'Missing pane2 component' ]
		ifNotNil: [ :pv | pv setPaneContentHeightReducedBy: bodyHeightReduction ].

	self sidesheetView
		ifNil: [ self systemLog logTrace: 'Missing sidesheet component' ]
		ifNotNil: [ :v | v setPaneContentHeightReducedBy: bodyHeightReduction ].

]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> bodyRegionFind [

	^ self firstChildAtSlotNamed: #paneLayout
]

{ #category : 'body' }
WamResponsiveLayoutView >> bodySplitPanelAdapt [
	| paneLayout w |

	paneLayout := WamPaneLayoutView first.
	w := self pane1WidthCompute.

	paneLayout ifNotNil: [
		paneLayout pane1WidthSet: w ].

]

{ #category : 'body' }
WamResponsiveLayoutView >> bodyWidthAdapt [
	| paneLayout |

	paneLayout := WamPaneLayoutView first.

	paneLayout
		ifNil: [ self systemLog logError: 'Missing body region' ]
		ifNotNil: [
			| reduceByWidth widthString |
			reduceByWidth := self useModalNav ifTrue: [ 0 ] ifFalse: [ self navRailWidth ].
			"self showSidesheet ifTrue: [ reduceByWidth := reduceByWidth + 300 ]."
			widthString := reduceByWidth > 0
				ifTrue: [ 'calc(100vw - ', reduceByWidth printString, 'px)' ]
				ifFalse: [ '100vw' ].
			paneLayout styleAt: 'width' put: widthString ].

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

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> colorProperty: customPropertyName rgb: rgb [

	self customPropertyAt: customPropertyName put: rgb
]

{ #category : 'color theme' }
WamResponsiveLayoutView >> colorThemeAdapt: aColorName [

	self systemLog logTrace5: aColorName printString.
	aColorName ifNil: [ ^ self ].
	"self updateGlobalStyle."
	CpHtmlElement documentHtml
		addClass: 'wa-theme-default';
		addClass: 'wa-palette-default';
		addClass: ('wa-brand-', aColorName).
	CpHtmlElement documentBody
		customPropertyAt: 'wa-color-brand-fill-quiet' put: 'var(--wa-color-brand-95)';
		customPropertyAt: 'wa-color-brand-fill-normal' put: 'var(--wa-color-brand-90)'
]

{ #category : 'color theme' }
WamResponsiveLayoutView >> colorThemeAdapt: aColorName from: oldColorName [

	self systemLog logTrace5: aColorName printString.
	aColorName ifNil: [
		^ self ].

	CpHtmlElement documentHtml
		removeClass: ('wa-brand-', oldColorName);
		addClass: ('wa-brand-', aColorName).
]

{ #category : 'color theme' }
WamResponsiveLayoutView >> colorThemeFrom: base on: aStream [

	#('05' '10' '20' '30' '40' '50' '60' '70' '80' '90' '95') do: [ :each |
		aStream
			nextPutAll: '--wa-color-brand-';
			nextPutAll: each;
			nextPutAll: ': var(--wa-color-', base, '-';
			nextPutAll: each;
			nextPutAll: ');';
			yourself ].

]

{ #category : 'color theme' }
WamResponsiveLayoutView >> colorThemeInitial: aColorName [

	self systemLog logTrace5: aColorName printString.
	aColorName ifNil: [
		^ self ].

	CpHtmlElement documentHtml
		addClass: 'wa-theme-default';
		addClass: 'wa-palette-default';
		addClass: ('wa-brand-', aColorName).
]

{ #category : 'accessing - settings' }
WamResponsiveLayoutView >> colorThemeName [

	^ self layoutSettingAt: #colorThemeName
]

{ #category : 'color theme' }
WamResponsiveLayoutView >> colorThemePut: theme [
	| element |

	element := CpHtmlElement documentBody.
	theme do: [ :each |
		element customPropertyAt: each key put: each value ].
	CpHtmlElement documentBody
		"customPropertyAt: 'wa-form-control-border-style' put: 'none';"
		customPropertyAt: 'wa-color-brand-fill-quiet' put: 'var(--wa-color-brand-95)';
		customPropertyAt: 'wa-color-brand-fill-normal' put: 'var(--wa-color-brand-90)'

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
		labelText: aLabel;
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

{ #category : 'typography' }
WamResponsiveLayoutView >> fontFamilyAdapt: aFontFamily [
	| element |

	aFontFamily ifNil: [ ^ self ].
	"aFontFamily = self fontFamily ifTrue: [ ^ self ]."

	element := self bodyFind.
	element ifNil: [ ^ self ].

	element styleAt: 'font-family' put: aFontFamily

]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> getPaneLayoutComponent: aSlotName [
	| bodyRegion component |

	bodyRegion := self paneLayoutView.
	bodyRegion ifNil: [ self systemLog logTrace: 'paneLayoutView is nil' ].
	component := bodyRegion firstChildAtSlotNamed: aSlotName.
	component ifNil: [ self systemLog logTrace: 'No element at slot: ', aSlotName printString ].
	^ component
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
		^ self ].

	layoutWidthCached := newWidth.

	self useAutoLayout ifNotNil: [ :value |
		(value not and: [ layoutWidthCached > 0 ]) ifFalse: [
			^ self layoutAdaptToWidth ] ].

	self bodySplitPanelAdapt.
	self bodyWidthAdapt.

]

{ #category : 'actions' }
WamResponsiveLayoutView >> hideNavModal [
	| modalElement |

	modalElement := self modalNavElementOrNil.
	modalElement ifNotNil: [
		modalElement openBeOff ].
]

{ #category : 'initialization' }
WamResponsiveLayoutView >> initialize [

	super initialize.

	layoutWidthCached := 0.
	layoutBreakpoints := WamLayoutType defaultLayoutBreakpoints.
	popups := IdentityDictionary new.

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

	props at: #colorThemeName ifPresent: [ :value | self colorThemeInitial: value ].
	props at: #fontFamily ifPresent: [ :value | self fontFamilyAdapt: value ].
	self applyLayoutProfile: props.

	(props at: #useAutoLayout ifAbsent: [ true ]) ifTrue: [
		self layoutAdaptToWidth ].

	self resizeSetUp.


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
WamResponsiveLayoutView >> loginOpen [

	self systemLog logTrace: 'loginOpen'.
	self findLoginDialog openBeOn

]

{ #category : 'actions' }
WamResponsiveLayoutView >> modalNavOpen [
	| drawer |

	drawer := self modalNavElementOrNil.
	drawer
		ifNil: [ self systemLog logError: 'modal nav element is nil' ]
		ifNotNil: [ drawer openBeOn ]
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

	^ self navRailExpanded ifTrue: [ 220 ] ifFalse: [ 96 ]
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
	| paneLayoutView slotName |

	paneLayoutView := self paneLayoutView.
	paneLayoutView ifNil: [ ^ self ].
	slotName := paneLayoutView isUsingSinglePaneLayout
		ifTrue: [ 'singlePaneLayoutP1' ]
		ifFalse: [ 'twoPaneLayoutP1' ].
	^ paneLayoutView firstChildAtSlotNamed: slotName
]

{ #category : 'body' }
WamResponsiveLayoutView >> pane1WidthCompute [
	| w |

	w := (self layoutWidthCached / 2) asInteger.
	self useModalNav ifFalse: [  w := w - self navRailWidth ].
	w < self pane1WidthMin ifTrue: [ w := self pane1WidthMin ].
	^ w
]

{ #category : 'body' }
WamResponsiveLayoutView >> pane1WidthMin [

	^ 300
]

{ #category : 'actions' }
WamResponsiveLayoutView >> pane2Content [
	| view |

	view := self pane2View firstChildAtSlotNamed: #paneContent.
	self systemLog logTrace: view printString.

	"^ WamItemWrapperView all"
	^ view
]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> pane2View [
	| paneLayoutView pane2SlotName |

	paneLayoutView := self paneLayoutView.
	paneLayoutView ifNil: [ ^ self ].
	pane2SlotName := paneLayoutView isUsingSinglePaneLayout
		ifTrue: [ 'singlePaneLayoutP2' ]
		ifFalse: [ 'twoPaneLayoutP2' ].
	^ paneLayoutView firstChildAtSlotNamed: pane2SlotName
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

{ #category : 'actions' }
WamResponsiveLayoutView >> primaryPaneOnly [

	self paneLayoutView primaryPaneOnly
]

{ #category : 'login' }
WamResponsiveLayoutView >> requestLogin [

	self systemLog logTrace: '==== request login'.
	self serverAnnounce: (WamLoginRequested new).
	self findLoginDialog openBeOff.

]

{ #category : 'body' }
WamResponsiveLayoutView >> resizeBodyRegion [

	self bodyHeightAdapt.
	self bodyWidthAdapt.

]

{ #category : 'resize' }
WamResponsiveLayoutView >> resizeSetUp [

	(self shadowedFirstDescendantMatching: WaResizeObserver asCssSelector)
		when: WaResizeEvent send: #debounceResizeEvent: to: self
]

{ #category : 'body' }
WamResponsiveLayoutView >> secondaryPaneOnly [
	| component |

	self systemLog logTrace5: 'secondaryPaneOnly'.

	component := self paneLayoutView.
	component ifNil: [
		^ self systemLog logError: 'Pane lyout not found' ].
	component secondaryPaneOnly.

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

{ #category : 'body' }
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

{ #category : 'sidesheet' }
WamResponsiveLayoutView >> showSidesheetAdapt: aBoolean [

	self systemLog logTrace5: aBoolean printString.

	self sidesheetDisplay: aBoolean.

]

{ #category : 'sidesheet' }
WamResponsiveLayoutView >> sidesheetDisplay: aBoolean [

	self sidesheetView
		ifNil: [ self systemLog logTrace: 'Missing sidesheet view' ]
		ifNotNil: [ :value | value shadowElementId: #container display: aBoolean ]
]

{ #category : 'accessing - components' }
WamResponsiveLayoutView >> sidesheetView [

	^ self firstChildAtSlotNamed: #sidesheet
	"^ self getPaneLayoutComponent: #sidesheet"
]

{ #category : 'initialization' }
WamResponsiveLayoutView >> themeUpdate [

	^ String streamContents: [:s |
		s nextPutAll: '
:root,
:host,
.sl-theme-light {
'.
		self colorThemeFrom: self colorThemeName asString on: s.
		"s nextPutAll: '--sl-focus-ring-style: none;'.
		s nextPutAll: '--sl-input-color: #1D1B20;'.
		s nextPutAll: '--sl-input-color-disabled: #1D1B20;'.
		s nextPutAll: '--sl-input-background-color-focus: #E6E0E9;'.
		s nextPutAll: '--sl-input-filled-color: #1D1B20;'.
		s nextPutAll: '--sl-input-filled-color-disabled: #1D1B20;'.
		s nextPutAll: '--sl-input-filled-background-color-focus: #E6E0E9;'."
		s nextPutAll: '
}
' ]
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

{ #category : 'initialization' }
WamResponsiveLayoutView >> updateGlobalStyle [

	self systemLog logTrace5: 'colorThemeName = ', self colorThemeName printString.
	self colorThemeName ifNil: [ ^ self ].
	CpHtmlElement documentAddStyle: self themeUpdate.

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

{ #category : 'body' }
WamResponsiveLayoutView >> useTwoPaneBodyAdapt: aBoolean [
	| component |

	self systemLog logTrace5: aBoolean printString.

	component := WamPaneLayoutView first.
	component ifNotNil: [
		aBoolean
			ifTrue: [ component useTwoPaneLayout ]
			ifFalse: [ component useSinglePaneLayout ] ].

]
