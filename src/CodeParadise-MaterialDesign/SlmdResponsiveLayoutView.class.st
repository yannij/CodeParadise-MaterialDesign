Class {
	#name : 'SlmdResponsiveLayoutView',
	#superclass : 'SlmdView',
	#instVars : [
		'debounceTransition',
		'layoutSettingsView',
		'layoutWidthCached',
		'activeToolbarDocked',
		'activeToolbarFloating',
		'activeFab'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'class initialization' }
SlmdResponsiveLayoutView class >> beLoaded [

	CpTransition beLoaded.

]

{ #category : 'web resources' }
SlmdResponsiveLayoutView class >> globalStyle [
	<webResource: #css>

	^ '
.smd-menu {
  padding: 8px 0;
}

.smd-menu-item::part(base) {
  padding: 0;
}

.smd-menu-item::part(checked-icon) {
  display: none;
}

.smd-menu-item::part(prefix) {
  padding: 0;
}

.smd-menu-item::part(label) {
  padding: 8px 0;
}

.smd-menu-item {
  padding: 0;
  height: 48px;
  min-width: 112px;
  max-width: 280px;
}

.smd-menu-icon {
  padding: 12px;
  font-size: 24px;
  margin-inline-end: 0;
}
'

]

{ #category : 'accessing' }
SlmdResponsiveLayoutView class >> layoutTypeCompact [

	^ #compact
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView class >> layoutTypeExpanded [

	^ #expanded
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView class >> layoutTypeExtraLarge [

	^ #'extra-large'
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView class >> layoutTypeLarge [

	^ #large
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView class >> layoutTypeList [

	^ {
	self layoutTypeCompact -> 'Compact'.
	self layoutTypeMedium -> 'Medium'.
	self layoutTypeExpanded -> 'Expanded'.
	self layoutTypeLarge -> 'Large'.
	self layoutTypeExtraLarge -> 'Extra-large'.
	}
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView class >> layoutTypeMedium [

	^ #medium
]

{ #category : 'web resources' }
SlmdResponsiveLayoutView class >> style [

	<webResource: #css>

	^ '
.smd-hidden {
  position: absolute !important;
  top: -9999px !important;
  left: -9999px !important;
}

.smd-layout {
  background: var(--sl-color-primary-100);
}

.smd-settings-pane {
  padding: 0;
  overflow-y: auto;
}

.smd-body-region {
  flex: auto;
  display: flex;  
  flex-direction: row;
  background: var(--sl-color-primary-100);
}
'
, SlmdNavRailView styleNav

]

{ #category : 'web resources' }
SlmdResponsiveLayoutView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-layout">
  <div style="display: flex; flex-direction: column">
    <div style="height: 100%; flex: 1; display: flex; flex-direction: row">
      <div id="smdNavRegion" class="smd-navRegion">
        <slot name="navRegion">
        </slot>
      </div>
      <div id="smdBodyRegion" class="smd-body-region">
        <div style="flex: 100%">
          <slot name="paneLayout"></slot>
        </div>
      </div>
      <div id="smdSidesheet">
        <slot name="sidesheet"></slot>
      </div>
    </div>
    <footer id="smdNavBar">
      <slot name="navBar"></slot>
    </footer>
    <footer id="smdDockedToolbar">
      <slot name="dockedToolbar"></slot>
    </footer>
    <div id="smdFloatingToolbar">
      <slot name="floatingToolbar"></slot>
    </div>
    <slot name="fab"></slot>
  </div>
  <div id="smdModalDiv"></div>
</div>
'
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView >> activeFab [

	^ activeFab
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView >> activeFab: anObject [

	activeFab := anObject
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView >> activeToolbarDocked [

	^ activeToolbarDocked
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView >> activeToolbarDocked: anObject [

	activeToolbarDocked := anObject
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView >> activeToolbarFloating [

	^ activeToolbarFloating
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView >> activeToolbarFloating: anObject [

	activeToolbarFloating := anObject
]

{ #category : 'body' }
SlmdResponsiveLayoutView >> adjustBodyHeight [
	| bodyRegion bodyHeight |

	bodyRegion := self bodyRegionFind.
	bodyRegion ifNil: [ ^ self  ].

	bodyHeight := (self showNavBar or: [ self showDockedToolbar ])
		ifTrue: [ 'calc(100vh - 64px)' ]
		ifFalse: [ '100vh' ].
	bodyRegion styleAt: 'height' put: bodyHeight.
	bodyRegion styleAt: 'max-height' put: bodyHeight.
]

{ #category : 'body' }
SlmdResponsiveLayoutView >> appBar2Display: anObject [
	| components |

	self logTrace5: anObject printString method: 'appBar2Display:'.
	components := SlmdAppBarView all.

	components do: [ :each |
		each isSecondary ifTrue: [
			each appBarDisplay: anObject ] ].

]

{ #category : 'body' }
SlmdResponsiveLayoutView >> appBar2LeadingButtonDisplay: anObject [
	| components |

	components := SlmdAppBarView all.
	components ifEmpty: [ self logError: 'appBarMenuDisplay: - No App bar found' ].

	components do: [ :each |
		each isSecondary ifTrue: [
			each appBarLeadingButtonDisplay: anObject ] ].

]

{ #category : 'body' }
SlmdResponsiveLayoutView >> appBarDisplay: anObject [
	| components |

	self logTrace5: anObject printString method: 'appBarDisplay:'.
	components := SlmdAppBarView all.

	components do: [ :each |
		each isPrimary ifTrue: [
			each appBarDisplay: anObject ] ].

]

{ #category : 'body' }
SlmdResponsiveLayoutView >> appBarLeadingButtonDisplay: anObject [
	| components |

	components := SlmdAppBarView all.
	components ifEmpty: [ self logError: 'appBarMenuDisplay: - No App bar found' ].

	components do: [ :each |
		each isPrimary ifTrue: [
			each appBarLeadingButtonDisplay: anObject ] ].

]

{ #category : 'layout' }
SlmdResponsiveLayoutView >> applyLayoutProfile: props [

	self navRailExpandedAdapt: (props at: #navRailExpanded ifAbsent: [ false ]).
	self showNavMenuButtonAdapt: (props at: #showNavMenuButton ifAbsent: [ false ]).
	self useModalNavAdapt: (props at: #useModalNav ifAbsent: [ false ]).
	self showNavBarAdapt: (props at: #showNavBar ifAbsent: [ false ]).
	self useTwoPaneBodyAdapt: (props at: #useTwoPaneBody ifAbsent: [ false ]).
	self showSidesheetAdapt: (props at: #showSidesheet ifAbsent: [ false ]).
	self showAppBarAdapt: (props at: #showAppBar ifAbsent: [ false ]).
	self showDockedToolbarAdapt: (props at: #showDockedToolbar ifAbsent: [ false ]).
	"self showFloatingToolbarAdapt: (props at: #showFloatingToolbar ifAbsent: [ false ])."

	self adjustBodyHeight.

]

{ #category : 'actions - nav' }
SlmdResponsiveLayoutView >> beEditablePane2 [
	| wrappers |

	wrappers := SlmdItemWrapperView all.
	wrappers do: [ :each |
		each wrappedView
			setEditable: true;
			"setFocus;"
			yourself ]

]

{ #category : 'body' }
SlmdResponsiveLayoutView >> bodyFind [

	"^ self lastAncestorMatching: 'body'"
	^ CpHtmlElement documentBody
]

{ #category : 'body' }
SlmdResponsiveLayoutView >> bodyRegionFind [

	^ self findByIdInShadowDom: 'smdBodyRegion'
]

{ #category : 'body' }
SlmdResponsiveLayoutView >> bodySplitPanelAdapt [
	| paneLayout w |

	paneLayout := SlmdPaneLayoutView first.
	w := self pane1WidthCompute.

	paneLayout ifNotNil: [
		paneLayout pane1WidthSet: w ].

]

{ #category : 'color theme' }
SlmdResponsiveLayoutView >> colorThemeAdapt: aColorName [

	self logTrace5: aColorName printString method: 'colorThemeAdapt:'.
	aColorName ifNil: [ ^ self ].
	self updateGlobalStyle.

]

{ #category : 'color theme' }
SlmdResponsiveLayoutView >> colorThemeFrom: base on: aStream [

	#('50' '100' '200' '300' '400' '500' '600' '700' '800' '900' '950') do: [ :each |
		aStream
			nextPutAll: '--sl-color-primary-';
			nextPutAll: each;
			nextPutAll: ': var(--sl-color-', base, '-';
			nextPutAll: each;
			nextPutAll: ');';
			yourself ].

]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> colorThemeName [

	^ self layoutSettingsView colorThemeName
]

{ #category : 'layout' }
SlmdResponsiveLayoutView >> debounceResizeEvent: anEvent [

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

{ #category : 'toolbar' }
SlmdResponsiveLayoutView >> dockedToolbarOff [

	self showDockedToolbar: false.
	self showDockedToolbarAdapt: false.

]

{ #category : 'toolbar' }
SlmdResponsiveLayoutView >> dockedToolbarOn [

	self activeToolbarDocked ifFalse: [
		^ self ].

	self showDockedToolbar: true.
	self showDockedToolbarAdapt: true.

]

{ #category : 'toolbar' }
SlmdResponsiveLayoutView >> floatingToolbarOff [

	self showFloatingToolbar: false.
	self showFloatingToolbarAdapt: false.

]

{ #category : 'toolbar' }
SlmdResponsiveLayoutView >> floatingToolbarOn [

	self activeToolbarFloating ifFalse: [
		^ self ].

	self showFloatingToolbar: true.
	self showFloatingToolbarAdapt: true.

]

{ #category : 'typography' }
SlmdResponsiveLayoutView >> fontFamilyAdapt: aFontFamily [
	| element |

	aFontFamily ifNil: [ ^ self ].
	"aFontFamily = self fontFamily ifTrue: [ ^ self ]."

	element := self bodyFind.
	element ifNil: [ ^ self ].

	element styleAt: 'font-family' put: aFontFamily

]

{ #category : 'layout' }
SlmdResponsiveLayoutView >> handleResizeEvent: anEvent [
	| newWidth |

	debounceTransition := nil.

	anEvent detail valuesDo: [ :eachDetail |
		eachDetail do: [ :eachEntry |
			| rect |
			rect := eachEntry apply: 'contentRect'.
			newWidth := rect apply: 'width'
			"Don't bother with height. It seems to report 0. Probably no browser support"
			"height := rect apply: 'height'." ] ].

	layoutWidthCached = newWidth ifTrue: [
		^ self ].

	layoutWidthCached := newWidth.
	self bodySplitPanelAdapt.
	self useAutoLayout not ifTrue: [
		^ self ].

	self layoutAdaptToWidth
]

{ #category : 'initialization' }
SlmdResponsiveLayoutView >> initialize [

	super initialize.

	layoutWidthCached := 0.
	activeToolbarDocked := false.
	activeToolbarFloating := false.
	activeFab := false.

]

{ #category : 'layout' }
SlmdResponsiveLayoutView >> layoutAdaptToWidth [

	layoutWidthCached < 600 ifTrue: [
		^ self layoutTypeAdapt: self class layoutTypeCompact ].

	layoutWidthCached < 840 ifTrue: [
		^ self layoutTypeAdapt: self class layoutTypeMedium ].

	layoutWidthCached < 1200 ifTrue: [
		^ self layoutTypeAdapt: self class layoutTypeExpanded ].

	layoutWidthCached < 1600 ifTrue: [
		^ self layoutTypeAdapt: self class layoutTypeLarge ].

	self layoutTypeAdapt: self class layoutTypeExtraLarge.

]

{ #category : 'initialization' }
SlmdResponsiveLayoutView >> layoutInitialSetUp: props [
	"Invoked by presenter's viewCreated"

	self logTrace5: props printString method: 'layoutInitialSetUp:'.
	self resizeSetUp.

	self colorThemeAdapt: (props at: #colorThemeName ifAbsent: []).
	self fontFamilyAdapt: (props at: #fontFamily ifAbsent: []).

	(props at: #useAutoLayout ifAbsent: [ true ]) ifTrue: [
		self layoutAdaptToWidth.
		^ self ].

	self applyLayoutProfile: props.

]

{ #category : 'layout' }
SlmdResponsiveLayoutView >> layoutProfileCompact [

	^ {
		#navRailExpanded -> false.
		#showNavMenuButton -> false.
		#useModalNav -> true.
		#showNavBar -> true.
		#useTwoPaneBody -> false.
		#showSidesheet -> false.
		#showAppBar -> true.
		#showDockedToolbar -> false.
		#showFloatingToolba -> false
	} asDictionary

]

{ #category : 'layout' }
SlmdResponsiveLayoutView >> layoutProfileExpanded [

	^ {
		#navRailExpanded -> false.
		#showNavMenuButton -> true.
		#useModalNav -> true.
		#showNavBar -> false.
		#useTwoPaneBody -> true.
		#showSidesheet -> false.
		#showAppBar -> true.
		#showDockedToolbar -> false.
		#showFloatingToolba -> false
	} asDictionary

]

{ #category : 'layout' }
SlmdResponsiveLayoutView >> layoutProfileExtraLarge [

	^ {
		#navRailExpanded -> true.
		#showNavMenuButton -> false.
		#useModalNav -> false.
		#showNavBar -> false.
		#useTwoPaneBody -> true.
		#showSidesheet -> true.
		#showAppBar -> true.
		#showDockedToolbar -> false.
		#showFloatingToolba -> false
	} asDictionary

]

{ #category : 'layout' }
SlmdResponsiveLayoutView >> layoutProfileLarge [

	^ {
		#navRailExpanded -> false.
		#showNavMenuButton -> false.
		#useModalNav -> false.
		#showNavBar -> false.
		#useTwoPaneBody -> true.
		#showSidesheet -> false.
		#showAppBar -> true.
		#showDockedToolbar -> false.
		#showFloatingToolba -> false
	} asDictionary

]

{ #category : 'layout' }
SlmdResponsiveLayoutView >> layoutProfileMedium [

	^ {
		#navRailExpanded -> true.
		#showNavMenuButton -> false.
		#useModalNav -> true.
		#showNavBar -> true.
		#useTwoPaneBody -> true.
		#showSidesheet -> false.
		#showAppBar -> true.
		#showDockedToolbar -> false.
		#showFloatingToolba -> false
	} asDictionary

]

{ #category : 'accessing' }
SlmdResponsiveLayoutView >> layoutSettingsView [

	layoutSettingsView ifNil: [
		layoutSettingsView := SlmdLayoutSettingsView first ]
.
	^ layoutSettingsView
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView >> layoutSettingsView: anObject [

	layoutSettingsView := anObject
]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> layoutType [

	^ self layoutSettingsView layoutType

]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> layoutType: anObject [

	self layoutSettingsView layoutType: anObject
]

{ #category : 'layout' }
SlmdResponsiveLayoutView >> layoutTypeAdapt: aLayoutType [
	| props |

	self logTrace5: aLayoutType printString method: 'layoutTypeAdapt:'.

	aLayoutType = self class layoutTypeCompact ifTrue: [
		props := self layoutProfileCompact ].
	aLayoutType = self class layoutTypeMedium ifTrue: [
		props := self layoutProfileMedium ].
	aLayoutType = self class layoutTypeExpanded ifTrue: [
		props := self layoutProfileExpanded ].
	aLayoutType = self class layoutTypeLarge ifTrue: [
		props := self layoutProfileLarge ].
	aLayoutType = self class layoutTypeExtraLarge ifTrue: [
		props := self layoutProfileExtraLarge ].

	props ifNil: [ ^ self ].
	self layoutType: aLayoutType.
	self setLayoutSettings: props.
	self applyLayoutProfile: props.
	self layoutSettingsView layoutUpdate.

]

{ #category : 'accessing' }
SlmdResponsiveLayoutView >> layoutViewLazy [

	^ self
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView >> layoutWidthCached [

	^ layoutWidthCached
]

{ #category : 'accessing' }
SlmdResponsiveLayoutView >> layoutWidthCached: anObject [

	layoutWidthCached := anObject
]

{ #category : 'actions - toolbar' }
SlmdResponsiveLayoutView >> modalNavOpen [
	| drawer |

	drawer := self modalNavElementOrNil.
	drawer
		ifNil: [ self logError: 'modal nav element is nil' ]
		ifNotNil: [ drawer show ]
]

{ #category : 'actions - toolbar' }
SlmdResponsiveLayoutView >> modalSettingsOpen [

	self logTrace: 'modalSettingsOpen'.
	self modalSettingsElement beOpen

]

{ #category : 'navbar' }
SlmdResponsiveLayoutView >> navBarDisplay: aBoolean [

	self shadowElementId: 'smdNavBar' display: aBoolean

]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> navRailExpanded [

	^ self layoutSettingsView navRailExpanded
]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> navRailExpanded: anObject [

	self layoutSettingsView navRailExpanded: anObject
]

{ #category : 'navrail' }
SlmdResponsiveLayoutView >> navRailExpandedAdapt: aBoolean [
	| modalElement navComponent |

	self logTrace5: aBoolean printString method: 'navRailExpandedAdapt:'.

	"Set type in nav view"
	navComponent := SlmdNavRailView first.
	navComponent ifNotNil: [ navComponent navRailExpanded: aBoolean ].

	self navRegionFind
		styleAt: 'flex'
		put: '0 0 ', self navRailWidth printString, 'px'.

	modalElement := self modalNavElementOrNil.
	modalElement ifNotNil: [
		modalElement customPropertyAt: 'size' put: self navRailWidth printString, 'px'.
		"SlmdNavRailView first navSetUp" ].

	self bodySplitPanelAdapt.

]

{ #category : 'navrail' }
SlmdResponsiveLayoutView >> navRailWidth [

	^ SlmdNavRailView first navRailWidth
]

{ #category : 'navrail' }
SlmdResponsiveLayoutView >> navRegionDisplay: aBoolean [
	| element |

	element := self navRegionFind.
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]

{ #category : 'navrail' }
SlmdResponsiveLayoutView >> navRegionFind [

	"^ CpHtmlElement documentBody firstDescendantMatching: '#smdNavRegion'"
	^ self shadowedElementWithId: 'smdNavRegion'
]

{ #category : 'body' }
SlmdResponsiveLayoutView >> pane1WidthCompute [
	| w |

	w := (self layoutWidthCached / 2) asInteger.
	self useModalNav ifFalse: [  w := w - self navRailWidth ].
	w < self pane1WidthMin ifTrue: [ w := self pane1WidthMin ].
	^ w
]

{ #category : 'body' }
SlmdResponsiveLayoutView >> pane1WidthMin [

	^ 300
]

{ #category : 'accessing - components' }
SlmdResponsiveLayoutView >> pane2View [
	| paneLayoutView pane2SlotName |

	paneLayoutView := self paneLayoutView.
	paneLayoutView ifNil: [ ^ self ].
	pane2SlotName := paneLayoutView isUsingSinglePaneLayout
		ifTrue: [ 'singlePaneLayoutP2' ]
		ifFalse: [ 'twoPaneLayoutP2' ].
	^ paneLayoutView firstChildAtSlotNamed: pane2SlotName
]

{ #category : 'accessing - components' }
SlmdResponsiveLayoutView >> paneLayoutView [

	^ self firstChildAtSlotNamed: 'paneLayout'
]

{ #category : 'actions - nav' }
SlmdResponsiveLayoutView >> primaryPaneOnly [

	self paneLayoutView primaryPaneOnly
]

{ #category : 'layout' }
SlmdResponsiveLayoutView >> resizeSetUp [

	| target div resize |
	target := self shadowedElementWithId: 'container'.
	div := target firstChild.
	resize := SlResizeObserver new.
	resize when: SlResizeEvent send: #debounceResizeEvent: to: self.
	target replaceChild: div with: resize.
	resize appendChild: div
]

{ #category : 'body' }
SlmdResponsiveLayoutView >> secondaryPaneOnly [
	| component |

	self logTrace5Method: 'secondaryPaneOnly'.

	component := self paneLayoutView.
	component ifNil: [
		^ self logError: 'Pane lyout not found' ].
	component secondaryPaneOnly.

]

{ #category : 'layout' }
SlmdResponsiveLayoutView >> setLayoutSettings: props [

	self navRailExpanded: (props at: #navRailExpanded ifAbsent: [ false ]).
	self showNavMenuButton: (props at: #showNavMenuButton ifAbsent: [ false ]).
	self useModalNav: (props at: #useModalNav ifAbsent: [ false ]).
	self showNavBar: (props at: #showNavBar ifAbsent: [ false ]).
	self useTwoPaneBody: (props at: #useTwoPaneBody ifAbsent: [ false ]).
	self showSidesheet: (props at: #showSidesheet ifAbsent: [ false ]).
	self showAppBar: (props at: #showAppBar ifAbsent: [ false ]).
	self showDockedToolbar: (props at: #showDockedToolbar ifAbsent: [ false ]).
	self showFloatingToolbar: (props at: #showFloatingToolbar ifAbsent: [ false ]).

]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> showAppBar [

	^ self layoutSettingsView showAppBar
]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> showAppBar: anObject [

	self layoutSettingsView showAppBar: anObject
]

{ #category : 'toolbar' }
SlmdResponsiveLayoutView >> showAppBarAdapt: aBoolean [

	self logTrace5: aBoolean printString method: 'showAppBarAdapt:'.

	self appBarDisplay: aBoolean.

]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> showDockedToolbar [

	^ self layoutSettingsView showDockedToolbar
]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> showDockedToolbar: anObject [

	self layoutSettingsView showDockedToolbar: anObject
]

{ #category : 'toolbar' }
SlmdResponsiveLayoutView >> showDockedToolbarAdapt: aBoolean [

	self logTrace5: aBoolean printString method: 'showDockedToolbarAdapt:'.

	self toolbarDockedDisplay: aBoolean.

]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> showFloatingToolbar [

	^ self layoutSettingsView showFloatingToolbar
]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> showFloatingToolbar: anObject [

	self layoutSettingsView showFloatingToolbar: anObject
]

{ #category : 'toolbar' }
SlmdResponsiveLayoutView >> showFloatingToolbarAdapt: aBoolean [

	self logTrace5: aBoolean printString method: 'showFloatingToolbarAdapt:'.

	self toolbarFloatingDisplay: aBoolean.

]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> showNavBar [

	^ self layoutSettingsView showNavBar
]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> showNavBar: anObject [

	self layoutSettingsView showNavBar: anObject
]

{ #category : 'navbar' }
SlmdResponsiveLayoutView >> showNavBarAdapt: aBoolean [
	| fabView |

	self logTrace5: aBoolean printString method: 'showNavBarAdapt:'.

	self navBarDisplay: aBoolean.

	fabView := SlmdFabView first.
	fabView ifNotNil: [ fabView setExtraOffset: aBoolean ].

]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> showNavMenuButton: anObject [

	self layoutSettingsView showNavMenuButton: anObject
]

{ #category : 'body' }
SlmdResponsiveLayoutView >> showNavMenuButtonAdapt: aBoolean [

	self appBarLeadingButtonDisplay: aBoolean.

]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> showSidesheet [

	^ self layoutSettingsView showSidesheet
]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> showSidesheet: anObject [

	self layoutSettingsView showSidesheet: anObject
]

{ #category : 'sidesheet' }
SlmdResponsiveLayoutView >> showSidesheetAdapt: aBoolean [

	self logTrace5: aBoolean printString method: 'showSidesheetAdapt:'.

	self sidesheetDisplay: aBoolean.

]

{ #category : 'sidesheet' }
SlmdResponsiveLayoutView >> sidesheetDisplay: aBoolean [

	self shadowElementId: 'smdSidesheet' show: aBoolean

]

{ #category : 'initialization' }
SlmdResponsiveLayoutView >> themeUpdate [

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
SlmdResponsiveLayoutView >> toolbarDockedDisplay: aBoolean [

	self shadowElementId: 'smdDockedToolbar' show: aBoolean

]

{ #category : 'toolbar' }
SlmdResponsiveLayoutView >> toolbarFloatingDisplay: aBoolean [
	| element |

	"The floating toolbar CSS uses fixed position,
	so the toolbar div itself must apply smd-hidden"
	element := self firstChildAtSlotNamed: 'floatingToolbar'.
	element ifNil: [ ^ self ].
	element := element shadowedFirstDescendantMatching: '#container'.
	self element: element show: aBoolean.

]

{ #category : 'events' }
SlmdResponsiveLayoutView >> triggerUserEvent: aUserEventSpec [
	| type subtype |

	self logTrace: aUserEventSpec printString method: 'triggerUserEvent:'.

	type := aUserEventSpec at: #type.
	subtype := aUserEventSpec at: #subtype.

	type = #nav ifTrue: [
		subtype = #modalNav ifTrue: [
			^ self modalNavOpen ].
		subtype = #settingsOpen ifTrue: [
			^ self modalSettingsOpen ].
		^ self announceNavSubtype: subtype navTo: (aUserEventSpec at: #data ifAbsent: []) ].

	subtype = 'save' ifTrue: [ | changes paneContentView |
		paneContentView := self layoutViewLazy pane2View paneContentView.
		paneContentView ifNil: [ ^ self ].
		changes := paneContentView wrappedView changeMap.
		self announceActionSubtype: subtype key: #changes value: changes.
		^ self ].

	self announceActionSubtype: subtype.

]

{ #category : 'initialization' }
SlmdResponsiveLayoutView >> updateGlobalStyle [

	self logTrace5: 'colorThemeName = ', self colorThemeName printString method: 'updateGlobalStyle'.
	CpHtmlElement documentAddStyle: self themeUpdate.

]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> useAutoLayout [

	^ self layoutSettingsView useAutoLayout
]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> useAutoLayout: anObject [

	self layoutSettingsView useAutoLayout: anObject
]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> useModalNav [

	^ self layoutSettingsView useModalNav
]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> useModalNav: anObject [

	self layoutSettingsView useModalNav: anObject
]

{ #category : 'navrail' }
SlmdResponsiveLayoutView >> useModalNavAdapt: aBoolean [

	self logTrace5: aBoolean printString method: 'useModalNavAdapt:'.

	self navRegionDisplay: aBoolean not.
	self bodySplitPanelAdapt.

]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> useTwoPaneBody [

	^ self layoutSettingsView useTwoPaneBody
]

{ #category : 'accessing - settings' }
SlmdResponsiveLayoutView >> useTwoPaneBody: anObject [

	self layoutSettingsView useTwoPaneBody: anObject
]

{ #category : 'body' }
SlmdResponsiveLayoutView >> useTwoPaneBodyAdapt: aBoolean [
	| component |

	self logTrace5: aBoolean printString method: 'useTwoPaneBodyAdapt:'.

	component := SlmdPaneLayoutView first.
	component ifNotNil: [
		aBoolean
			ifTrue: [ component useTwoPaneLayout ]
			ifFalse: [ component useSinglePaneLayout ] ].

]
