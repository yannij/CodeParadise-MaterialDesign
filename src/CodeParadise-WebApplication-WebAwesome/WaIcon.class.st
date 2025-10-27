Class {
	#name : 'WaIcon',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'instance creation' }
WaIcon class >> name: object1 [ 

	^ self new 
		name: object1;
		yourself
]

{ #category : 'instance creation' }
WaIcon class >> name: object1 label: object2 [ 

	^ self new 
		name: object1;
		label: object2;
		yourself
]

{ #category : 'instance creation' }
WaIcon class >> name: object1 label: object2 library: object3 [ 

	^ self new 
		name: object1;
		label: object2;
		library: object3;
		yourself
]

{ #category : 'properties' }
WaIcon >> autoWidth [

	self propertyAt: #'auto-width'
]

{ #category : 'properties' }
WaIcon >> autoWidth: aBoolean [

	self propertyAt: #'auto-width' put: aBoolean
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
WaIcon >> autoWidthIsOff [

	^ (self propertyAt: #'auto-width') not
]

{ #category : 'properties' }
WaIcon >> autoWidthIsOn [

	^ self propertyAt: #'auto-width'
]

{ #category : 'properties' }
WaIcon >> family [

	^ self propertyAt: #family
]

{ #category : 'properties' }
WaIcon >> family: anObject [

	self propertyAt: #family put: anObject
]

{ #category : 'properties' }
WaIcon >> label [

	^ self attributeAt: #label
]

{ #category : 'properties' }
WaIcon >> label: anObject [

	self attributeAt: #label put: anObject
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

	self propertyAt: #'swap-opacity'
]

{ #category : 'properties' }
WaIcon >> swapOpacity: aBoolean [

	self propertyAt: #'swap-opacity' put: aBoolean
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
WaIcon >> swapOpacityIsOff [

	^ (self propertyAt: #'swap-opacity') not
]

{ #category : 'properties' }
WaIcon >> swapOpacityIsOn [

	^ self propertyAt: #'swap-opacity'
]

{ #category : 'properties' }
WaIcon >> variant [

	^ self propertyAt: #variant
]

{ #category : 'properties' }
WaIcon >> variant: anObject [

	self propertyAt: #variant put: anObject
]
