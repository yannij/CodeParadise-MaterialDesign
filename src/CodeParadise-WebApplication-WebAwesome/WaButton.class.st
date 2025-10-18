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

{ #category : 'accessing string' }
WaButton >> appearance [

	^ self propertyAt: #appearance
]

{ #category : 'accessing string' }
WaButton >> appearance: anObject [

	self propertyAt: #appearance put: anObject
]

{ #category : 'accessing string' }
WaButton >> appearanceBeAccent [

	self appearance: 'accent'
]

{ #category : 'accessing string' }
WaButton >> appearanceBeFilled [

	self appearance: 'filled'
]

{ #category : 'accessing string' }
WaButton >> appearanceBeOutlined [

	self appearance: 'outlined'
]

{ #category : 'accessing string' }
WaButton >> appearanceBePlain [

	self appearance: 'plain'
]

{ #category : 'accessing boolean' }
WaButton >> disabled [

	^ (self attributeAt: #disabled) notNil
]

{ #category : 'accessing boolean' }
WaButton >> disabled: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #disabled ]
		ifFalse: [ self removeAttributeAt: #disabled ]
]

{ #category : 'accessing boolean' }
WaButton >> disabledBeOff [

	self disabled: false
]

{ #category : 'accessing boolean' }
WaButton >> disabledBeOn [

	self disabled: true
]

{ #category : 'accessing string' }
WaButton >> download [

	^ self propertyAt: #download
]

{ #category : 'accessing string' }
WaButton >> download: anObject [

	self propertyAt: #download put: anObject
]

{ #category : 'accessing slot' }
WaButton >> end [

	^ self firstChildAtSlotNamed: #end
]

{ #category : 'accessing slot' }
WaButton >> end: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #end
]

{ #category : 'accessing string' }
WaButton >> form [

	^ self propertyAt: #form
]

{ #category : 'accessing string' }
WaButton >> form: anObject [

	self propertyAt: #form put: anObject
]

{ #category : 'accessing string' }
WaButton >> formaction [

	^ self propertyAt: #formaction
]

{ #category : 'accessing string' }
WaButton >> formaction: anObject [

	self propertyAt: #formaction put: anObject
]

{ #category : 'accessing string' }
WaButton >> formenctype [

	^ self propertyAt: #formenctype
]

{ #category : 'accessing string' }
WaButton >> formenctype: anObject [

	self propertyAt: #formenctype put: anObject
]

{ #category : 'accessing string' }
WaButton >> formmethod [

	^ self propertyAt: #formmethod
]

{ #category : 'accessing string' }
WaButton >> formmethod: anObject [

	self propertyAt: #formmethod put: anObject
]

{ #category : 'accessing boolean' }
WaButton >> formnovalidate [

	^ (self attributeAt: #formnovalidate) notNil
]

{ #category : 'accessing boolean' }
WaButton >> formnovalidate: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #formnovalidate ]
		ifFalse: [ self removeAttributeAt: #formnovalidate ]
]

{ #category : 'accessing boolean' }
WaButton >> formnovalidateBeOff [

	self formnovalidate: false
]

{ #category : 'accessing boolean' }
WaButton >> formnovalidateBeOn [

	self formnovalidate: true
]

{ #category : 'accessing string' }
WaButton >> formtarget [

	^ self propertyAt: #formtarget
]

{ #category : 'accessing string' }
WaButton >> formtarget: anObject [

	self propertyAt: #formtarget put: anObject
]

{ #category : 'accessing string' }
WaButton >> href [

	^ self propertyAt: #href
]

{ #category : 'accessing string' }
WaButton >> href: anObject [

	self propertyAt: #href put: anObject
]

{ #category : 'accessing slot' }
WaButton >> label [

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'accessing slot' }
WaButton >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'accessing boolean' }
WaButton >> loading [

	^ (self attributeAt: #loading) notNil
]

{ #category : 'accessing boolean' }
WaButton >> loading: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #loading ]
		ifFalse: [ self removeAttributeAt: #loading ]
]

{ #category : 'accessing boolean' }
WaButton >> loadingBeOff [

	self loading: false
]

{ #category : 'accessing boolean' }
WaButton >> loadingBeOn [

	self loading: true
]

{ #category : 'accessing string' }
WaButton >> name [

	^ self propertyAt: #name
]

{ #category : 'accessing string' }
WaButton >> name: anObject [

	self propertyAt: #name put: anObject
]

{ #category : 'accessing boolean' }
WaButton >> pill [

	^ (self attributeAt: #pill) notNil
]

{ #category : 'accessing boolean' }
WaButton >> pill: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #pill ]
		ifFalse: [ self removeAttributeAt: #pill ]
]

{ #category : 'accessing boolean' }
WaButton >> pillBeOff [

	self pill: false
]

{ #category : 'accessing boolean' }
WaButton >> pillBeOn [

	self pill: true
]

{ #category : 'accessing string' }
WaButton >> rel [

	^ self propertyAt: #rel
]

{ #category : 'accessing string' }
WaButton >> rel: anObject [

	self propertyAt: #rel put: anObject
]

{ #category : 'accessing string' }
WaButton >> size [

	^ self propertyAt: #size
]

{ #category : 'accessing string' }
WaButton >> size: anObject [

	self propertyAt: #size put: anObject
]

{ #category : 'accessing string' }
WaButton >> sizeBeLarge [

	self size: 'large'
]

{ #category : 'accessing string' }
WaButton >> sizeBeMedium [

	self size: 'medium'
]

{ #category : 'accessing string' }
WaButton >> sizeBeSmall [

	self size: 'small'
]

{ #category : 'accessing slot' }
WaButton >> start [

	^ self firstChildAtSlotNamed: #start
]

{ #category : 'accessing slot' }
WaButton >> start: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #start
]

{ #category : 'accessing string' }
WaButton >> target [

	^ self propertyAt: #target
]

{ #category : 'accessing string' }
WaButton >> target: anObject [

	self propertyAt: #target put: anObject
]

{ #category : 'accessing string' }
WaButton >> type [

	^ self propertyAt: #type
]

{ #category : 'accessing string' }
WaButton >> type: anObject [

	self propertyAt: #type put: anObject
]

{ #category : 'accessing string' }
WaButton >> typeBeButton [

	self type: 'button'
]

{ #category : 'accessing string' }
WaButton >> typeBeReset [

	self type: 'reset'
]

{ #category : 'accessing string' }
WaButton >> typeBeSubmit [

	self type: 'submit'
]

{ #category : 'accessing string' }
WaButton >> value [

	^ self propertyAt: #value
]

{ #category : 'accessing string' }
WaButton >> value: anObject [

	self propertyAt: #value put: anObject
]

{ #category : 'accessing string' }
WaButton >> variant [

	^ self propertyAt: #variant
]

{ #category : 'accessing string' }
WaButton >> variant: anObject [

	self propertyAt: #variant put: anObject
]

{ #category : 'accessing string' }
WaButton >> variantBeBrand [

	self variant: 'brand'
]

{ #category : 'accessing string' }
WaButton >> variantBeDanger [

	self variant: 'danger'
]

{ #category : 'accessing string' }
WaButton >> variantBeNeutral [

	self variant: 'neutral'
]

{ #category : 'accessing string' }
WaButton >> variantBeSuccess [

	self variant: 'success'
]

{ #category : 'accessing string' }
WaButton >> variantBeWarning [

	self variant: 'warning'
]

{ #category : 'accessing boolean' }
WaButton >> withCaret [

	^ (self attributeAt: #'with-caret') notNil
]

{ #category : 'accessing boolean' }
WaButton >> withCaret: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'with-caret' ]
		ifFalse: [ self removeAttributeAt: #'with-caret' ]
]

{ #category : 'accessing boolean' }
WaButton >> withCaretBeOff [

	self withCaret: false
]

{ #category : 'accessing boolean' }
WaButton >> withCaretBeOn [

	self withCaret: true
]
