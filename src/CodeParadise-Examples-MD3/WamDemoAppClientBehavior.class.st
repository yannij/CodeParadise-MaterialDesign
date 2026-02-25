Class {
	#name : 'WamDemoAppClientBehavior',
	#superclass : 'WamWebClientBehavior',
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

{ #category : 'accessing' }
WamDemoAppClientBehavior >> appName [

	^ #'WebAwesomeMd3-Demo'
]

{ #category : 'accessing' }
WamDemoAppClientBehavior >> appTagName [
	"Answer web component tag name.
	
	Example:
	WamDemoAppView tagName  'wam-demo-app'
	"

	^ 'wam-demo-app'
]
