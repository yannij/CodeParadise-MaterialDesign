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
  height: 100%;
  flow-direction: row;
}

.navrailx::part(body) {
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

	^ '
<wa-drawer>
  <slot></slot>
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
