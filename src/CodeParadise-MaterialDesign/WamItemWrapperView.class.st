Class {
	#name : 'WamItemWrapperView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'web resources' }
WamItemWrapperView class >> globalStyle [

	<webResource: #css>

	^ '
:root,
:host,
.wa-theme-light {
  --wa-focus-ring-style: solid;
  --wa-focus-ring-width: 1px;
  /*--wa-color-focus: red;*/
}

.wam-fields {
  display: flex;
  flex-direction: column;
  gap: 16px;
  background: var(--wa-color-brand-fill-light);
}
'
, self globalStyleInput
, self globalStyleTextarea
, self globalStyleSwitch
]

{ #category : 'web resources' }
WamItemWrapperView class >> globalStyleInput [

	<webResource: #css>

	^ '
.wam-input::part(input):disabled, .wam-textarea::part(textarea):disabled {
  /*--wa-input-color: #000000;*/
  --wa-input-color: red;
}

.wam-input::part(input) {
  border-style: none;
  position: relative;
  width: 100%;
  background: var(--wa-color-brand-fill-light);
  height: 48px;
  padding: 0;
  padding-top: 12px;
}

.wam-input::part(label) {
  height: 16px;
  font-size: 12px;
  margin-bottom: -16px;
  padding: 4px 16px 0 16px;
  z-index: 10;
  background-color: rgb(0 0 0 / 0);
}

.wam-input::part(base) {
  border-style: none;
  height: 48px;
  width: 100%;
  font-size: 16px;
  background: var(--wa-color-brand-fill-normal);
}

.wam-input::part(hint) {
  height: 16px;
  width: calc(100% - 32px);
  font-size: 12px;
  padding: 0 16px;
  background: var(--wa-color-brand-fill-light);
}
'
]

{ #category : 'web resources' }
WamItemWrapperView class >> globalStyleSwitch [

	<webResource: #css>

	^ '
.wam-switch::part(base) {
  padding-top: 8px;
  padding-left: 16px;
}

.wam-switch::part(hint) {
  height: 16px;
  width: 100%;
  font-size: 12px;
  padding: 4px 16px 0 16px;
  background: var(--wa-color-brand-fill-light);
}
'
]

{ #category : 'web resources' }
WamItemWrapperView class >> globalStyleTextarea [

	<webResource: #css>

	^ '
.wam-textarea::part(base) {
  border-style: none;
  width: 100%;
  padding: 0;
  background: var(--wa-color-brand-fill-normal);
  margin-top: 16px;
}

.wam-textarea::part(label) {
  height: 16px;
  font-size: 12px;
  padding: 4px 16px 0 16px;
  margin-bottom: -16px;
  z-index: 10;
  background-color: rgb(0 0 0 / 0);
}

.wam-textarea::part(textarea) {
  border-style: none;
  width: 100%;
  font-size: 16px;
  background: var(--wa-color-brand-fill-normal);
}

.wam-textarea::part(hint) {
  height: 16px;
  width: calc(100% - 32px);
  font-size: 12px;
  padding: 0 16px;
  background: var(--wa-color-brand-fill-light);
}
'
]

{ #category : 'web resources' }
WamItemWrapperView class >> style [

	<webResource: #css>

	^ '
.wam-container {
  box-sizing: border-box;
  padding: var(--wam-space);
}

.wam-item {
  min-width: 300px;
  width: 100%;
}
'
]

{ #category : 'web resources' }
WamItemWrapperView class >> template [

	<webResource: #html>

	^ WaElement linkUtilitiesCss, '
<div id="container" class="wam-container">
  <div class="wam-item">
    <slot name="header"></slot>
    <slot name="wrapped"></slot>
    <slot name="footer"></slot>
  </div>
</div>'
]

{ #category : 'rendering' }
WamItemWrapperView >> changeMap [

	^ self wrappedView first changeMap
]

{ #category : 'finding' }
WamItemWrapperView >> setEditable: aBoolean [

	self systemLog logTrace: 'setEditable: ', aBoolean printString.

	(self childrenAtSlotNamed: #wrapped) do: [ :each |
		each setEditable: aBoolean ]

]

{ #category : 'finding' }
WamItemWrapperView >> wrappedView [

	^ self childrenAtSlotNamed: #wrapped
]
