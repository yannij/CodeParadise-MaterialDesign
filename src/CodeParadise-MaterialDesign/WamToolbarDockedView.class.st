Class {
	#name : 'WamToolbarDockedView',
	#superclass : 'WamToolbarView',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'web resources' }
WamToolbarDockedView class >> globalStyle [
	<webResource: #css>

	^ '
.smd-toolbar-docked-buttons {
  display: flex;
  flex-flow: row wrap;
  gap: 32px;
  padding: 0 8px;
  height: 64px;
  background: var(--wa-color-brand-fill-normal);
}

.smd-toolbar-docked-fab {
  margin-left: auto;
  padding: 8px;
  height: 48px;
  width: 48px;
  border-radius: 16px;
  background: var(--wa-color-brand-fill-normal);
}
'
]

{ #category : 'web resources' }
WamToolbarDockedView class >> style [

	<webResource: #css>

	^ '
.smd-toolbar {
  z-index: 10;
  display: flex;
  flex-flow: row wrap;
  padding: 0 16px;
  height: 64px;
  background: var(--wa-color-brand-fill-normal);
}
'
]

{ #category : 'web resources' }
WamToolbarDockedView class >> template [

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
WamToolbarDockedView >> buttonCssClass [

	^ 'smd-toolbar-docked-buttons'
]

{ #category : 'nav' }
WamToolbarDockedView >> fabCssClass [

	^ 'smd-toolbar-docked-fab'
]
