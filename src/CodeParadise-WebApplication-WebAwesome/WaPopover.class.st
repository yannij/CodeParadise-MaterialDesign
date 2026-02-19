Class {
	#name : 'WaPopover',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'css custom properties' }
WaPopover >> arrowSize [

	^ self customPropertyAt: #'arrow-size'
]

{ #category : 'css custom properties' }
WaPopover >> arrowSize: aString [

	self customPropertyAt: #'arrow-size' put: aString
]

{ #category : 'properties' }
WaPopover >> distance [

	^ self propertyAt: #distance
]

{ #category : 'properties' }
WaPopover >> distance: anObject [

	self propertyAt: #distance put: anObject
]

{ #category : 'properties' }
WaPopover >> for [

	^ self propertyAt: #for
]

{ #category : 'properties' }
WaPopover >> for: anObject [

	self propertyAt: #for put: anObject
]

{ #category : 'css custom properties' }
WaPopover >> hideDuration [

	^ self customPropertyAt: #'hide-duration'
]

{ #category : 'css custom properties' }
WaPopover >> hideDuration: aString [

	self customPropertyAt: #'hide-duration' put: aString
]

{ #category : 'css custom properties' }
WaPopover >> maxWidth [

	^ self customPropertyAt: #'max-width'
]

{ #category : 'css custom properties' }
WaPopover >> maxWidth: aString [

	self customPropertyAt: #'max-width' put: aString
]

{ #category : 'properties' }
WaPopover >> open [

	^ self propertyAt: #open
]

{ #category : 'properties' }
WaPopover >> open: aBoolean [

	self propertyAt: #open put: aBoolean
]

{ #category : 'properties' }
WaPopover >> openBeOff [

	self open: false
]

{ #category : 'properties' }
WaPopover >> openBeOn [

	self open: true
]

{ #category : 'properties' }
WaPopover >> openIsOff [

	^ (self propertyAt: #open) not
]

{ #category : 'properties' }
WaPopover >> openIsOn [

	^ self propertyAt: #open
]

{ #category : 'properties' }
WaPopover >> placement [

	^ self propertyAt: #placement
]

{ #category : 'properties' }
WaPopover >> placement: anObject [

	self propertyAt: #placement put: anObject
]

{ #category : 'properties' }
WaPopover >> placementBeBottom [

	self placement: #bottom
]

{ #category : 'properties' }
WaPopover >> placementBeBottomEnd [

	self placement: #'bottom end'
]

{ #category : 'properties' }
WaPopover >> placementBeBottomStart [

	self placement: #'bottom start'
]

{ #category : 'properties' }
WaPopover >> placementBeLeft [

	self placement: #left
]

{ #category : 'properties' }
WaPopover >> placementBeLeftEnd [

	self placement: #'left end'
]

{ #category : 'properties' }
WaPopover >> placementBeLeftStart [

	self placement: #'left start'
]

{ #category : 'properties' }
WaPopover >> placementBeRight [

	self placement: #right
]

{ #category : 'properties' }
WaPopover >> placementBeRightEnd [

	self placement: #'right end'
]

{ #category : 'properties' }
WaPopover >> placementBeRightStart [

	self placement: #'right start'
]

{ #category : 'properties' }
WaPopover >> placementBeTop [

	self placement: #top
]

{ #category : 'properties' }
WaPopover >> placementBeTopEnd [

	self placement: #'top end'
]

{ #category : 'properties' }
WaPopover >> placementBeTopStart [

	self placement: #'top start'
]

{ #category : 'css custom properties' }
WaPopover >> showDuration [

	^ self customPropertyAt: #'show-duration'
]

{ #category : 'css custom properties' }
WaPopover >> showDuration: aString [

	self customPropertyAt: #'show-duration' put: aString
]

{ #category : 'properties' }
WaPopover >> skidding [

	^ self propertyAt: #skidding
]

{ #category : 'properties' }
WaPopover >> skidding: anObject [

	self propertyAt: #skidding put: anObject
]

{ #category : 'properties' }
WaPopover >> withoutArrow [

	^ self propertyAt: #'without-arrow'
]

{ #category : 'properties' }
WaPopover >> withoutArrow: aBoolean [

	self propertyAt: #'without-arrow' put: aBoolean
]

{ #category : 'properties' }
WaPopover >> withoutArrowBeOff [

	self withoutArrow: false
]

{ #category : 'properties' }
WaPopover >> withoutArrowBeOn [

	self withoutArrow: true
]

{ #category : 'properties' }
WaPopover >> withoutArrowIsOff [

	^ (self propertyAt: #'without-arrow') not
]

{ #category : 'properties' }
WaPopover >> withoutArrowIsOn [

	^ self propertyAt: #'without-arrow'
]
