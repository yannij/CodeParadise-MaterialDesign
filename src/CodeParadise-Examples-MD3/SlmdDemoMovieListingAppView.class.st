Class {
	#name : 'SlmdDemoMovieListingAppView',
	#superclass : 'SlmdWebView',
	#category : 'CodeParadise-Examples-MD3-Movies',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Movies'
}

{ #category : 'web resources' }
SlmdDemoMovieListingAppView class >> globalStyle [

	<webResource: #css>

	^ '
body {
  margin: 0;
  padding: 0;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
}
'
]

{ #category : 'web resources' }
SlmdDemoMovieListingAppView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <slot name="layout"></slot>
</div>
'
]
