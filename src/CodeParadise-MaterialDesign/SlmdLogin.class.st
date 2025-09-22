Class {
	#name : 'SlmdLogin',
	#superclass : 'SlmdObjectModel',
	#instVars : [
		'username',
		'password',
		'message'
	],
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'converting' }
SlmdLogin >> asMap [

	^ Dictionary new
		at: 'username' put: self username;
		at: 'password' put: self password;
		yourself
]

{ #category : 'metadata' }
SlmdLogin >> fieldsData [

	^ { 'username' -> #string. 'password' -> #string }
]

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
