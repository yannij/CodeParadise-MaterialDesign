Class {
	#name : 'WamWebView',
	#superclass : 'WamView',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'web resources' }
WamWebView class >> globalStyle [

	<webResource: #css>

	^ '
*, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}
body {
  margin: 0;
  padding: 0;
}
'
]

{ #category : 'examples' }
WamWebView >> registerIcons [

	WaElement registerBootstrapIcons.
]
