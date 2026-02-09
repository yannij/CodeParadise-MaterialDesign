Class {
	#name : 'SlmdNavRailModalView',
	#superclass : 'SlmdNavAbstractView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'class initialization' }
SlmdNavRailModalView class >> beLoaded [

	WaDrawer beLoaded
]

{ #category : 'web resources' }
SlmdNavRailModalView class >> template [
	<webResource: #html>

	^ '
<wa-drawer>
  <slot></slot>
</wa-drawer>
'
]

{ #category : 'accessing' }
SlmdNavRailModalView >> drawer [

	^ self shadowedFirstDescendantMatching: WaDrawer asCssSelector
]

{ #category : 'rendering' }
SlmdNavRailModalView >> renderNavContent: buttons [
	| nav |

	nav := #nav asHtmlTag addClass: 'smd-navrailx'; yourself.
	buttons do: [ :each | | element |
		element := self divExpanded: each.
		element when: CpClickEvent basicPrimary do: [ self triggerNavEvent: each ] for: self.
		nav appendChild: element ].

	self drawer
		makeEmpty;
		addClass: 'navrailx';
		placementBeStart;
		withoutHeaderBeOn;
		customPropertyAt: 'size' put: '220px';
		"customPropertyAt: 'size' put: self layoutViewLazy navRailWidth printString, 'px';"
		customPropertyAt: 'body-spacing' put: '0';
		customPropertyAt: 'header-spacing' put: '0';
		customPropertyAt: 'footer-spacing' put: '0';
		appendChild: nav

]
