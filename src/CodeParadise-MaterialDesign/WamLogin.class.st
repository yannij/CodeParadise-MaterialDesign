Class {
	#name : 'WamLogin',
	#superclass : 'WamDialogContentModel',
	#instVars : [
		'username',
		'password'
	],
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
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
