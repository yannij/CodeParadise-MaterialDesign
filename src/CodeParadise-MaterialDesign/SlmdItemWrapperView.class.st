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
.smd-container {
  box-sizing: border-box;
  padding: var(--wa-space-xs);
}

.smd-item {
  display: flex;
  flex-direction: column
}
'
]

{ #category : 'web resources' }
SlmdItemWrapperView class >> template [

	<webResource: #html>

	^ '<div id="container" class="smd-container">
  <div class="smd-item">
    <slot name="header"></slot>
    <slot name="wrapped"></slot>
    <slot name="footer"></slot>
  </div>
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
