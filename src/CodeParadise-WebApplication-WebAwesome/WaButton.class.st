Class {
	#name : 'WaButton',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing' }
WaButton class >> label: aStringOrElement [

	^ self new
		label: aStringOrElement ;
		yourself
]

{ #category : 'accessing' }
WaButton class >> label: aStringOrElement end: endElement [

	^ self new
		label: aStringOrElement ;
		end: endElement ;
		yourself
]

{ #category : 'properties' }
WaButton >> appearance [

	^ self propertyAt: #appearance
]

{ #category : 'properties' }
WaButton >> appearance: anObject [

	self propertyAt: #appearance put: anObject
]

{ #category : 'properties' }
WaButton >> appearanceBeAccent [

	self appearance: #accent
]

{ #category : 'properties' }
WaButton >> appearanceBeFilled [

	self appearance: #filled
]

{ #category : 'properties' }
WaButton >> appearanceBeOutlined [

	self appearance: #outlined
]

{ #category : 'properties' }
WaButton >> appearanceBePlain [

	self appearance: #plain
]

{ #category : 'properties' }
WaButton >> disabled [

	^ (self attributeAt: #disabled) notNil
]

{ #category : 'properties' }
WaButton >> disabled: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #disabled ]
		ifFalse: [ self removeAttributeAt: #disabled ]
]

{ #category : 'properties' }
WaButton >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaButton >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaButton >> download [

	^ self propertyAt: #download
]

{ #category : 'properties' }
WaButton >> download: anObject [

	self propertyAt: #download put: anObject
]

{ #category : 'slots' }
WaButton >> end [

	^ self firstChildAtSlotNamed: #end
]

{ #category : 'slots' }
WaButton >> end: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #end
]

{ #category : 'properties' }
WaButton >> form [

	^ self propertyAt: #form
]

{ #category : 'properties' }
WaButton >> form: anObject [

	self propertyAt: #form put: anObject
]

{ #category : 'properties' }
WaButton >> formaction [

	^ self propertyAt: #formaction
]

{ #category : 'properties' }
WaButton >> formaction: anObject [

	self propertyAt: #formaction put: anObject
]

{ #category : 'properties' }
WaButton >> formenctype [

	^ self propertyAt: #formenctype
]

{ #category : 'properties' }
WaButton >> formenctype: anObject [

	self propertyAt: #formenctype put: anObject
]

{ #category : 'properties' }
WaButton >> formmethod [

	^ self propertyAt: #formmethod
]

{ #category : 'properties' }
WaButton >> formmethod: anObject [

	self propertyAt: #formmethod put: anObject
]

{ #category : 'properties' }
WaButton >> formnovalidate [

	^ (self attributeAt: #formnovalidate) notNil
]

{ #category : 'properties' }
WaButton >> formnovalidate: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #formnovalidate ]
		ifFalse: [ self removeAttributeAt: #formnovalidate ]
]

{ #category : 'properties' }
WaButton >> formnovalidateBeOff [

	self formnovalidate: false
]

{ #category : 'properties' }
WaButton >> formnovalidateBeOn [

	self formnovalidate: true
]

{ #category : 'properties' }
WaButton >> formtarget [

	^ self propertyAt: #formtarget
]

{ #category : 'properties' }
WaButton >> formtarget: anObject [

	self propertyAt: #formtarget put: anObject
]

{ #category : 'properties' }
WaButton >> href [

	^ self propertyAt: #href
]

{ #category : 'properties' }
WaButton >> href: anObject [

	self propertyAt: #href put: anObject
]

{ #category : 'slots' }
WaButton >> label [

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'slots' }
WaButton >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'properties' }
WaButton >> loading [

	^ (self attributeAt: #loading) notNil
]

{ #category : 'properties' }
WaButton >> loading: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #loading ]
		ifFalse: [ self removeAttributeAt: #loading ]
]

{ #category : 'properties' }
WaButton >> loadingBeOff [

	self loading: false
]

{ #category : 'properties' }
WaButton >> loadingBeOn [

	self loading: true
]

{ #category : 'properties' }
WaButton >> name [

	^ self propertyAt: #name
]

{ #category : 'properties' }
WaButton >> name: anObject [

	self propertyAt: #name put: anObject
]

{ #category : 'properties' }
WaButton >> pill [

	^ (self attributeAt: #pill) notNil
]

{ #category : 'properties' }
WaButton >> pill: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #pill ]
		ifFalse: [ self removeAttributeAt: #pill ]
]

{ #category : 'properties' }
WaButton >> pillBeOff [

	self pill: false
]

{ #category : 'properties' }
WaButton >> pillBeOn [

	self pill: true
]

{ #category : 'properties' }
WaButton >> rel [

	^ self propertyAt: #rel
]

{ #category : 'properties' }
WaButton >> rel: anObject [

	self propertyAt: #rel put: anObject
]

{ #category : 'properties' }
WaButton >> size [

	^ self propertyAt: #size
]

{ #category : 'properties' }
WaButton >> size: anObject [

	self propertyAt: #size put: anObject
]

{ #category : 'properties' }
WaButton >> sizeBeLarge [

	self size: #large
]

{ #category : 'properties' }
WaButton >> sizeBeMedium [

	self size: #medium
]

{ #category : 'properties' }
WaButton >> sizeBeSmall [

	self size: #small
]

{ #category : 'slots' }
WaButton >> start [

	^ self firstChildAtSlotNamed: #start
]

{ #category : 'slots' }
WaButton >> start: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #start
]

{ #category : 'properties' }
WaButton >> target [

	^ self propertyAt: #target
]

{ #category : 'properties' }
WaButton >> target: anObject [

	self propertyAt: #target put: anObject
]

{ #category : 'properties' }
WaButton >> type [

	^ self propertyAt: #type
]

{ #category : 'properties' }
WaButton >> type: anObject [

	self propertyAt: #type put: anObject
]

{ #category : 'properties' }
WaButton >> typeBeButton [

	self type: #button
]

{ #category : 'properties' }
WaButton >> typeBeReset [

	self type: #reset
]

{ #category : 'properties' }
WaButton >> typeBeSubmit [

	self type: #submit
]

{ #category : 'properties' }
WaButton >> value [

	^ self propertyAt: #value
]

{ #category : 'properties' }
WaButton >> value: anObject [

	self propertyAt: #value put: anObject
]

{ #category : 'properties' }
WaButton >> variant [

	^ self propertyAt: #variant
]

{ #category : 'properties' }
WaButton >> variant: anObject [

	self propertyAt: #variant put: anObject
]

{ #category : 'properties' }
WaButton >> variantBeBrand [

	self variant: #brand
]

{ #category : 'properties' }
WaButton >> variantBeDanger [

	self variant: #danger
]

{ #category : 'properties' }
WaButton >> variantBeNeutral [

	self variant: #neutral
]

{ #category : 'properties' }
WaButton >> variantBeSuccess [

	self variant: #success
]

{ #category : 'properties' }
WaButton >> variantBeWarning [

	self variant: #warning
]

{ #category : 'properties' }
WaButton >> withCaret [

	^ (self attributeAt: #'with-caret') notNil
]

{ #category : 'properties' }
WaButton >> withCaret: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'with-caret' ]
		ifFalse: [ self removeAttributeAt: #'with-caret' ]
]

{ #category : 'properties' }
WaButton >> withCaretBeOff [

	self withCaret: false
]

{ #category : 'properties' }
WaButton >> withCaretBeOn [

	self withCaret: true
]
