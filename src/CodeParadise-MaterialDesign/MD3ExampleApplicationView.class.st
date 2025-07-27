Class {
	#name : 'MD3ExampleApplicationView',
	#superclass : 'CpView',
	#category : 'CodeParadise-MaterialDesign-SimpleDemoApp',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'SimpleDemoApp'
}

{ #category : 'web resources' }
MD3ExampleApplicationView class >> globalStyle [

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
MD3ExampleApplicationView class >> style [

	<webResource: #css>

	^ ''
]

{ #category : 'web resources' }
MD3ExampleApplicationView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <slot name="layout"></slot>
</div>
'
]
