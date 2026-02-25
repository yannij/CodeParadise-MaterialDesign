Class {
	#name : 'WamLoginView',
	#superclass : 'WamObjectView',
	#category : 'CodeParadise-MaterialDesign-Login',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Login'
}

{ #category : 'web resources' }
WamLoginView class >> style [

	<webResource: #css>

	^ '
.slmd-login-container {
  display: flex;
  flex-flow: column;
  align-items: center;
  justify-content: center;
  font-family: sans-serif;
}
.slmd-login {
  min-width: 300px;
  max-width: 400px;
  background: var(--wa-color-brand-fill-normal);
}
.slmd-login-header {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 16px;
  background: var(--wa-color-brand-fill-normal);
  font-size: var(--wa-font-size-x-large);
 }
'
]

{ #category : 'web resources' }
WamLoginView class >> template [

	<webResource: #html>

	^ '<div id="container" class="slmd-login-container">
<div class="slmd-login">
  <div class="slmd-login-header"><slot name="header"></slot></div>
  <slot name="card"></slot>
  <slot name="buttons"></slot>
</div>
</div>'
]

{ #category : 'rendering' }
WamLoginView >> addButtons [
	| element |

	element := WaButton new
		variantBeBrand;
		label: 'Login';
		when: CpClickEvent basicPrimary send: #login to: self;
		styleAt: 'width' put: '100%';
		styleAt: 'padding' put: '0 8px 8px 8px';
		yourself.
	self appendChild: element atSlotNamed: #buttons.

	element := WaButton new
		variantBeNeutral;
		label: 'Cancel';
		when: CpClickEvent basicPrimary send: #cancel to: self;
		styleAt: 'width' put: '100%';
		styleAt: 'padding' put: '0 8px 8px 8px';
		yourself.
	self appendChild: element atSlotNamed: #buttons.
]

{ #category : 'actions' }
WamLoginView >> cancel [
]

{ #category : 'rendering' }
WamLoginView >> header: aString [

	self replaceAllChildrenWith: aString asHtmlElement atSlotNamed: #header.
]

{ #category : 'accessing' }
WamLoginView >> layoutViewLazy [

	self shouldNotImplement
]

{ #category : 'actions' }
WamLoginView >> login [

	self serverAnnounce: WamLoginRequested new
]
