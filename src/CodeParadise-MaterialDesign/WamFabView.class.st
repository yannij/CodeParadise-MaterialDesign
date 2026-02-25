Class {
	#name : 'WamFabView',
	#superclass : 'WamToolbarView',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'web resources' }
WamFabView class >> globalStyle [

	<webResource: #css>

	^ '
.wam-fab-fab {
  display: flex;
  flex-flow: row nowrap;
  align-items: center;
  justify-content: center;
  height: 56px;
  width: 56px;
  border-radius: 16px;
  background: var(--wa-color-brand-60);
}
'
]

{ #category : 'web resources' }
WamFabView class >> style [

	<webResource: #css>

	^ '
.wam-hidden {
  position: absolute !important;
  top: -9999px !important;
  left: -9999px !important;
}

.wam-fab {
  z-index: 10;
  display: flex;
  flex-flow: row nowrap;

  position: fixed;
  right: 16px;
  bottom: 16px;
}

.wam-fab-offset {
  bottom: 80px; !important
}
'
]

{ #category : 'web resources' }
WamFabView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="wam-fab">
  <slot name="fab"></slot>
</div>
'
]

{ #category : 'nav' }
WamFabView >> fabCssClass [

	^ 'wam-fab-fab'
]

{ #category : 'rendering' }
WamFabView >> setExtraOffset: aBoolean [
	"Increase the offset from bottom, to accomodate a nav bar"
	| container |

	container := self shadowedElementWithId: 'container'.
	container ifNil: [ ^ self ].

	aBoolean
		ifTrue: [ container addClass: 'wam-fab-offset' ]
		ifFalse: [ container removeClass: 'wam-fab-offset' ]

]
