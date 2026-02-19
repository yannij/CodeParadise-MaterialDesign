Class {
	#name : 'WaPopup',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'properties' }
WaPopup >> active [

	^ self propertyAt: #active
]

{ #category : 'properties' }
WaPopup >> active: aBoolean [

	self propertyAt: #active put: aBoolean
]

{ #category : 'properties' }
WaPopup >> activeBeOff [

	self active: false
]

{ #category : 'properties' }
WaPopup >> activeBeOn [

	self active: true
]

{ #category : 'properties' }
WaPopup >> activeIsOff [

	^ (self propertyAt: #active) not
]

{ #category : 'properties' }
WaPopup >> activeIsOn [

	^ self propertyAt: #active
]

{ #category : 'properties' }
WaPopup >> anchor [

	^ self propertyAt: #anchor
]

{ #category : 'properties' }
WaPopup >> anchor: anObject [

	self propertyAt: #anchor put: anObject
]

{ #category : 'properties' }
WaPopup >> arrow [

	^ self propertyAt: #arrow
]

{ #category : 'properties' }
WaPopup >> arrow: aBoolean [

	self propertyAt: #arrow put: aBoolean
]

{ #category : 'properties' }
WaPopup >> arrowBeOff [

	self arrow: false
]

{ #category : 'properties' }
WaPopup >> arrowBeOn [

	self arrow: true
]

{ #category : 'css custom properties' }
WaPopup >> arrowColor [

	^ self customPropertyAt: #'arrow-color'
]

{ #category : 'css custom properties' }
WaPopup >> arrowColor: aString [

	self customPropertyAt: #'arrow-color' put: aString
]

{ #category : 'properties' }
WaPopup >> arrowIsOff [

	^ (self propertyAt: #arrow) not
]

{ #category : 'properties' }
WaPopup >> arrowIsOn [

	^ self propertyAt: #arrow
]

{ #category : 'properties' }
WaPopup >> arrowPadding [

	^ self propertyAt: #'arrow-padding'
]

{ #category : 'properties' }
WaPopup >> arrowPadding: anObject [

	self propertyAt: #'arrow-padding' put: anObject
]

{ #category : 'properties' }
WaPopup >> arrowPlacement [

	^ self propertyAt: #'arrow-placement'
]

{ #category : 'properties' }
WaPopup >> arrowPlacement: anObject [

	self propertyAt: #'arrow-placement' put: anObject
]

{ #category : 'properties' }
WaPopup >> arrowPlacementBeAnchor [

	self arrowPlacement: #anchor
]

{ #category : 'properties' }
WaPopup >> arrowPlacementBeCenter [

	self arrowPlacement: #center
]

{ #category : 'properties' }
WaPopup >> arrowPlacementBeEnd [

	self arrowPlacement: #end
]

{ #category : 'properties' }
WaPopup >> arrowPlacementBeStart [

	self arrowPlacement: #start
]

{ #category : 'css custom properties' }
WaPopup >> arrowSize [

	^ self customPropertyAt: #'arrow-size'
]

{ #category : 'css custom properties' }
WaPopup >> arrowSize: aString [

	self customPropertyAt: #'arrow-size' put: aString
]

{ #category : 'properties' }
WaPopup >> autoSize [

	^ self propertyAt: #'auto-size'
]

{ #category : 'properties' }
WaPopup >> autoSize: anObject [

	self propertyAt: #'auto-size' put: anObject
]

{ #category : 'css custom properties' }
WaPopup >> autoSizeAvailableHeight [

	^ self customPropertyAt: #'auto-size-available-height'
]

{ #category : 'css custom properties' }
WaPopup >> autoSizeAvailableHeight: aString [

	self customPropertyAt: #'auto-size-available-height' put: aString
]

{ #category : 'css custom properties' }
WaPopup >> autoSizeAvailableWidth [

	^ self customPropertyAt: #'auto-size-available-width'
]

{ #category : 'css custom properties' }
WaPopup >> autoSizeAvailableWidth: aString [

	self customPropertyAt: #'auto-size-available-width' put: aString
]

{ #category : 'properties' }
WaPopup >> autoSizeBeBoth [

	self autoSize: #both
]

{ #category : 'properties' }
WaPopup >> autoSizeBeHorizontal [

	self autoSize: #horizontal
]

{ #category : 'properties' }
WaPopup >> autoSizeBeVertical [

	self autoSize: #vertical
]

{ #category : 'properties' }
WaPopup >> autoSizePadding [

	^ self propertyAt: #'auto-size-padding'
]

{ #category : 'properties' }
WaPopup >> autoSizePadding: anObject [

	self propertyAt: #'auto-size-padding' put: anObject
]

{ #category : 'properties' }
WaPopup >> boundary [

	^ self propertyAt: #boundary
]

{ #category : 'properties' }
WaPopup >> boundary: anObject [

	self propertyAt: #boundary put: anObject
]

{ #category : 'properties' }
WaPopup >> boundaryBeScroll [

	self boundary: #scroll
]

{ #category : 'properties' }
WaPopup >> boundaryBeViewport [

	self boundary: #viewport
]

{ #category : 'properties' }
WaPopup >> distance [

	^ self propertyAt: #distance
]

{ #category : 'properties' }
WaPopup >> distance: anObject [

	self propertyAt: #distance put: anObject
]

{ #category : 'properties' }
WaPopup >> flip [

	^ self propertyAt: #flip
]

{ #category : 'properties' }
WaPopup >> flip: aBoolean [

	self propertyAt: #flip put: aBoolean
]

{ #category : 'properties' }
WaPopup >> flipBeOff [

	self flip: false
]

{ #category : 'properties' }
WaPopup >> flipBeOn [

	self flip: true
]

{ #category : 'properties' }
WaPopup >> flipFallbackPlacements [

	^ self propertyAt: #'flip-fallback-placements'
]

{ #category : 'properties' }
WaPopup >> flipFallbackPlacements: anObject [

	self propertyAt: #'flip-fallback-placements' put: anObject
]

{ #category : 'properties' }
WaPopup >> flipFallbackStrategy [

	^ self propertyAt: #'flip-fallback-strategy'
]

{ #category : 'properties' }
WaPopup >> flipFallbackStrategy: anObject [

	self propertyAt: #'flip-fallback-strategy' put: anObject
]

{ #category : 'properties' }
WaPopup >> flipFallbackStrategyBeBestFit [

	self flipFallbackStrategy: #'best fit'
]

{ #category : 'properties' }
WaPopup >> flipFallbackStrategyBeInitial [

	self flipFallbackStrategy: #initial
]

{ #category : 'properties' }
WaPopup >> flipIsOff [

	^ (self propertyAt: #flip) not
]

{ #category : 'properties' }
WaPopup >> flipIsOn [

	^ self propertyAt: #flip
]

{ #category : 'properties' }
WaPopup >> flipPadding [

	^ self propertyAt: #'flip-padding'
]

{ #category : 'properties' }
WaPopup >> flipPadding: anObject [

	self propertyAt: #'flip-padding' put: anObject
]

{ #category : 'css custom properties' }
WaPopup >> hideDuration [

	^ self customPropertyAt: #'hide-duration'
]

{ #category : 'css custom properties' }
WaPopup >> hideDuration: aString [

	self customPropertyAt: #'hide-duration' put: aString
]

{ #category : 'properties' }
WaPopup >> hoverBridge [

	^ self propertyAt: #'hover-bridge'
]

{ #category : 'properties' }
WaPopup >> hoverBridge: aBoolean [

	self propertyAt: #'hover-bridge' put: aBoolean
]

{ #category : 'properties' }
WaPopup >> hoverBridgeBeOff [

	self hoverBridge: false
]

{ #category : 'properties' }
WaPopup >> hoverBridgeBeOn [

	self hoverBridge: true
]

{ #category : 'properties' }
WaPopup >> hoverBridgeIsOff [

	^ (self propertyAt: #'hover-bridge') not
]

{ #category : 'properties' }
WaPopup >> hoverBridgeIsOn [

	^ self propertyAt: #'hover-bridge'
]

{ #category : 'properties' }
WaPopup >> placement [

	^ self propertyAt: #placement
]

{ #category : 'properties' }
WaPopup >> placement: anObject [

	self propertyAt: #placement put: anObject
]

{ #category : 'properties' }
WaPopup >> placementBeBottom [

	self placement: #bottom
]

{ #category : 'properties' }
WaPopup >> placementBeBottomEnd [

	self placement: #'bottom end'
]

{ #category : 'properties' }
WaPopup >> placementBeBottomStart [

	self placement: #'bottom start'
]

{ #category : 'properties' }
WaPopup >> placementBeLeft [

	self placement: #left
]

{ #category : 'properties' }
WaPopup >> placementBeLeftEnd [

	self placement: #'left end'
]

{ #category : 'properties' }
WaPopup >> placementBeLeftStart [

	self placement: #'left start'
]

{ #category : 'properties' }
WaPopup >> placementBeRight [

	self placement: #right
]

{ #category : 'properties' }
WaPopup >> placementBeRightEnd [

	self placement: #'right end'
]

{ #category : 'properties' }
WaPopup >> placementBeRightStart [

	self placement: #'right start'
]

{ #category : 'properties' }
WaPopup >> placementBeTop [

	self placement: #top
]

{ #category : 'properties' }
WaPopup >> placementBeTopEnd [

	self placement: #'top end'
]

{ #category : 'properties' }
WaPopup >> placementBeTopStart [

	self placement: #'top start'
]

{ #category : 'properties' }
WaPopup >> shift [

	^ self propertyAt: #shift
]

{ #category : 'properties' }
WaPopup >> shift: aBoolean [

	self propertyAt: #shift put: aBoolean
]

{ #category : 'properties' }
WaPopup >> shiftBeOff [

	self shift: false
]

{ #category : 'properties' }
WaPopup >> shiftBeOn [

	self shift: true
]

{ #category : 'properties' }
WaPopup >> shiftIsOff [

	^ (self propertyAt: #shift) not
]

{ #category : 'properties' }
WaPopup >> shiftIsOn [

	^ self propertyAt: #shift
]

{ #category : 'properties' }
WaPopup >> shiftPadding [

	^ self propertyAt: #'shift-padding'
]

{ #category : 'properties' }
WaPopup >> shiftPadding: anObject [

	self propertyAt: #'shift-padding' put: anObject
]

{ #category : 'css custom properties' }
WaPopup >> showDuration [

	^ self customPropertyAt: #'show-duration'
]

{ #category : 'css custom properties' }
WaPopup >> showDuration: aString [

	self customPropertyAt: #'show-duration' put: aString
]

{ #category : 'properties' }
WaPopup >> skidding [

	^ self propertyAt: #skidding
]

{ #category : 'properties' }
WaPopup >> skidding: anObject [

	self propertyAt: #skidding put: anObject
]

{ #category : 'properties' }
WaPopup >> sync [

	^ self propertyAt: #sync
]

{ #category : 'properties' }
WaPopup >> sync: anObject [

	self propertyAt: #sync put: anObject
]

{ #category : 'properties' }
WaPopup >> syncBeBoth [

	self sync: #both
]

{ #category : 'properties' }
WaPopup >> syncBeHeight [

	self sync: #height
]

{ #category : 'properties' }
WaPopup >> syncBeWidth [

	self sync: #width
]
