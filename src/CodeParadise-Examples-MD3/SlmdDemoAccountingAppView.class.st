Class {
	#name : 'SlmdDemoAccountingAppView',
	#superclass : 'SlmdView',
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
  width: 100vw;
  height: 100vh;
  overflow: hidden;
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
