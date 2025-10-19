Class {
	#name : 'WaButtonGroup',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing string' }
WaButtonGroup >> label [

	^ self propertyAt: #label
]

{ #category : 'accessing string' }
WaButtonGroup >> label: anObject [

	self propertyAt: #label put: anObject
]

{ #category : 'accessing string' }
WaButtonGroup >> orientation [

	^ self propertyAt: #orientation
]

{ #category : 'accessing string' }
WaButtonGroup >> orientation: anObject [

	self propertyAt: #orientation put: anObject
]

{ #category : 'accessing string' }
WaButtonGroup >> orientationBeHorizontal [

	self orientation: 'horizontal'
]

{ #category : 'accessing string' }
WaButtonGroup >> orientationBeVertical [

	self orientation: 'vertical'
]

{ #category : 'accessing string' }
WaButtonGroup >> variant [

	^ self propertyAt: #variant
]

{ #category : 'accessing string' }
WaButtonGroup >> variant: anObject [

	self propertyAt: #variant put: anObject
]

{ #category : 'accessing string' }
WaButtonGroup >> variantBeBrand [

	self variant: 'brand'
]

{ #category : 'accessing string' }
WaButtonGroup >> variantBeDanger [

	self variant: 'danger'
]

{ #category : 'accessing string' }
WaButtonGroup >> variantBeNeutral [

	self variant: 'neutral'
]

{ #category : 'accessing string' }
WaButtonGroup >> variantBeSuccess [

	self variant: 'success'
]

{ #category : 'accessing string' }
WaButtonGroup >> variantBeWarning [

	self variant: 'warning'
]
