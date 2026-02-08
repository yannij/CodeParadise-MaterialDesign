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
  flex: 0 0 96px;
  height: 100%;
  padding: 0;
  margin: 0;
  background: var(--wa-color-brand-fill-quiet);
  overflow-y: auto;
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
