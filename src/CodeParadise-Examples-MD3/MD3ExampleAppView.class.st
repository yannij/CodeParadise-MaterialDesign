Class {
	#name : 'MD3ExampleAppView',
	#superclass : 'SlmdView',
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
  width: 100vw;
  height: 100vh;
  overflow: hidden;
}
'
]

{ #category : 'web resources' }
MD3ExampleAppView class >> style [

	<webResource: #css>

	^ ''
]

{ #category : 'web resources' }
MD3ExampleAppView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <slot name="layout"></slot>
</div>
'
]
