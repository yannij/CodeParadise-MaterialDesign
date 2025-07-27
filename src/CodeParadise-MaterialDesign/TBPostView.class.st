Class {
	#name : 'TBPostView',
	#superclass : 'SlmdObjectView',
	#category : 'CodeParadise-MaterialDesign-TinyBlogApp',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'TinyBlogApp'
}

{ #category : 'class initialization' }
TBPostView class >> beLoaded [

	SlCard beLoaded
]

{ #category : 'web resources' }
TBPostView class >> globalStyle [

	<webResource: #css>

	^ '
:root,
:host,
.sl-theme-light {
  --sl-focus-ring-style: none;
}

.slmd-input::part(input):disabled, .slmd-textarea::part(textarea):disabled {
  --sl-input-color: #000000;
}

sl-input, sl-textarea {
  box-sizing: content-box;
  --sl-input-filled-background-color-focus: #E6E0E9;
}

sl-input {
  --sl-input-height-medium: 56px;
}

.tblog-post{
  display: flex;
  flex-direction: column;
  gap: 16px;
  padding: 8px;
  background: var(--sl-color-primary-200);
}
'
, self globalStyleInput
, self globalStyleTextarea
, self globalStyleSwitch
]

{ #category : 'web resources' }
TBPostView class >> globalStyleInput [

	<webResource: #css>

	^ '
.slmd-input::part(form-control) {
  position: relative;
  width: 100%;
  padding: 0;
  background: var(--sl-color-neutral-100);
}

.slmd-input::part(form-control) {
  height: 64px;
}

.slmd-input::part(base) {
  padding-top: 4px;
}

.slmd-input::part(form-control-label) {
  position: absolute; top: 0; left: 0;
  height: 16px;
  font-size: 12px;
  padding: 4px 16px 0 16px;
  z-index: 10;
  background-color: rgb(0 0 0 / 0);
}

.slmd-input::part(form-control-input) {
  position: absolute; top: 0; left: 0;
  height: 56px;
  width: 100%;
  font-size: 16px;
  background: var(--sl-color-neutral-100);
}

.slmd-input::part(form-control-help-text) {
  position: absolute; bottom: 0; left: 0;
  height: 16px;
  width: calc(100% - 32px);
  font-size: 12px;
  padding: 4px 16px 0 16px;
  background: var(--sl-color-primary-200);
}
'
]

{ #category : 'web resources' }
TBPostView class >> globalStyleSwitch [

	<webResource: #css>

	^ '
.slmd-switch::part(base) {
  padding-top: 8px;
  padding-left: 16px;
}

.slmd-switch::part(form-control-help-text) {
  height: 16px;
  width: 100%;
  font-size: 12px;
  padding: 4px 16px 0 16px;
  background: var(--sl-color-primary-200);
}
'
]

{ #category : 'web resources' }
TBPostView class >> globalStyleTextarea [

	<webResource: #css>

	^ '
.slmd-textarea::part(form-control) {
  position: relative;
  width: 100%;
  padding: 0;
  background: var(--sl-color-neutral-100);
}

.slmd-textarea::part(form-control) {
  height: 100%;
}

.slmd-textarea::part(base) {
  padding-top: 12px;
}

.slmd-textarea::part(form-control-label) {
  position: absolute; top: 0; left: 0;
  height: 16px;
  font-size: 12px;
  padding: 4px 16px 0 16px;
  z-index: 10;
  background-color: rgb(0 0 0 / 0);
}

.slmd-textarea::part(form-control-input) {
  width: 100%;
  font-size: 16px;
  background: var(--sl-color-neutral-100);
}

.slmd-textarea::part(form-control-help-text) {
  height: 16px;
  width: calc(100% - 32px);
  font-size: 12px;
  padding: 4px 16px 0 16px;
  background: var(--sl-color-primary-200);
}
'
]

{ #category : 'web resources' }
TBPostView class >> style [

	<webResource: #css>

	^ '
#container {
  min-width: 300px;
  width: 100%;
}
'
]

{ #category : 'web resources' }
TBPostView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <slot name="card"></slot>
</div>'
]

{ #category : 'rendering' }
TBPostView >> fieldsSetUp: props [
	| card |

	fieldElements := OrderedDictionary new.
	card := #div asHtmlTag
		addClass: 'tblog-post';
		appendChild: (self fieldAt: 'title' label: 'Title' text: (props at: 'title'));
		appendChild: (self fieldAt: 'text' label: 'Text' textarea: (props at: 'text'));
		appendChild: (self fieldAt: 'date' label: 'Date' text: (props at: 'date'));
		appendChild: (self fieldAt: 'category' label: 'Category' text: (props at: 'category'));
		appendChild: (self fieldAt: 'visible' label: 'Visible' switch: (props at: 'visible'));
		yourself.

	self replaceAllChildrenWith: card atSlotNamed: 'card'.

]
