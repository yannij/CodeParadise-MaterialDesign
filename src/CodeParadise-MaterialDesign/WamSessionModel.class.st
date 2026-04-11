Class {
	#name : 'WamSessionModel',
	#superclass : 'WamModel',
	#instVars : [
		'properties'
	],
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'initialization' }
WamSessionModel >> initialize [

	super initialize.

	properties := IdentityDictionary new.

]

{ #category : 'accessing' }
WamSessionModel >> properties [

	^ properties
]

{ #category : 'accessing' }
WamSessionModel >> properties: anObject [

	properties := anObject
]

{ #category : 'accessing' }
WamSessionModel >> propertyAt: aKey [

	^ self properties at: aKey ifAbsent: []
]

{ #category : 'accessing' }
WamSessionModel >> propertyAt: aKey put: anObject [

	self properties at: aKey put: anObject
]
