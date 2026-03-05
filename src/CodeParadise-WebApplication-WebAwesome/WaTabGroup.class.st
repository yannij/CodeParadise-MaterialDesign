Class {
	#name : 'WaTabGroup',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'properties' }
WaTabGroup >> activation [

	^ self propertyAt: #activation
]

{ #category : 'properties' }
WaTabGroup >> activation: anObject [

	self propertyAt: #activation put: anObject
]

{ #category : 'properties' }
WaTabGroup >> activationBeAuto [

	self activation: #auto
]

{ #category : 'properties' }
WaTabGroup >> activationBeManual [

	self activation: #manual
]

{ #category : 'properties' }
WaTabGroup >> active [

	^ self propertyAt: #active
]

{ #category : 'properties' }
WaTabGroup >> active: anObject [

	self propertyAt: #active put: anObject
]

{ #category : 'slots' }
WaTabGroup >> nav [

	^ self firstChildAtSlotNamed: #nav
]

{ #category : 'slots' }
WaTabGroup >> nav: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #nav
]

{ #category : 'properties' }
WaTabGroup >> placement [

	^ self propertyAt: #placement
]

{ #category : 'properties' }
WaTabGroup >> placement: anObject [

	self propertyAt: #placement put: anObject
]

{ #category : 'properties' }
WaTabGroup >> placementBeBottom [

	self placement: #bottom
]

{ #category : 'properties' }
WaTabGroup >> placementBeEnd [

	self placement: #end
]

{ #category : 'properties' }
WaTabGroup >> placementBeStart [

	self placement: #start
]

{ #category : 'properties' }
WaTabGroup >> placementBeTop [

	self placement: #top
]

{ #category : 'properties' }
WaTabGroup >> withoutScrollControls [

	^ self propertyAt: #'without-scroll-controls'
]

{ #category : 'properties' }
WaTabGroup >> withoutScrollControls: aBoolean [

	self propertyAt: #'without-scroll-controls' put: aBoolean
]

{ #category : 'properties' }
WaTabGroup >> withoutScrollControlsBeOff [

	self withoutScrollControls: false
]

{ #category : 'properties' }
WaTabGroup >> withoutScrollControlsBeOn [

	self withoutScrollControls: true
]

{ #category : 'properties' }
WaTabGroup >> withoutScrollControlsIsOff [

	^ (self propertyAt: #'without-scroll-controls') not
]

{ #category : 'properties' }
WaTabGroup >> withoutScrollControlsIsOn [

	^ self propertyAt: #'without-scroll-controls'
]
