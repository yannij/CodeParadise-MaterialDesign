Class {
	#name : 'SlmdDemoAccountingAppView',
	#superclass : 'SlmdWebView',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'web resources' }
SlmdDemoAccountingAppView class >> globalStyle [

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
SlmdDemoAccountingAppView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <slot name="layout"></slot>
</div>
'
]
