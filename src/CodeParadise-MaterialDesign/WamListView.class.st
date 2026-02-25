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
.smd-container {
  box-sizing: border-box;
  /*padding: var(--wa-space-xs);*/
}

.smd-list {
  margin-block-end: 0;
  margin-block-start: 0;
  padding-inline-start: 0;
}'
]

{ #category : 'web resources' }
WamListView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-container">
  <ol class="wa-stack wa-gap-0 smd-list">
    <slot name="list"></slot>
  </ol>
</div>'
]
