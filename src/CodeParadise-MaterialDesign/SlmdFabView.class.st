Class {
	#name : 'SlmdFabView',
	#superclass : 'SlmdToolbarView',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'web resources' }
SlmdFabView class >> globalStyle [

	<webResource: #css>

	^ '
.smd-fab-fab {
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
SlmdFabView class >> style [

	<webResource: #css>

	^ '
.smd-hidden {
  position: absolute !important;
  top: -9999px !important;
  left: -9999px !important;
}

.smd-fab {
  z-index: 10;
  display: flex;
  flex-flow: row nowrap;

  position: fixed;
  right: 16px;
  bottom: 16px;
}

.smd-fab-offset {
  bottom: 80px; !important
}
'
]

{ #category : 'web resources' }
SlmdFabView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-fab">
  <slot name="fab"></slot>
</div>
'
]

{ #category : 'nav' }
SlmdFabView >> fabCssClass [

	^ 'smd-fab-fab'
]

{ #category : 'rendering' }
SlmdFabView >> setExtraOffset: aBoolean [
	"Increase the offset from bottom, to accomodate an nav bar"
	| container |

	container := self shadowedElementWithId: 'container'.
	container ifNil: [ ^ self ].

	aBoolean
		ifTrue: [ container addClass: 'smd-fab-offset' ]
		ifFalse: [ container removeClass: 'smd-fab-offset' ]

]
