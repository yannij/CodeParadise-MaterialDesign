Class {
	#name : 'MD3ExampleAppView',
	#superclass : 'SlmdWebView',
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

{ #category : 'web resources' }
MD3ExampleAppView class >> globalStyle [

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
MD3ExampleAppView class >> style [

	<webResource: #css>

	^ '*, *:before, *:after {
	box-sizing: border-box;
}'
]

{ #category : 'web resources' }
MD3ExampleAppView class >> template [

	<webResource: #html>

	^ '<slot name="layout"></slot>'
]
