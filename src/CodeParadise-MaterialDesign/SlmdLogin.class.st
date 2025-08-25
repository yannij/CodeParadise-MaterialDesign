Class {
	#name : 'SlmdLogin',
	#superclass : 'SlmdModel',
	#instVars : [
		'username',
		'password',
		'message'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'initialization' }
SlmdLogin >> initialize [

	super initialize.

	self username: 'tu1@test.co'
]

{ #category : 'accessing' }
SlmdLogin >> message [

	^ message
]

{ #category : 'accessing' }
SlmdLogin >> message: anObject [

	message := anObject
]

{ #category : 'accessing' }
SlmdLogin >> password [

	^ password
]

{ #category : 'accessing' }
SlmdLogin >> password: anObject [

	password := anObject
]

{ #category : 'accessing' }
SlmdLogin >> username [

	^ username
]

{ #category : 'accessing' }
SlmdLogin >> username: anObject [

	username := anObject
]
