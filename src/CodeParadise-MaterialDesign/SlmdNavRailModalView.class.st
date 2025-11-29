Class {
	#name : 'SlmdNavRailModalView',
	#superclass : 'SlmdNavAbstractView',
	#instVars : [
		'drawer'
	],
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

	^ '<slot></slot>'
]

{ #category : 'accessing' }
SlmdNavRailModalView >> drawer [

	^ drawer
]

{ #category : 'accessing' }
SlmdNavRailModalView >> drawer: anObject [

	drawer := anObject
]

{ #category : 'nav' }
SlmdNavRailModalView >> navModalPaneSetUp [

	drawer ifNotNil: [ 
		^ self ].

	drawer := WaDrawer new
		addClass: 'navrailx';
		placementBeStart;
		withoutHeaderBeOn;
		customPropertyAt: 'size' put: self layoutViewLazy navRailWidth printString, 'px';
		customPropertyAt: 'body-spacing' put: '0';
		customPropertyAt: 'header-spacing' put: '0';
		customPropertyAt: 'footer-spacing' put: '0';
		yourself.

	self modalDivFind
		appendChild: drawer

]

{ #category : 'rendering' }
SlmdNavRailModalView >> renderNavContent: buttons [
	| nav |

	drawer makeEmpty.
	drawer customPropertyAt: 'size' put: "self layoutViewLazy navRailWidth printString," '220px'.
	nav := #nav asHtmlTag addClass: 'smd-navrailx'; yourself.
	buttons do: [ :each | | element |
		element := self divExpanded: each.
		element when: CpClickEvent basicPrimary do: [ self triggerNavEvent: each ] for: self.
		nav appendChild: element ].
	drawer appendChild: nav

]
