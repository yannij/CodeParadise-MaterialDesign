Class {
	#name : 'WaSplitPanel',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing boolean' }
WaSplitPanel >> disabled [

	^ (self attributeAt: #disabled) notNil
]

{ #category : 'accessing boolean' }
WaSplitPanel >> disabled: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #disabled ]
		ifFalse: [ self removeAttributeAt: #disabled ]
]

{ #category : 'accessing boolean' }
WaSplitPanel >> disabledBeOff [

	self disabled: false
]

{ #category : 'accessing boolean' }
WaSplitPanel >> disabledBeOn [

	self disabled: true
]

{ #category : 'accessing slot' }
WaSplitPanel >> divider [

	^ self firstChildAtSlotNamed: #divider
]

{ #category : 'accessing slot' }
WaSplitPanel >> divider: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #divider
]

{ #category : 'accessing css property' }
WaSplitPanel >> dividerHitArea [

	^ self customPropertyAt: #'divider-hit-area'
]

{ #category : 'accessing css property' }
WaSplitPanel >> dividerHitArea: aString [

	self customPropertyAt: #'divider-hit-area' put: aString
]

{ #category : 'accessing css property' }
WaSplitPanel >> dividerWidth [

	^ self customPropertyAt: #'divider-width'
]

{ #category : 'accessing css property' }
WaSplitPanel >> dividerWidth: aString [

	self customPropertyAt: #'divider-width' put: aString
]

{ #category : 'accessing slot' }
WaSplitPanel >> end [

	^ self firstChildAtSlotNamed: #end
]

{ #category : 'accessing slot' }
WaSplitPanel >> end: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #end
]

{ #category : 'accessing css property' }
WaSplitPanel >> max [

	^ self customPropertyAt: #max
]

{ #category : 'accessing css property' }
WaSplitPanel >> max: aString [

	self customPropertyAt: #max put: aString
]

{ #category : 'accessing css property' }
WaSplitPanel >> min [

	^ self customPropertyAt: #min
]

{ #category : 'accessing css property' }
WaSplitPanel >> min: aString [

	self customPropertyAt: #min put: aString
]

{ #category : 'accessing string' }
WaSplitPanel >> orientation [

	^ self propertyAt: #orientation
]

{ #category : 'accessing string' }
WaSplitPanel >> orientation: anObject [

	self propertyAt: #orientation put: anObject
]

{ #category : 'accessing string' }
WaSplitPanel >> orientationBeHorizontal [

	self orientation: 'horizontal'
]

{ #category : 'accessing string' }
WaSplitPanel >> orientationBeVertical [

	self orientation: 'vertical'
]

{ #category : 'accessing number' }
WaSplitPanel >> position [

	^ self propertyAt: #position
]

{ #category : 'accessing number' }
WaSplitPanel >> position: anObject [

	self propertyAt: #position put: anObject
]

{ #category : 'accessing number' }
WaSplitPanel >> positionInPixels [

	^ self propertyAt: #'position-in-pixels'
]

{ #category : 'accessing number' }
WaSplitPanel >> positionInPixels: anObject [

	self propertyAt: #'position-in-pixels' put: anObject
]

{ #category : 'accessing string' }
WaSplitPanel >> primary [

	^ self propertyAt: #primary
]

{ #category : 'accessing string' }
WaSplitPanel >> primary: anObject [

	self propertyAt: #primary put: anObject
]

{ #category : 'accessing string' }
WaSplitPanel >> primaryBeEnd [

	self primary: 'end'
]

{ #category : 'accessing string' }
WaSplitPanel >> primaryBeStart [

	self primary: 'start'
]

{ #category : 'accessing string' }
WaSplitPanel >> snap [

	^ self propertyAt: #snap
]

{ #category : 'accessing string' }
WaSplitPanel >> snap: anObject [

	self propertyAt: #snap put: anObject
]

{ #category : 'accessing number' }
WaSplitPanel >> snapThreshold [

	^ self propertyAt: #'snap-threshold'
]

{ #category : 'accessing number' }
WaSplitPanel >> snapThreshold: anObject [

	self propertyAt: #'snap-threshold' put: anObject
]

{ #category : 'accessing slot' }
WaSplitPanel >> start [

	^ self firstChildAtSlotNamed: #start
]

{ #category : 'accessing slot' }
WaSplitPanel >> start: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #start
]
