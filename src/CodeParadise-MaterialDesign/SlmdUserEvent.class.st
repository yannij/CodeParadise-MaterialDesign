Class {
	#name : 'SlmdUserEvent',
	#superclass : 'CpActionRequested',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SlmdUserEvent class >> eventParameter: anObject [

	^ self id: #event parameter: anObject
]
