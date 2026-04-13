Class {
	#name : 'WamDemoMovieListingAppView',
	#superclass : 'WamWebView',
	#category : 'CodeParadise-Examples-MD3-Movies',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Movies'
}

{ #category : 'web resources' }
WamDemoMovieListingAppView class >> template [

	<webResource: #html>

	^ '<slot name="layout"></slot>'
]
