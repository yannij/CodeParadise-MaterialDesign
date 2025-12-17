Class {
	#name : 'SlmdNavRailView',
	#superclass : 'SlmdNavAbstractView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'web resources' }
SlmdNavRailView class >> style [
	<webResource: #css>

	^ '
.navrail {
  height: 100%;
  overflow-y: auto;
  padding: 8px 0;
  background: var(--wa-color-brand-780);
}
'
]

{ #category : 'web resources' }
SlmdNavRailView class >> template [
	<webResource: #html>

	^ '<nav id="container" class="navrail">
  <slot name="content"></slot>
</nav>
'
]
