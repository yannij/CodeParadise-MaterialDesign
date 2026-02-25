Class {
	#name : 'WamDemoAccountingAppView',
	#superclass : 'WamWebView',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'web resources' }
WamDemoAccountingAppView class >> globalStyle [

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
WamDemoAccountingAppView class >> template [

	<webResource: #html>

	^ '<slot name="layout"></slot>'
]
