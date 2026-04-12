Class {
	#name : 'WamNavRailView',
	#superclass : 'WamNavElementView',
	#category : 'CodeParadise-MaterialDesign-NavElement',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavElement'
}

{ #category : 'web resources' }
WamNavRailView class >> style [
	<webResource: #css>

	^ '
.navrail {
  height: 100%;
  background: var(--wa-color-brand-fill-quiet);
  border-right: 1px solid var(--wa-color-neutral-70);
}
'
]

{ #category : 'web resources' }
WamNavRailView class >> template [
	<webResource: #html>

	^ WaElement linkUtilitiesCss, '
<div id="container" class="navrail wa-split:column wa-gap-0 wa-cloak">
<nav class="wa-stack wa-gap-0">
  <slot></slot>
</nav>
<nav class="wa-stack wa-gap-0">
  <slot name="bottom"></slot>
</nav>
</div>
'
]

{ #category : 'rendering' }
WamNavRailView >> renderBottom: aString [
	| div |

	div := #div asHtmlElement
		styleAt: 'max-width' put: '96px';
		styleAt: 'overflow-wrap' put: 'anywhere';
		styleAt: 'font-size' put: 'var(--wa-font-size-s)';
		textContent: aString.

	self replaceAllChildrenWith: div atSlotNamed: #bottom
]
