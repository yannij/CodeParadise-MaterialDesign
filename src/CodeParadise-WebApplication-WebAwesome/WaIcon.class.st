Class {
	#name : 'WaIcon',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing' }
WaIcon class >> fullyNamed: aString [

	^ self new
		fullName: aString ;
		yourself
]

{ #category : 'accessing' }
WaIcon class >> named: aString [

	^ self new
		name: aString ;
		yourself
]

{ #category : 'properties' }
WaIcon >> autoWidth [

	^ (self attributeAt: #'auto-width') notNil
]

{ #category : 'properties' }
WaIcon >> autoWidth: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'auto-width' ]
		ifFalse: [ self removeAttributeAt: #'auto-width' ]
]

{ #category : 'properties' }
WaIcon >> autoWidthBeOff [

	self autoWidth: false
]

{ #category : 'properties' }
WaIcon >> autoWidthBeOn [

	self autoWidth: true
]

{ #category : 'properties' }
WaIcon >> family [

	^ self propertyAt: #family
]

{ #category : 'properties' }
WaIcon >> family: anObject [

	self propertyAt: #family put: anObject
]

{ #category : 'accessing' }
WaIcon >> fullName: aString [

	"Set the name and optionally the library for the receiver specified on the given full name.
	The full name should take the form: <library>:<name>
	If no colon ($:) is specified, only the name is assumed."

	| separatorIndex |

	separatorIndex := aString indexOf: $:.
	separatorIndex = 0
		ifTrue: [ self name: aString ]
		ifFalse: [
			self
				library: (aString first: separatorIndex - 1) ;
				name: (aString allButFirst: separatorIndex) ]
]

{ #category : 'properties' }
WaIcon >> label [

	^ self propertyAt: #label
]

{ #category : 'properties' }
WaIcon >> label: anObject [

	self propertyAt: #label put: anObject
]

{ #category : 'properties' }
WaIcon >> library [

	^ self propertyAt: #library
]

{ #category : 'properties' }
WaIcon >> library: anObject [

	self propertyAt: #library put: anObject
]

{ #category : 'properties' }
WaIcon >> name [

	^ self propertyAt: #name
]

{ #category : 'properties' }
WaIcon >> name: anObject [

	self propertyAt: #name put: anObject
]

{ #category : 'css custom properties' }
WaIcon >> primaryColor [

	^ self customPropertyAt: #'primary-color'
]

{ #category : 'css custom properties' }
WaIcon >> primaryColor: aString [

	self customPropertyAt: #'primary-color' put: aString
]

{ #category : 'css custom properties' }
WaIcon >> primaryOpacity [

	^ self customPropertyAt: #'primary-opacity'
]

{ #category : 'css custom properties' }
WaIcon >> primaryOpacity: aString [

	self customPropertyAt: #'primary-opacity' put: aString
]

{ #category : 'css custom properties' }
WaIcon >> secondaryColor [

	^ self customPropertyAt: #'secondary-color'
]

{ #category : 'css custom properties' }
WaIcon >> secondaryColor: aString [

	self customPropertyAt: #'secondary-color' put: aString
]

{ #category : 'css custom properties' }
WaIcon >> secondaryOpacity [

	^ self customPropertyAt: #'secondary-opacity'
]

{ #category : 'css custom properties' }
WaIcon >> secondaryOpacity: aString [

	self customPropertyAt: #'secondary-opacity' put: aString
]

{ #category : 'properties' }
WaIcon >> src [

	^ self propertyAt: #src
]

{ #category : 'properties' }
WaIcon >> src: anObject [

	self propertyAt: #src put: anObject
]

{ #category : 'properties' }
WaIcon >> swapOpacity [

	^ (self attributeAt: #'swap-opacity') notNil
]

{ #category : 'properties' }
WaIcon >> swapOpacity: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'swap-opacity' ]
		ifFalse: [ self removeAttributeAt: #'swap-opacity' ]
]

{ #category : 'properties' }
WaIcon >> swapOpacityBeOff [

	self swapOpacity: false
]

{ #category : 'properties' }
WaIcon >> swapOpacityBeOn [

	self swapOpacity: true
]

{ #category : 'properties' }
WaIcon >> variant [

	^ self propertyAt: #variant
]

{ #category : 'properties' }
WaIcon >> variant: anObject [

	self propertyAt: #variant put: anObject
]
