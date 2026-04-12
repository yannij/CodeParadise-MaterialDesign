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

{ #category : 'accessing' }
WamSessionModel >> email [

	^ self propertyAt: #email
]

{ #category : 'accessing' }
WamSessionModel >> email: anObject [

	self propertyAt: #email put: anObject
]

{ #category : 'accessing' }
WamSessionModel >> emailSet: anObject [

	self email: anObject.
	self valueChanged.
	self application layout navRail valueChanged.

]

{ #category : 'initialization' }
WamSessionModel >> initialize [

	super initialize.

	properties := IdentityDictionary new.

]

{ #category : 'testing' }
WamSessionModel >> isAuthenticated [

	^ self email notNil
]

{ #category : 'actions' }
WamSessionModel >> logout [

	self emailSet: nil
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
