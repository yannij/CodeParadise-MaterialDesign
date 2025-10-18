Class {
	#name : 'WaSplitPanel',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing style' }
WaSplitPanel >> beDisabled [

	self disabled: true
]

{ #category : 'accessing style' }
WaSplitPanel >> beEnabled [

	"Convenience method to make receiver enabled"

	self disabled: false
]

{ #category : 'accessing style' }
WaSplitPanel >> beNotDisabled [

	self disabled: false
]

{ #category : 'accessing style' }
WaSplitPanel >> beNotEnabled [

	"Convenience method to clear the enabled state of the receiver"

	self disabled: true
]

{ #category : 'accessing style' }
WaSplitPanel >> beNotVertical [

	self vertical: false
]

{ #category : 'accessing style' }
WaSplitPanel >> beVertical [

	self vertical: true
]

{ #category : 'accessing' }
WaSplitPanel >> disabled: aBoolean [

	"Disables resizing. Note that the position may still change as a result of resizing the host element."

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'accessing' }
WaSplitPanel >> enabled: aBoolean [

	"Convenience method to set receiver's enabled state"

	self disabled: aBoolean not
]

{ #category : 'accessing' }
WaSplitPanel >> isDisabled [

	^ self propertyAt: #disabled
]

{ #category : 'accessing' }
WaSplitPanel >> isEnabled [

	"Convenience method to test if receiver is enabled"

	^ self isDisabled not
]

{ #category : 'accessing style' }
WaSplitPanel >> isVertical [

	^ self propertyAt: #vertical
]

{ #category : 'accessing' }
WaSplitPanel >> position [

	^ self propertyAt: #position
]

{ #category : 'accessing' }
WaSplitPanel >> position: aNumber [

	"The current position of the divider from the primary panel’s edge as a percentage 0–100. Defaults to 50% of the container’s initial size."

	self propertyAt: #position put: aNumber
]

{ #category : 'accessing' }
WaSplitPanel >> snap [

	^ self propertyAt: #snap
]

{ #category : 'accessing' }
WaSplitPanel >> snap: aString [

	"One or more space-separated values at which the divider should snap. Values can be in pixels or percentages, e.g. '100px 50%'."

	self propertyAt: #snap put: aString
]

{ #category : 'accessing' }
WaSplitPanel >> snapThreshold [

	^ self propertyAt: #snapThreshold
]

{ #category : 'accessing' }
WaSplitPanel >> snapThreshold: aNumber [

	"How close the divider must be to a snap point until snapping occurs."

	self propertyAt: #snapThreshold put: aNumber
]

{ #category : 'accessing style' }
WaSplitPanel >> vertical: aBoolean [

	"Draws the split panel in a vertical orientation with the start and end panels stacked."

	self propertyAt: #vertical put: aBoolean
]
