Class {
	#name : 'WaButtonOLD',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing' }
WaButtonOLD class >> label: aStringOrElement [

	^ self new
		label: aStringOrElement ;
		yourself
]

{ #category : 'accessing' }
WaButtonOLD class >> label: aStringOrElement end: endElement [

	^ self new
		label: aStringOrElement ;
		end: endElement ;
		yourself
]

{ #category : 'accessing' }
WaButtonOLD class >> start: anElement label: aStringOrElement [

	^ self new
		start: anElement ;
		label: aStringOrElement ;
		yourself
]

{ #category : 'accessing' }
WaButtonOLD class >> start: startElement label: aStringOrElement end: endElement [

	^ self new
		start: startElement ;
		label: aStringOrElement ;
		end: endElement ;
		yourself
]

{ #category : 'accessing style' }
WaButtonOLD >> beCircle [

	self circle: true
]

{ #category : 'accessing variant' }
WaButtonOLD >> beDanger [

	self variant: #danger
]

{ #category : 'accessing variant' }
WaButtonOLD >> beDefault [

	self variant: #default
]

{ #category : 'accessing style' }
WaButtonOLD >> beDisabled [

	self disabled: true
]

{ #category : 'accessing style' }
WaButtonOLD >> beEnabled [

	"Convenience method to make receiver enabled"

	self disabled: false
]

{ #category : 'accessing variant' }
WaButtonOLD >> beInfo [

	self variant: #info
]

{ #category : 'accessing size' }
WaButtonOLD >> beLarge [

	self size: #large
]

{ #category : 'accessing style' }
WaButtonOLD >> beLoading [

	self loading: true
]

{ #category : 'accessing size' }
WaButtonOLD >> beMedium [

	self size: #medium
]

{ #category : 'accessing variant' }
WaButtonOLD >> beNeutral [

	self variant: #neutral
]

{ #category : 'accessing style' }
WaButtonOLD >> beNotCircle [

	self circle: false
]

{ #category : 'accessing style' }
WaButtonOLD >> beNotDisabled [

	self disabled: false
]

{ #category : 'accessing style' }
WaButtonOLD >> beNotEnabled [

	"Convenience method to clear the enabled state of the receiver"

	self disabled: true
]

{ #category : 'accessing style' }
WaButtonOLD >> beNotLoading [

	self loading: false
]

{ #category : 'accessing style' }
WaButtonOLD >> beNotOutline [

	self outline: false
]

{ #category : 'accessing style' }
WaButtonOLD >> beNotPill [

	self pill: false
]

{ #category : 'accessing style' }
WaButtonOLD >> beOutline [

	self outline: true
]

{ #category : 'accessing style' }
WaButtonOLD >> bePill [

	self pill: true
]

{ #category : 'accessing variant' }
WaButtonOLD >> bePrimary [

	self variant: #primary
]

{ #category : 'accessing size' }
WaButtonOLD >> beSmall [

	self size: #small
]

{ #category : 'accessing variant' }
WaButtonOLD >> beSuccess [

	self variant: #success
]

{ #category : 'accessing variant' }
WaButtonOLD >> beText [

	self variant: #text
]

{ #category : 'accessing variant' }
WaButtonOLD >> beWarning [

	self variant: #warning
]

{ #category : 'accessing' }
WaButtonOLD >> circle: aBoolean [

	self propertyAt: #circle put: aBoolean
]

{ #category : 'copying' }
WaButtonOLD >> clone [

	"Deep clone the receiver.

	Implementation:
	Set the (non reflecting properties explicitly)."

	^ super clone
		link: self link ;
		target: self target ;
		download: self download ;
		yourself

]

{ #category : 'accessing' }
WaButtonOLD >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'accessing' }
WaButtonOLD >> download [

	^ self propertyAt: #download
]

{ #category : 'accessing' }
WaButtonOLD >> download: aString [

	self propertyAt: #download put: aString
]

{ #category : 'accessing' }
WaButtonOLD >> enabled: aBoolean [

	"Convenience method to set receiver's enabled state"

	self disabled: aBoolean not
]

{ #category : 'accessing' }
WaButtonOLD >> end [

	^ self firstChildAtSlotNamed: #end
]

{ #category : 'accessing' }
WaButtonOLD >> end: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #end
]

{ #category : 'testing' }
WaButtonOLD >> hasFocus [

	^ self = CpHtmlElement activeElement
]

{ #category : 'testing' }
WaButtonOLD >> isCircle [

	^ self propertyAt: #circle
]

{ #category : 'testing' }
WaButtonOLD >> isDisabled [

	^ self propertyAt: #disabled
]

{ #category : 'testing' }
WaButtonOLD >> isEnabled [

	"Convenience method to test if receiver is enabled"

	^ self isDisabled not
]

{ #category : 'testing' }
WaButtonOLD >> isLoading [

	^ self propertyAt: #loading
]

{ #category : 'testing' }
WaButtonOLD >> isOutline [

	^ self propertyAt: #outline
]

{ #category : 'testing' }
WaButtonOLD >> isPill [

	^ self propertyAt: #pill
]

{ #category : 'accessing' }
WaButtonOLD >> label [

	"Answer the label HTML element of the receiver.
	For a simple String value use #labelText instead."

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'accessing' }
WaButtonOLD >> label: aStringOrElement [

	"Set the label to the specified Element.
	For a simple String value use #labelText: instead."

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'accessing' }
WaButtonOLD >> labelText [

	"Answer the label text (a String) of the receiver.
	For richer HTML element use #label instead."

	^ self textContent
]

{ #category : 'accessing' }
WaButtonOLD >> labelText: aString [

	"Set the label text to the specified String value.
	For richer HTML element use #label: instead."

	self textContent: aString
]

{ #category : 'accessing' }
WaButtonOLD >> link [

	^ self propertyAt: #href
]

{ #category : 'accessing' }
WaButtonOLD >> link: aString [

	self propertyAt: #href put: aString
]

{ #category : 'accessing' }
WaButtonOLD >> link: linkString download: downloadString [

	self
		link: linkString ;
		download: downloadString
]

{ #category : 'accessing' }
WaButtonOLD >> link: linkString target: targetString [

	self
		link: linkString ;
		target: targetString
]

{ #category : 'accessing' }
WaButtonOLD >> loading: aBoolean [

	self propertyAt: #loading put: aBoolean
]

{ #category : 'accessing' }
WaButtonOLD >> outline: aBoolean [

	self propertyAt: #outline put: aBoolean
]

{ #category : 'accessing' }
WaButtonOLD >> pill: aBoolean [

	self propertyAt: #pill put: aBoolean
]

{ #category : 'accessing' }
WaButtonOLD >> size [

	^ self propertyAt: #size
]

{ #category : 'accessing' }
WaButtonOLD >> size: aString [

	self propertyAt: #size put: aString
]

{ #category : 'accessing' }
WaButtonOLD >> start [

	^ self firstChildAtSlotNamed: #start
]

{ #category : 'accessing' }
WaButtonOLD >> start: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #start
]

{ #category : 'accessing' }
WaButtonOLD >> suffix [

	^ self firstChildAtSlotNamed: #end
]

{ #category : 'accessing' }
WaButtonOLD >> suffix: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #end
]

{ #category : 'accessing' }
WaButtonOLD >> target [

	^ self propertyAt: #target
]

{ #category : 'accessing' }
WaButtonOLD >> target: aString [

	self propertyAt: #target put: aString
]

{ #category : 'accessing target' }
WaButtonOLD >> targetBlank [

	self target: #'_blank'
]

{ #category : 'accessing target' }
WaButtonOLD >> targetParent [

	self target: #'_parent'
]

{ #category : 'accessing target' }
WaButtonOLD >> targetSelf [

	self target: #'_self'
]

{ #category : 'accessing target' }
WaButtonOLD >> targetTop [

	self target: #'_top'
]

{ #category : 'accessing' }
WaButtonOLD >> variant [

	^ self propertyAt: #variant
]

{ #category : 'accessing' }
WaButtonOLD >> variant: aString [

	self propertyAt: #variant put: aString
]
