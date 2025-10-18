Class {
	#name : 'WaChangeEvent',
	#superclass : 'WaEvent',
	#category : 'CodeParadise-WebApplication-WebAwesome-Events',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Events'
}

{ #category : 'accessing' }
WaChangeEvent class >> type [

	^ 'change'
]

{ #category : 'event handling' }
WaChangeEvent >> handleEventForField: aSymbol inView: aView [

	"Let the specified view handle the receiver event"

	aView handleChangeEvent: self forField: aSymbol
]
