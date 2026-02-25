Class {
	#name : 'WamItemWrapperView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'web resources' }
WamItemWrapperView class >> globalStyle [

	<webResource: #css>

	^ '
.wam-item-wrapper-header {
  display: flex;
  flex-direction: row;
  margin-left: auto;
}
'
]

{ #category : 'web resources' }
WamItemWrapperView class >> style [

	<webResource: #css>

	^ '
.wam-container {
  box-sizing: border-box;
  padding: var(--wa-space-xs);
}

.wam-item {
  display: flex;
  flex-direction: column
}
'
]

{ #category : 'web resources' }
WamItemWrapperView class >> template [

	<webResource: #html>

	^ '<div id="container" class="wam-container">
  <div class="wam-item">
    <slot name="header"></slot>
    <slot name="wrapped"></slot>
    <slot name="footer"></slot>
  </div>
</div>'
]

{ #category : 'rendering' }
WamItemWrapperView >> changeMap [

	^ self wrappedView first changeMap
]

{ #category : 'finding' }
WamItemWrapperView >> setEditable: aBoolean [

	self systemLog logTrace: 'setEditable: ', aBoolean printString.

	(self childrenAtSlotNamed: #wrapped) do: [ :eachAttribute |
		eachAttribute setEditable: aBoolean ]

]

{ #category : 'finding' }
WamItemWrapperView >> wrappedView [

	^ self childrenAtSlotNamed: #wrapped
]
