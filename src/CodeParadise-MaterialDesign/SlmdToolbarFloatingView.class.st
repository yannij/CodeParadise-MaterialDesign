Class {
	#name : 'SlmdToolbarFloatingView',
	#superclass : 'SlmdToolbarView',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'web resources' }
SlmdToolbarFloatingView class >> globalStyle [

	<webResource: #css>

	^ '
.smd-toolbar-floating-buttons {
  display: flex;
  flex-flow: row nowrap;
  gap: 4px;
  padding: 0 8px;
  border-radius: 32px;
  height: 64px;
  background: var(--sl-color-primary-300);
}

.smd-toolbar-floating-fab {
  margin-left: 8px;
  padding: 8px;
  height: 48px;
  width: 48px;
  border-radius: 16px;
  background: var(--sl-color-primary-400);
}
'
]

{ #category : 'web resources' }
SlmdToolbarFloatingView class >> style [

	<webResource: #css>

	^ '
.smd-hidden {
  position: absolute !important;
  top: -9999px !important;
  left: -9999px !important;
}

.smd-toolbar {
  z-index: 10;
  display: flex;
  flex-flow: row nowrap;

  position: fixed;
  left: 50%; transform: translate(-50%, 0);
  bottom: 16px;
}
'
]

{ #category : 'web resources' }
SlmdToolbarFloatingView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-toolbar">
  <slot name="toolbar"></slot>
  <slot name="fab"></slot>
</div>
'
]

{ #category : 'nav' }
SlmdToolbarFloatingView >> buttonCssClass [

	^ 'smd-toolbar-floating-buttons'
]

{ #category : 'nav' }
SlmdToolbarFloatingView >> fabCssClass [

	^ 'smd-toolbar-floating-fab'
]
