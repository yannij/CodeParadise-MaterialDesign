Class {
	#name : 'WamSessionModel',
	#superclass : 'WamModel',
	#instVars : [
		'userEmail',
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

{ #category : 'testing' }
WamSessionModel >> isUserAuthenticated [

	^ self userEmail notNil
]

{ #category : 'actions' }
WamSessionModel >> logout [

	self userEmailSet: nil
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

{ #category : 'sso' }
WamSessionModel >> ssoRedirectUrlCallback: anEvent [
	"Subclasses may enhance"
]

{ #category : 'accessing' }
WamSessionModel >> userEmail [

	^ userEmail
]

{ #category : 'accessing' }
WamSessionModel >> userEmail: anObject [

	userEmail := anObject
]

{ #category : 'accessing' }
WamSessionModel >> userEmailSet: anObject [

	self userEmail: anObject.
	self valueChanged.

]
