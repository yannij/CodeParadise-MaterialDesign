Class {
	#name : 'WaEvent',
	#superclass : 'CpCustomEvent',
	#category : 'CodeParadise-WebApplication-WebAwesome-Events',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Events'
}

{ #category : 'accessing' }
WaEvent class >> type [

	"Answer the JavaScript type (a String) representing the receiver.
	For WebAwesome events this means:
		WaShowEvent type -> 'wa-show'
		WaAfterShowEvent type -> 'wa-after-show'
	"

	^ (self name withoutSuffix: 'Event') asKebabCase
]
