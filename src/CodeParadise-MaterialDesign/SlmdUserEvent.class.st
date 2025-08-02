Class {
	#name : 'SlmdUserEvent',
	#superclass : 'CpActionRequested',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'instance creation' }
SlmdUserEvent class >> actionParameter: anObject [

	^ self id: #action parameter: anObject
]

{ #category : 'instance creation' }
SlmdUserEvent class >> actionRequest [

	^ self id: #action
]
