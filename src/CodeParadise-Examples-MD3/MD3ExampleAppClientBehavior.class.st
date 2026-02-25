Class {
	#name : 'MD3ExampleAppClientBehavior',
	#superclass : 'WamWebClientBehavior',
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

{ #category : 'accessing' }
MD3ExampleAppClientBehavior >> appName [

	^ #'MD3 Example'
]

{ #category : 'accessing' }
MD3ExampleAppClientBehavior >> appTagName [
	"Answer web component tag name.
	
	Example:
	MD3ExampleAppView tagName  'm-d3-example-app'
	"

	^ 'md3example-app'
]
