Class {
	#name : 'TBRootView',
	#superclass : 'WamWebView',
	#category : 'CodeParadise-Examples-MD3-TinyBlog',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'TinyBlog'
}

{ #category : 'web resources' }
TBRootView class >> template [

	<webResource: #html>

	^ '<slot name="layout"></slot>'
]
