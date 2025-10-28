Class {
	#name : 'WaDropdown',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'properties' }
WaDropdown >> distance [

	^ self propertyAt: #distance
]

{ #category : 'properties' }
WaDropdown >> distance: anObject [

	self propertyAt: #distance put: anObject
]

{ #category : 'css custom properties' }
WaDropdown >> hideDuration [

	^ self customPropertyAt: #'hide-duration'
]

{ #category : 'css custom properties' }
WaDropdown >> hideDuration: aString [

	self customPropertyAt: #'hide-duration' put: aString
]

{ #category : 'properties' }
WaDropdown >> open [

	self propertyAt: #open
]

{ #category : 'properties' }
WaDropdown >> open: aBoolean [

	self propertyAt: #open put: aBoolean
]

{ #category : 'properties' }
WaDropdown >> openBeOff [

	self open: false
]

{ #category : 'properties' }
WaDropdown >> openBeOn [

	self open: true
]

{ #category : 'properties' }
WaDropdown >> openIsOff [

	^ (self propertyAt: #open) not
]

{ #category : 'properties' }
WaDropdown >> openIsOn [

	^ self propertyAt: #open
]

{ #category : 'properties' }
WaDropdown >> placement [

	^ self propertyAt: #placement
]

{ #category : 'properties' }
WaDropdown >> placement: anObject [

	self propertyAt: #placement put: anObject
]

{ #category : 'properties' }
WaDropdown >> placementBeBottom [

	self placement: #bottom
]

{ #category : 'properties' }
WaDropdown >> placementBeBottomEnd [

	self placement: #'bottom end'
]

{ #category : 'properties' }
WaDropdown >> placementBeBottomStart [

	self placement: #'bottom start'
]

{ #category : 'properties' }
WaDropdown >> placementBeLeft [

	self placement: #left
]

{ #category : 'properties' }
WaDropdown >> placementBeLeftEnd [

	self placement: #'left end'
]

{ #category : 'properties' }
WaDropdown >> placementBeLeftStart [

	self placement: #'left start'
]

{ #category : 'properties' }
WaDropdown >> placementBeRight [

	self placement: #right
]

{ #category : 'properties' }
WaDropdown >> placementBeRightEnd [

	self placement: #'right end'
]

{ #category : 'properties' }
WaDropdown >> placementBeRightStart [

	self placement: #'right start'
]

{ #category : 'properties' }
WaDropdown >> placementBeTop [

	self placement: #top
]

{ #category : 'properties' }
WaDropdown >> placementBeTopEnd [

	self placement: #'top end'
]

{ #category : 'properties' }
WaDropdown >> placementBeTopStart [

	self placement: #'top start'
]

{ #category : 'css custom properties' }
WaDropdown >> showDuration [

	^ self customPropertyAt: #'show-duration'
]

{ #category : 'css custom properties' }
WaDropdown >> showDuration: aString [

	self customPropertyAt: #'show-duration' put: aString
]

{ #category : 'properties' }
WaDropdown >> size [

	^ self propertyAt: #size
]

{ #category : 'properties' }
WaDropdown >> size: anObject [

	self propertyAt: #size put: anObject
]

{ #category : 'properties' }
WaDropdown >> sizeBeLarge [

	self size: #large
]

{ #category : 'properties' }
WaDropdown >> sizeBeMedium [

	self size: #medium
]

{ #category : 'properties' }
WaDropdown >> sizeBeSmall [

	self size: #small
]

{ #category : 'properties' }
WaDropdown >> skidding [

	^ self propertyAt: #skidding
]

{ #category : 'properties' }
WaDropdown >> skidding: anObject [

	self propertyAt: #skidding put: anObject
]

{ #category : 'slots' }
WaDropdown >> trigger [

	^ self firstChildAtSlotNamed: #trigger
]

{ #category : 'slots' }
WaDropdown >> trigger: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #trigger
]
