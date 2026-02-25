Class {
	#name : 'WamNavRailView',
	#superclass : 'WamNavAbstractView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'web resources' }
WamNavRailView class >> style [
	<webResource: #css>

	^ '
.navrail {
  flex: 0 0 96px;
  height: 100%;
  padding: 0;
  margin: 0;
  background: var(--wa-color-brand-fill-quiet);
  overflow-y: auto;
  box-sizing: border-box;
  border-right: 1px solid var(--wa-color-neutral-70);
}
'
]

{ #category : 'web resources' }
WamNavRailView class >> template [
	<webResource: #html>

	^ '<nav id="container" class="navrail wa-cloak">
  <slot name="content"></slot>
</nav>
'
]
