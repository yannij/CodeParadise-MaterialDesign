Class {
	#name : 'SlmdListDetailView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'web resources' }
SlmdListDetailView class >> style [

	<webResource: #css>

	^'
.smd-list {
margin-block-end: 0;
margin-block-start: 0;
padding-inline-start: 0;
}'
]

{ #category : 'web resources' }
SlmdListDetailView class >> template [

	<webResource: #html>

	^ '<ol class="wa-stack wa-gap-0 smd-list">
  <slot name="list"></slot>
</ol>'
]
