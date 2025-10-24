Class {
	#name : 'WaCheckControl',
	#superclass : 'WaFormControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'tags' }
WaCheckControl class >> isAbstractTag [

	"The method is present to indicate the receiver is abstract.
	This method will NOT be evaluated to decide if the receiver is abstract."
]

{ #category : 'instance creation' }
WaCheckControl class >> label: aStringOrElement [

	^ self new
		label: aStringOrElement ;
		yourself
]

{ #category : 'actions' }
WaCheckControl >> click [

	"Simulate a click on the checkbox"

	self apply: #click withArguments: #()
]
