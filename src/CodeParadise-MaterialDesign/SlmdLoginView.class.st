Class {
	#name : 'SlmdLoginView',
	#superclass : 'SlmdObjectView',
	#category : 'CodeParadise-MaterialDesign-Login',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Login'
}

{ #category : 'web resources' }
SlmdLoginView class >> style [

	<webResource: #css>

	^ '
.slmd-login-container {
  display: flex;
  flex-flow: column;
  align-items: center;
  justify-content: center;
  font-family: var(--sl-font-sans);
}
.slmd-login {
  min-width: 300px;
  max-width: 400px;
  background: var(--sl-color-primary-200);
}
.slmd-login-header {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 16px;
  background: var(--sl-color-primary-200);
  font-size: var(--sl-font-size-x-large);
 }
'
]

{ #category : 'web resources' }
SlmdLoginView class >> template [

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
SlmdLoginView >> addButtons [
	| element |

	element := WaButton new
		variantBeBrand;
		label: 'Login';
		"start: (WaIcon fullyNamed: 'bootstrap:box-arrow-in-left');"
		when: CpClickEvent basicPrimary send: #login to: self;
		styleAt: 'width' put: '100%';
		styleAt: 'padding' put: '0 8px 8px 8px';
		yourself.
	self appendChild: element atSlotNamed: #buttons.

	element := WaButton new
		variantBeNeutral;
		label: 'Cancel';
		"start: (WaIcon fullyNamed: 'bootstrap:x');"
		when: CpClickEvent basicPrimary send: #cancel to: self;
		styleAt: 'width' put: '100%';
		styleAt: 'padding' put: '0 8px 8px 8px';
		yourself.
	self appendChild: element atSlotNamed: #buttons.
]

{ #category : 'actions' }
SlmdLoginView >> cancel [
]

{ #category : 'rendering' }
SlmdLoginView >> header: aString [

	self replaceAllChildrenWith: aString asHtmlElement atSlotNamed: #header.
]

{ #category : 'accessing' }
SlmdLoginView >> layoutViewLazy [

	self shouldNotImplement
]

{ #category : 'actions' }
SlmdLoginView >> login [

	self serverAnnounce: SlmdLoginRequested new
]
