Class {
	#name : 'SlmdNavRailView',
	#superclass : 'SlmdNavView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'class initialization' }
SlmdNavRailView class >> beLoaded [

	SlDrawer beLoaded
]

{ #category : 'web resources' }
SlmdNavRailView class >> style [
	<webResource: #css>

	^ '.navrail {
  height: 100%;
  overflow-y: auto;
  padding: 0;
  margin: 0;
  background: var(--sl-color-primary-100);
}

.navrail::part(panel) {
  background: var(--sl-color-primary-100);
}'
]

{ #category : 'web resources' }
SlmdNavRailView class >> template [
	<webResource: #html>

	^ '
<nav id="container" class="navrail">
  <slot name="content"></slot>
</nav>
'
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
