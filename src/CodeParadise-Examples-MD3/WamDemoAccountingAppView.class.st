Class {
	#name : 'WamDemoAccountingAppView',
	#superclass : 'WamWebView',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'web resources' }
WamDemoAccountingAppView class >> template [

	<webResource: #html>

	^ '<slot name="layout"></slot>'
]
