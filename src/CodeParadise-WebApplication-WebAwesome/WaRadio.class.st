Class {
	#name : 'WaRadio',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'evaluating' }
WaRadio >> value [

	"Selected value (a String)"

	^ self propertyAt: #value
]

{ #category : 'accessing' }
WaRadio >> value: aString [

	self propertyAt: #value put: aString
]
