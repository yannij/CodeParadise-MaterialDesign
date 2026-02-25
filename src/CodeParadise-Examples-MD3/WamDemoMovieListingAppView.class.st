Class {
	#name : 'WamDemoMovieListingAppView',
	#superclass : 'WamWebView',
	#category : 'CodeParadise-Examples-MD3-Movies',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Movies'
}

{ #category : 'web resources' }
WamDemoMovieListingAppView class >> globalStyle [

	<webResource: #css>

	^ '
body {
  margin: 0;
  padding: 0;
  overflow: auto;
}
'
]

{ #category : 'web resources' }
WamDemoMovieListingAppView class >> template [

	<webResource: #html>

	^ '<slot name="layout"></slot>'
]
