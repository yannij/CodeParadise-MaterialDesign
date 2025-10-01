Class {
	#name : 'SlmdNavRailView',
	#superclass : 'SlmdNavView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'class initialization' }
SlmdNavRailView class >> beLoaded [

	SlDrawer beLoaded
]

{ #category : 'web resources' }
SlmdNavRailView class >> style [
	<webResource: #css>

	^ '.navrail {
  height: 100%;
  overflow-y: auto;
  padding: 0;
  margin: 0;
  background: var(--sl-color-primary-100);
}

.navrail::part(panel) {
  background: var(--sl-color-primary-100);
}

.smd-navrailx {
  height: 100%;
  padding-left: 20px;
  margin: 0;
  background: var(--sl-color-primary-100);
  flow-direction: row;
}
'
]

{ #category : 'web resources' }
SlmdNavRailView class >> template [
	<webResource: #html>

	^ '
<nav id="container" class="navrail">
  <slot name="content"></slot>
</nav>
'
]
