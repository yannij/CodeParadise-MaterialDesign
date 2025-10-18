Class {
	#name : 'WaDropdown',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing style' }
WaDropdown >> beDisabled [

	self disabled: true
]

{ #category : 'accessing style' }
WaDropdown >> beEnabled [

	"Convenience method to make receiver enabled"

	self disabled: false
]

{ #category : 'accessing style' }
WaDropdown >> beHoist [

	self hoist: true
]

{ #category : 'accessing style' }
WaDropdown >> beOpen [

	self open: true
]

{ #category : 'accessing style' }
WaDropdown >> beStayOpenOnSelect [

	self stayOpenOnSelect: true
]

{ #category : 'copying' }
WaDropdown >> clone [

	"Deep clone the receiver.

	Implementation:
	Set the (non reflecting properties explicitly)."

	^ super clone
		disabled: self isDisabled ;
		distance: self distance ;
		skidding: self skidding ;
		hoist: self isHoist ;
		yourself

]

{ #category : 'accessing' }
WaDropdown >> containingElement [

	^ self propertyAt: #containingElement
]

{ #category : 'accessing' }
WaDropdown >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'accessing' }
WaDropdown >> distance [

	^ self propertyAt: #distance
]

{ #category : 'accessing' }
WaDropdown >> distance: aNumber [

	self propertyAt: #distance put: aNumber
]

{ #category : 'accessing' }
WaDropdown >> enabled: aBoolean [

	"Convenience method to set receiver's enabled state"

	self disabled: aBoolean not
]

{ #category : 'accessing' }
WaDropdown >> hoist: aBoolean [

	self propertyAt: #hoist put: aBoolean
]

{ #category : 'testing' }
WaDropdown >> isDisabled [

	^ self propertyAt: #disabled
]

{ #category : 'testing' }
WaDropdown >> isEnabled [

	"Convenience method to test if receiver is enabled"

	^ self isDisabled not
]

{ #category : 'testing' }
WaDropdown >> isHoist [

	^ self propertyAt: #hoist
]

{ #category : 'testing' }
WaDropdown >> isOpen [

	^ self propertyAt: #open
]

{ #category : 'testing' }
WaDropdown >> isStayOpenOnSelect [

	^ self propertyAt: #stayOpenOnSelect
]

{ #category : 'accessing' }
WaDropdown >> open: aBoolean [

	self propertyAt: #open put: aBoolean
]

{ #category : 'accessing' }
WaDropdown >> placement [

	^ self propertyAt: #placement
]

{ #category : 'accessing' }
WaDropdown >> placement: aString [

	self propertyAt: #placement put: aString
]

{ #category : 'accessing placement' }
WaDropdown >> placementBottom [

	self placement: #bottom
]

{ #category : 'accessing placement' }
WaDropdown >> placementBottomEnd [

	self placement: #'bottom-end'
]

{ #category : 'accessing placement' }
WaDropdown >> placementBottomStart [

	self placement: #'bottom-start'
]

{ #category : 'accessing placement' }
WaDropdown >> placementLeft [

	self placement: #'left'
]

{ #category : 'accessing placement' }
WaDropdown >> placementLeftEnd [

	self placement: #'left-end'
]

{ #category : 'accessing placement' }
WaDropdown >> placementLeftStart [

	self placement: #'left-start'
]

{ #category : 'accessing placement' }
WaDropdown >> placementRight [

	self placement: #'right'
]

{ #category : 'accessing placement' }
WaDropdown >> placementRightEnd [

	self placement: #'right-end'
]

{ #category : 'accessing placement' }
WaDropdown >> placementRightStart [

	self placement: #'right-start'
]

{ #category : 'accessing placement' }
WaDropdown >> placementTop [

	self placement: #top
]

{ #category : 'accessing placement' }
WaDropdown >> placementTopEnd [

	self placement: #'top-end'
]

{ #category : 'accessing placement' }
WaDropdown >> placementTopStart [

	self placement: #'top-start'
]

{ #category : 'accessing' }
WaDropdown >> skidding [

	^ self propertyAt: #skidding
]

{ #category : 'accessing' }
WaDropdown >> skidding: aNumber [

	self propertyAt: #skidding put: aNumber
]

{ #category : 'accessing' }
WaDropdown >> stayOpenOnSelect: aBoolean [

	self propertyAt: #stayOpenOnSelect put: aBoolean
]
