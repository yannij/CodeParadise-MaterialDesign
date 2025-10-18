Class {
	#name : 'WaInputEvent',
	#superclass : 'WaEvent',
	#category : 'CodeParadise-WebApplication-WebAwesome-Events',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Events'
}

{ #category : 'event handling' }
WaInputEvent >> handleEventForField: aSymbol inView: aView [

	"Let the specified view handle the receiver event"

	aView handleInputEvent: self forField: aSymbol
]
