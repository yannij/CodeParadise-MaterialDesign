Class {
	#name : 'SlmdObjectModel',
	#superclass : 'SlmdModel',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'accessing' }
SlmdObjectModel class >> soilTransientInstVars [

	^ #( announcer )
]

{ #category : 'rendering' }
SlmdObjectModel >> applyChanges: changes [

	self subclassResponsibility
]

{ #category : 'converting' }
SlmdObjectModel >> asProperties [
	"Subclasses may override"

	^ Dictionary new
]

{ #category : 'rendering' }
SlmdObjectModel >> handleDelete: anObject [

	"self logTrace: anObject printString method: 'handleDelete:'."
	self traceCr: anObject printString.
	^ self.

]

{ #category : 'rendering' }
SlmdObjectModel >> handleSave: anObject [
	| changes |

	self traceCr: anObject printString.

	changes := anObject parameters at: #changes ifAbsent: [ ^ self traceCr: 'Missing "changes" value on "save" event'].
	self applyChanges: changes.

]

{ #category : 'rendering' }
SlmdObjectModel >> handleUpdate: anObject [

	self traceCr: anObject printString.

]

{ #category : 'printing' }
SlmdObjectModel >> shortSummary [
	"Answer a short descriptive string of the receiver.
	Typically used for display in a list.
	Subclasses should provide better string"

	^ self printString
]

{ #category : 'printing' }
SlmdObjectModel >> slmdShortSummary [
	"Answer a short descriptive string of the receiver.
	Typically used for display in a list.
	Subclasses should provide better string"

	^ self printString
]
