Class {
	#name : 'TBRootView',
	#superclass : 'SlmdWebView',
	#category : 'CodeParadise-Examples-MD3-TinyBlog',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'TinyBlog'
}

{ #category : 'web resources' }
TBRootView class >> globalStyle [

	<webResource: #css>

	^ '
body {
  margin: 0;
  padding: 0;
}
'
]

{ #category : 'web resources' }
TBRootView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <slot name="layout"></slot>
</div>
'
]
