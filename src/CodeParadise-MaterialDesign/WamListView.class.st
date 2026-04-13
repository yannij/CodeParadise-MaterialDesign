Class {
	#name : 'WamListView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'web resources' }
WamListView class >> style [

	<webResource: #css>

	^'
.wam-container {
  box-sizing: border-box;
  padding: var(--wa-space-xs);
}

.wam-list {
  margin-block-end: 0;
  margin-block-start: 0;
  padding-inline-start: 0;
}'
]

{ #category : 'web resources' }
WamListView class >> template [

	<webResource: #html>

	^ WaElement linkUtilitiesCss, '
<div id="container" class="wam-container">
  <ol class="wa-stack wa-gap-s wam-list">
    <slot name="list"></slot>
  </ol>
</div>'
]
