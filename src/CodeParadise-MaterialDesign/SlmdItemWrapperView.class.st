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

{ #category : 'rendering' }
SlmdItemWrapperView >> renderButtons [
	| items div |

	items := self layoutViewLazy actionItems.

	div := #div asHtmlTag
		addClass: 'slmd-item-wrapper-header';
		appendChild: (self iconButtonForAction: (items at: #crudSave) css: 'cssClass');
		appendChild: (self iconButtonForAction: (items at: #crudCancel) css: 'cssClass');
		yourself.
	self replaceAllChildrenWith: div atSlotNamed: #header.

]

{ #category : 'finding' }
SlmdItemWrapperView >> wrappedView [

	^ self firstChildAtSlotNamed: #wrapped
]
