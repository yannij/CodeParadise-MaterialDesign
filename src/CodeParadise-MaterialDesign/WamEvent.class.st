"
I am the base class for events triggered by WebAwesome Material Design components.
"
Class {
	#name : 'WamEvent',
	#superclass : 'CpActionRequested',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'printing' }
WamEvent >> printOn: aStream [

	aStream nextPutAll: 'EVENT id: '; print: id.
	(self hasParameters and: [ parameters ~~ #UndefinedObject ]) ifTrue: [
		aStream nextPutAll: ', parameters: '; print: parameters ]
]
