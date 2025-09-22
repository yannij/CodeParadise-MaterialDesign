Class {
	#name : 'SlmdNavRailView',
	#superclass : 'SlmdNavView',
	#instVars : [
		'drawer'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'class initialization' }
SlmdNavRailView class >> beLoaded [

	SlDrawer beLoaded
]

{ #category : 'web resources' }
SlmdNavRailView class >> globalStyle [
	<webResource: #css>

	^ '
.smd-navRegion {
  flex: 0 0 96px;
  height: 100%;
  padding: 0;
  margin: 0;
}
'
, self styleNav

]

{ #category : 'web resources' }
SlmdNavRailView class >> styleNav [
	"These style definitions should be added to the layout component style
	to be visible the modal nav content.
	They must also be included in the navrail component style."

	<webResource: #css>

	^ '
.smd-nav-font {
  line-height: var(--sl-line-height-normal);
  font-size: var(--sl-font-size-medium);
  font-weight: var(--sl-font-weight-bold);
}

.smd-navrail {
  height: 100%;
  overflow-y: auto;
  padding: 0;
  margin: 0;
  background: var(--sl-color-primary-100);
}

.smd-navrail-item {
  display: flex;
  flex-flow: column;
  height: 56px;
  width: 96px;
  padding-top: 12px;
}

.smd-navrail-icon {
  font-size: 24px;
  padding-left: 28px;
}

.smd-navrail-labelText {
  padding: 0;
  line-height: 16px;
  font-size: var(--sl-font-size-x-small);
  align-items: center;
  text-align: center;
  overflow-x: clip;
}

.smd-navrailx {
  height: 100%;
  padding-left: 20px;
  margin: 0;
  background: var(--sl-color-primary-100);
  flow-direction: row;
}

.smd-navrailx::part(panel) {
  background: var(--sl-color-primary-100);
}

.smd-navrailx-item {
  display: flex;
  border-radius: 28px;
  height: 56px;
  width: 220px;
  background: var(--sl-color-primary-100);
  align-items: center;
}

.smd-navrailx-icon {
  padding-left: 8px;
  font-size: 24px;
}

.smd-navrailx-labelText {
  padding-left: 16px;
  font-size: 16px;
}
'
]

{ #category : 'web resources' }
SlmdNavRailView class >> template [
	<webResource: #html>

	^ '
<nav id="container">
  <slot name="content"></slot>
</nav>
'
]

{ #category : 'nav' }
SlmdNavRailView >> navContent: items [

	^ self navRailExpanded
		ifTrue: [ self navrailExpandedBuild: items ]
		ifFalse: [ self navrailNarrowBuild: items ]
]

{ #category : 'nav' }
SlmdNavRailView >> navrailExpandedBuild: list [
	| element |

	element := #div asHtmlTag
		addClass: 'smd-navrailx';
		yourself.

	list do: [ :eachItem | | navItem |
		navItem := self navrailExpandedBuildItem: eachItem.
		element appendChild: navItem ].

	^ #nav asHtmlTag
		styleAt: 'height' put: '100%';
		"styleAt: 'overflow-y' put: 'auto';"
		appendChild: element;
		yourself
]

{ #category : 'nav' }
SlmdNavRailView >> navrailExpandedBuildItem: aNavAction [
	| iconName |

	iconName := aNavAction at: #iconName.

	^ #div asHtmlTag
		addClass: 'smd-navrailx-item';
		addClass: 'smd-nav-font';
		when: CpClickEvent basicPrimary do: [ self layoutViewLazy triggerUserEvent: aNavAction ] for: self;
		when: CpClickEvent basicPrimary send: #hide to: drawer;
		appendChild: ((SlIconButton named: iconName) addClass: 'smd-navrailx-icon'; yourself);
		appendChild: (#div asHtmlTag
			addClass: 'smd-navrailx-labelText';
			textContent: (aNavAction at: #iconLabel);
			yourself);
		yourself
]

{ #category : 'nav' }
SlmdNavRailView >> navrailNarrowBuild: list [
	| element |

	element := #div asHtmlTag addClass: 'smd-navrail'; yourself.
	list do: [ :eachItem | | navItem |
		navItem := self navrailNarrowBuildItem: eachItem.
		element appendChild: navItem ].

	^ #nav asHtmlTag
		styleAt: 'height' put: '100%';
		appendChild: element;
		yourself
]

{ #category : 'nav' }
SlmdNavRailView >> navrailNarrowBuildItem: aNavAction [
	| iconName |

	iconName := aNavAction at: #iconName.

	(aNavAction at: #data) = #menu ifTrue: [
		^ self renderMenu: aNavAction ].

	^ #div asHtmlTag
		addClass: 'smd-navrail-item';
		when: CpClickEvent basicPrimary do: [ self layoutViewLazy triggerUserEvent: aNavAction ] for: self;
		when: CpClickEvent basicPrimary send: #hide to: drawer;
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-icon';
				appendChild: (SlIconButton named: iconName);
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-labelText';
				textContent: (aNavAction at: #iconLabel);
				yourself);
		yourself
]

{ #category : 'nav' }
SlmdNavRailView >> renderMenu: aNavAction [

	^ self dropdownMenu: (Array with: aNavAction) css: nil.

]
