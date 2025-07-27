Class {
	#name : 'SlmdNavActionRequest',
	#superclass : 'CpActionRequested',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'instance creation' }
SlmdNavActionRequest class >> actionParameter: anObject [

	^ self id: #action parameter: anObject
]

{ #category : 'instance creation' }
SlmdNavActionRequest class >> actionRequest [

	^ self id: #action
]

{ #category : 'instance creation' }
SlmdNavActionRequest class >> navParameter: anObject [

	^ self id: #navigate parameter: anObject
]

{ #category : 'instance creation' }
SlmdNavActionRequest class >> navParameterKeys: anObject [

	^ self id: #navigate parameterKeys: anObject
]
