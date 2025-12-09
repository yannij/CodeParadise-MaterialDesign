Class {
	#name : 'WaSelectionChange',
	#superclass : 'WaEvent',
	#category : 'CodeParadise-WebApplication-WebAwesome-Events',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Events'
}

{ #category : 'accessing' }
WaSelectionChange >> selection [

	"Answer a collection of the receiver's tree items which is stored in the event detail dictionary"

	^ self detail at: 'selection' ifAbsent: [ nil ]
]
