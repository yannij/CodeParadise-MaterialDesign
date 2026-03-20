Class {
	#name : 'WaDivider',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'css custom properties' }
WaDivider >> color [

	^ self customPropertyAt: #color
]

{ #category : 'css custom properties' }
WaDivider >> color: aString [

	self customPropertyAt: #color put: aString
]

{ #category : 'properties' }
WaDivider >> orientation [

	^ self propertyAt: #orientation
]

{ #category : 'properties' }
WaDivider >> orientation: anObject [

	self propertyAt: #orientation put: anObject
]

{ #category : 'properties' }
WaDivider >> orientationBeHorizontal [

	self orientation: #horizontal
]

{ #category : 'properties' }
WaDivider >> orientationBeVertical [

	self orientation: #vertical
]

{ #category : 'css custom properties' }
WaDivider >> spacing [

	^ self customPropertyAt: #spacing
]

{ #category : 'css custom properties' }
WaDivider >> spacing: aString [

	self customPropertyAt: #spacing put: aString
]

{ #category : 'css custom properties' }
WaDivider >> width [

	^ self customPropertyAt: #width
]

{ #category : 'css custom properties' }
WaDivider >> width: aString [

	self customPropertyAt: #width put: aString
]
