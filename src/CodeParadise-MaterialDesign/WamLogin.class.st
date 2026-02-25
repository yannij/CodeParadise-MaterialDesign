Class {
	#name : 'WamLogin',
	#superclass : 'WamObjectModel',
	#instVars : [
		'username',
		'password',
		'message'
	],
	#category : 'CodeParadise-MaterialDesign-Login',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Login'
}

{ #category : 'converting' }
WamLogin >> asMap [

	^ Dictionary new
		at: 'username' put: self username;
		at: 'password' put: self password;
		yourself
]

{ #category : 'metadata' }
WamLogin >> fieldsData [

	^ { 'username' -> #string. 'password' -> #string }
]

{ #category : 'initialization' }
WamLogin >> initialize [

	super initialize.

	self username: 'tu1@test.co'
]

{ #category : 'accessing' }
WamLogin >> message [

	^ message
]

{ #category : 'accessing' }
WamLogin >> message: anObject [

	message := anObject
]

{ #category : 'accessing' }
WamLogin >> password [

	^ password
]

{ #category : 'accessing' }
WamLogin >> password: anObject [

	password := anObject
]

{ #category : 'accessing' }
WamLogin >> username [

	^ username
]

{ #category : 'accessing' }
WamLogin >> username: anObject [

	username := anObject
]
