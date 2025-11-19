Class {
	#name : 'WaSplitPanel',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'properties' }
WaSplitPanel >> disabled [

	^ self propertyAt: #disabled
]

{ #category : 'properties' }
WaSplitPanel >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'properties' }
WaSplitPanel >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaSplitPanel >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaSplitPanel >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaSplitPanel >> disabledIsOn [

	^ self propertyAt: #disabled
]

{ #category : 'slots' }
WaSplitPanel >> divider [

	^ self firstChildAtSlotNamed: #divider
]

{ #category : 'slots' }
WaSplitPanel >> divider: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #divider
]

{ #category : 'css custom properties' }
WaSplitPanel >> dividerHitArea [

	^ self customPropertyAt: #'divider-hit-area'
]

{ #category : 'css custom properties' }
WaSplitPanel >> dividerHitArea: aString [

	self customPropertyAt: #'divider-hit-area' put: aString
]

{ #category : 'css custom properties' }
WaSplitPanel >> dividerWidth [

	^ self customPropertyAt: #'divider-width'
]

{ #category : 'css custom properties' }
WaSplitPanel >> dividerWidth: aString [

	self customPropertyAt: #'divider-width' put: aString
]

{ #category : 'slots' }
WaSplitPanel >> end [

	^ self firstChildAtSlotNamed: #end
]

{ #category : 'slots' }
WaSplitPanel >> end: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #end
]

{ #category : 'css custom properties' }
WaSplitPanel >> max [

	^ self customPropertyAt: #max
]

{ #category : 'css custom properties' }
WaSplitPanel >> max: aString [

	self customPropertyAt: #max put: aString
]

{ #category : 'css custom properties' }
WaSplitPanel >> min [

	^ self customPropertyAt: #min
]

{ #category : 'css custom properties' }
WaSplitPanel >> min: aString [

	self customPropertyAt: #min put: aString
]

{ #category : 'properties' }
WaSplitPanel >> orientation [

	^ self propertyAt: #orientation
]

{ #category : 'properties' }
WaSplitPanel >> orientation: anObject [

	self propertyAt: #orientation put: anObject
]

{ #category : 'properties' }
WaSplitPanel >> orientationBeHorizontal [

	self orientation: #horizontal
]

{ #category : 'properties' }
WaSplitPanel >> orientationBeVertical [

	self orientation: #vertical
]

{ #category : 'properties' }
WaSplitPanel >> position [

	^ self propertyAt: #position
]

{ #category : 'properties' }
WaSplitPanel >> position: anObject [

	self propertyAt: #position put: anObject
]

{ #category : 'properties' }
WaSplitPanel >> positionInPixels [

	^ self attributeAt: #'position-in-pixels'
]

{ #category : 'properties' }
WaSplitPanel >> positionInPixels: anObject [

	self attributeAt: #'position-in-pixels' put: anObject
]

{ #category : 'properties' }
WaSplitPanel >> primary [

	^ self propertyAt: #primary
]

{ #category : 'properties' }
WaSplitPanel >> primary: anObject [

	self propertyAt: #primary put: anObject
]

{ #category : 'properties' }
WaSplitPanel >> primaryBeEnd [

	self primary: #end
]

{ #category : 'properties' }
WaSplitPanel >> primaryBeStart [

	self primary: #start
]

{ #category : 'properties' }
WaSplitPanel >> snap [

	^ self propertyAt: #snap
]

{ #category : 'properties' }
WaSplitPanel >> snap: anObject [

	self propertyAt: #snap put: anObject
]

{ #category : 'properties' }
WaSplitPanel >> snapThreshold [

	^ self propertyAt: #'snap-threshold'
]

{ #category : 'properties' }
WaSplitPanel >> snapThreshold: anObject [

	self propertyAt: #'snap-threshold' put: anObject
]

{ #category : 'slots' }
WaSplitPanel >> start [

	^ self firstChildAtSlotNamed: #start
]

{ #category : 'slots' }
WaSplitPanel >> start: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #start
]
