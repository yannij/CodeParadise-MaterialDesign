Class {
	#name : 'WamNavRailModalView',
	#superclass : 'WamNavElementView',
	#category : 'CodeParadise-MaterialDesign-NavElement',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavElement'
}

{ #category : 'class initialization' }
WamNavRailModalView class >> beLoaded [

	WaDrawer beLoaded
]

{ #category : 'web resources' }
WamNavRailModalView class >> style [

	<webResource: #css>

	^ '
.wam-navrailx {
  background: var(--wa-color-brand-fill-quiet);
  border-right: 1px solid var(--wa-color-neutral-70);
}

.navrailx::part(body) {
  height: 100%;
  padding: 8px 0;
  background: var(--wa-color-brand-fill-normal);
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
WamNavRailModalView class >> template [
	<webResource: #html>

	^ WaElement linkUtilitiesCss, '
<wa-drawer>
<div class="wa-split:column wa-gap-0 wa-cloak" style="height: 100%">
<nav class="wa-stack wa-gap-0">
  <slot></slot>
</nav>
<nav class="wa-stack wa-gap-0">
  <slot name="bottom"></slot>
</nav>
</div>
</wa-drawer>
'
]

{ #category : 'accessing' }
WamNavRailModalView >> drawer [

	^ self shadowedFirstDescendantMatching: WaDrawer asCssSelector
]

{ #category : 'rendering' }
WamNavRailModalView >> drawerSetup [

	self drawer
		"makeEmpty;"
		addClass: 'navrailx';
		placementBeStart;
		withoutHeaderBeOn;
		customPropertyAt: 'size' put: '220px';
		"customPropertyAt: 'size' put: self layoutViewLazy navRailWidth printString, 'px';"
		customPropertyAt: 'body-spacing' put: '0';
		customPropertyAt: 'header-spacing' put: '0';
		customPropertyAt: 'footer-spacing' put: '0';
		yourself

]

{ #category : 'rendering' }
WamNavRailModalView >> renderBottom: aString [
	| div |

	div := #div asHtmlElement
		styleAt: 'max-width' put: '220px';
		styleAt: 'overflow-wrap' put: 'anywhere';
		styleAt: 'font-size' put: 'var(--wa-font-size-s)';
		textContent: aString.

	self replaceAllChildrenWith: div atSlotNamed: #bottom
]
