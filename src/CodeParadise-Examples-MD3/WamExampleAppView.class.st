Class {
	#name : 'WamExampleAppView',
	#superclass : 'WamWebView',
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

{ #category : 'web resources' }
WamExampleAppView class >> globalStyle [

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
WamExampleAppView class >> style [

	<webResource: #css>

	^ '*, *:before, *:after {
	box-sizing: border-box;
}'
]

{ #category : 'web resources' }
WamExampleAppView class >> template [

	<webResource: #html>

	^ '<slot name="layout"></slot>'
]
