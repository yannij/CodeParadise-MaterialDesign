Class {
	#name : 'SlmdToolbarDockedView',
	#superclass : 'SlmdToolbarView',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'web resources' }
SlmdToolbarDockedView class >> globalStyle [
	<webResource: #css>

	^ '
.smd-toolbar-docked-buttons {
  display: flex;
  flex-flow: row wrap;
  gap: 32px;
  padding: 0 8px;
  height: 64px;
  background: var(--sl-color-primary-300);
}

.smd-toolbar-docked-fab {
  margin-left: auto;
  padding: 8px;
  height: 48px;
  width: 48px;
  border-radius: 16px;
  background: var(--sl-color-primary-400);
}
'
]

{ #category : 'web resources' }
SlmdToolbarDockedView class >> style [

	<webResource: #css>

	^ '
.smd-toolbar {
  z-index: 10;
  display: flex;
  flex-flow: row wrap;
  padding: 0 16px;
  height: 64px;
  background: var(--sl-color-primary-300);
}
'
]

{ #category : 'web resources' }
SlmdToolbarDockedView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div class="smd-toolbar">
    <slot name="toolbar"></slot>
    <slot name="fab"></slot>
  </div>
</div>
'
]

{ #category : 'nav' }
SlmdToolbarDockedView >> buttonCssClass [

	^ 'smd-toolbar-docked-buttons'
]

{ #category : 'nav' }
SlmdToolbarDockedView >> fabCssClass [

	^ 'smd-toolbar-docked-fab'
]
