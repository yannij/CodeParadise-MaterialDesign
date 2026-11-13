Class {
	#name : 'WamNavActionEvent',
	#superclass : 'WamEvent',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'instance creation' }
WamNavActionEvent class >> fromDictionary: aDictionary [

	aDictionary
		at: #data
		ifPresent: [ :value | ^ self id: (aDictionary at: #eventId) parameters: value ]
		ifAbsent: [ ^ self id: (aDictionary at: #eventId) ]
]

{ #category : 'printing' }
WamNavActionEvent >> eventTypeString [

	^ 'NavAction'
]
