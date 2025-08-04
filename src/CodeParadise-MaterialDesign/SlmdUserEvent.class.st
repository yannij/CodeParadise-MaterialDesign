Class {
	#name : 'SlmdUserEvent',
	#superclass : 'CpActionRequested',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'instance creation' }
SlmdUserEvent class >> eventParameter: anObject [

	^ self id: #event parameter: anObject
]
