Class {
	#name : 'WaRadioGroup',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'evaluating' }
WaRadioGroup >> value [

	"Selected value (a String)"

	^ self propertyAt: #value
]
