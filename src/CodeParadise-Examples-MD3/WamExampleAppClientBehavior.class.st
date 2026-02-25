Class {
	#name : 'WamExampleAppClientBehavior',
	#superclass : 'WamWebClientBehavior',
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

{ #category : 'accessing' }
WamExampleAppClientBehavior >> appName [

	^ #'WAM Example'
]

{ #category : 'accessing' }
WamExampleAppClientBehavior >> appTagName [
	"Answer web component tag name.
	
	Example:
	WamExampleAppView tagName  'wam-example-app'
	"

	^ 'wam-example-app'
]
