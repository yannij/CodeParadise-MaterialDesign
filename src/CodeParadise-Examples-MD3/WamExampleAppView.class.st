Class {
	#name : 'WamExampleAppView',
	#superclass : 'WamWebView',
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

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
