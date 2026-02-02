Class {
	#name : 'SlmdItemWrapperView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'web resources' }
SlmdItemWrapperView class >> globalStyle [

	<webResource: #css>

	^ '
.slmd-item-wrapper-header {
  display: flex;
  flex-direction: row;
  margin-left: auto;
}
'
]

{ #category : 'web resources' }
SlmdItemWrapperView class >> style [

	<webResource: #css>

	^ '
#container {
  display: flex;
  background: var(--wa-color-brand-80);
}
'
]

{ #category : 'web resources' }
SlmdItemWrapperView class >> template [

	<webResource: #html>

	^ '<div id="container" style="flex-direction: column">
  <slot name="header"></slot>
  <slot name="wrapped"></slot>
  <slot name="footer"></slot>
</div>'
]

{ #category : 'rendering' }
SlmdItemWrapperView >> changeMap [

	^ self wrappedView first changeMap
]

{ #category : 'finding' }
SlmdItemWrapperView >> setEditable: aBoolean [

	self systemLog logTrace: 'setEditable: ', aBoolean printString.

	(self childrenAtSlotNamed: #wrapped) do: [ :eachAttribute |
		eachAttribute setEditable: aBoolean ]

]

{ #category : 'finding' }
SlmdItemWrapperView >> wrappedView [

	^ self childrenAtSlotNamed: #wrapped
]
