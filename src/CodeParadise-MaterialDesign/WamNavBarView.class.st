Class {
	#name : 'WamNavBarView',
	#superclass : 'WamNavElementView',
	#category : 'CodeParadise-MaterialDesign-NavElement',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavElement'
}

{ #category : 'web resources' }
WamNavBarView class >> globalStyle [
	<webResource: #css>

	^ '
.wam-navbar-font {
  line-height: var(--wa-line-height-normal);
  font-size: var(--wa-font-size-small);
  font-weight: var(--wa-font-weight-normal);
}

.wam-navbar-item {
  flex-basis: max-content;
  display: flex;
  padding: 0 4px;
  border-radius: 20px;
  height: 40px;
  background: var(--wa-color-brand-fill-normal);
}

.wam-navbar-icon {
  padding-top: 0;
  padding-left: 4px;
  font-size: 24px;
}

.wam-navbar-labelText {
  padding-top: 8px;
  padding-left: 4px;
  padding-right: 16px;
}
'
]

{ #category : 'web resources' }
WamNavBarView class >> style [

	<webResource: #css>

	^ '
.wam-navBar {
  z-index: 10;
  display: flex;
  justify-content: space-between;
  flex-flow: row nowrap;
  padding: 12px 4px;
  background: var(--wa-color-brand-fill-normal);
}

.wam-navbar-dropdown {
  height: 40px;
  font-size: 24px;
}
'
]

{ #category : 'web resources' }
WamNavBarView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="wam-navBar">
  <slot></slot>
  <wa-dropdown>
    <div slot="trigger" class="wam-navbar-dropdown">
      <wa-icon name="ellipsis-vertical"></wa-icon>
    </div>
    <slot name="overflow"></slot>
  </wa-dropdown>
</div>
'
]

{ #category : 'rendering' }
WamNavBarView >> dropdownDisplay: aBoolean [

	self element: self dropdownElement display: aBoolean
]

{ #category : 'rendering' }
WamNavBarView >> dropdownElement [

	^ self shadowRoot firstDescendantMatching: WaDropdown asCssSelector
]
