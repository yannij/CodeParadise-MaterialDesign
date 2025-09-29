Class {
	#name : 'SlmdNavRailModalView',
	#superclass : 'SlmdNavRailView',
	#instVars : [
		'drawer'
	],
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'web resources' }
SlmdNavRailModalView class >> template [
	<webResource: #html>

	^ '<sl-drawer id="smdNavRailModal" class="navrail">
  <slot name="content"></slot>
</sl-drawer>'
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
	"Add modal nav element as sibling of layout's navRegion"

	"self modalDivFind
		appendChild: self navModalPaneBuild"

	drawer ifNotNil: [ 
		^ self ].

	drawer := self findByIdInShadowDom: #smdNavRailModal.
	drawer
		placement: 'left';
		beNoHeader;
		customPropertyAt: 'size' put: self layoutViewLazy navRailWidth printString, 'px';
		customPropertyAt: 'body-spacing' put: '0';
		customPropertyAt: 'header-spacing' put: '0';
		customPropertyAt: 'footer-spacing' put: '0';
		yourself.

]
