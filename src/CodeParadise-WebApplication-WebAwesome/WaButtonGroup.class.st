Class {
	#name : 'WaButtonGroup',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'properties' }
WaButtonGroup >> label [

	^ self propertyAt: #label
]

{ #category : 'properties' }
WaButtonGroup >> label: anObject [

	self propertyAt: #label put: anObject
]

{ #category : 'properties' }
WaButtonGroup >> orientation [

	^ self propertyAt: #orientation
]

{ #category : 'properties' }
WaButtonGroup >> orientation: anObject [

	self propertyAt: #orientation put: anObject
]

{ #category : 'properties' }
WaButtonGroup >> orientationBeHorizontal [

	self orientation: #horizontal
]

{ #category : 'properties' }
WaButtonGroup >> orientationBeVertical [

	self orientation: #vertical
]

{ #category : 'properties' }
WaButtonGroup >> variant [

	^ self propertyAt: #variant
]

{ #category : 'properties' }
WaButtonGroup >> variant: anObject [

	self propertyAt: #variant put: anObject
]

{ #category : 'properties' }
WaButtonGroup >> variantBeBrand [

	self variant: #brand
]

{ #category : 'properties' }
WaButtonGroup >> variantBeDanger [

	self variant: #danger
]

{ #category : 'properties' }
WaButtonGroup >> variantBeNeutral [

	self variant: #neutral
]

{ #category : 'properties' }
WaButtonGroup >> variantBeSuccess [

	self variant: #success
]

{ #category : 'properties' }
WaButtonGroup >> variantBeWarning [

	self variant: #warning
]
