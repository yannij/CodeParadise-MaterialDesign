Class {
	#name : 'SlmdItemWrapperView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ShoelaceListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceListDetail'
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
  background: var(--sl-color-primary-200);
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

{ #category : 'finding' }
SlmdItemWrapperView >> wrappedView [

	^ self firstChildAtSlotNamed: #wrapped
]
