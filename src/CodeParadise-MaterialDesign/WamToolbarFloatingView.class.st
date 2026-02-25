Class {
	#name : 'WamToolbarFloatingView',
	#superclass : 'WamToolbarView',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'web resources' }
WamToolbarFloatingView class >> globalStyle [

	<webResource: #css>

	^ '
.smd-toolbar-floating-buttons {
  display: flex;
  flex-flow: row nowrap;
  gap: 4px;
  padding: 0 8px;
  border-radius: 32px;
  height: 64px;
  background: var(--wa-color-brand-fill-normal);
}

.smd-toolbar-floating-fab {
  margin-left: 8px;
  padding: 8px;
  height: 48px;
  width: 48px;
  border-radius: 16px;
  background: var(--wa-color-brand-fill-normal);
}
'
]

{ #category : 'web resources' }
WamToolbarFloatingView class >> style [

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
WamToolbarFloatingView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-toolbar">
  <slot name="toolbar"></slot>
  <slot name="fab"></slot>
</div>
'
]

{ #category : 'nav' }
WamToolbarFloatingView >> buttonCssClass [

	^ 'smd-toolbar-floating-buttons'
]

{ #category : 'nav' }
WamToolbarFloatingView >> fabCssClass [

	^ 'smd-toolbar-floating-fab'
]

{ #category : 'nav' }
WamToolbarFloatingView >> renderButtons: buttons [
	| element iconButton |

	buttons ifNotEmpty: [
		element := #div asHtmlTag.
		element addClass: self buttonCssClass.
		buttons withIndexDo: [ :eachItem :index |
			"iconButton := self iconButtonForAction: eachItem."
			iconButton := self iconButtonNamed: (eachItem at: #iconName) class: 'smd-toolbar-icon' navAction: eachItem.
			element appendChild: (#div asHtmlTag addClass: 'smd-toolbar-floating-item'; appendChild: iconButton; yourself) ].
		self appendChild: element atSlotNamed: 'toolbar' ].

]
