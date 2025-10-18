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

{ #category : 'accessing property' }
WaButton >> appearance [

	^ self propertyAt: #appearance
]

{ #category : 'accessing property' }
WaButton >> appearance: anObject [

	self propertyAt: #appearance put: anObject
]

{ #category : 'accessing property' }
WaButton >> appearanceBeAccent [

	self appearance: 'accent'
]

{ #category : 'accessing property' }
WaButton >> appearanceBeFilled [

	self appearance: 'filled'
]

{ #category : 'accessing property' }
WaButton >> appearanceBeOutlined [

	self appearance: 'outlined'
]

{ #category : 'accessing property' }
WaButton >> appearanceBePlain [

	self appearance: 'plain'
]

{ #category : 'accessing attribute' }
WaButton >> disabled [

	^ (self attributeAt: #disabled) notNil
]

{ #category : 'accessing attribute' }
WaButton >> disabled: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #disabled ]
		ifFalse: [ self removeAttributeAt: #disabled ]
]

{ #category : 'accessing property' }
WaButton >> download [

	^ self propertyAt: #download
]

{ #category : 'accessing property' }
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

{ #category : 'accessing property' }
WaButton >> form [

	^ self propertyAt: #form
]

{ #category : 'accessing property' }
WaButton >> form: anObject [

	self propertyAt: #form put: anObject
]

{ #category : 'accessing property' }
WaButton >> formaction [

	^ self propertyAt: #formaction
]

{ #category : 'accessing property' }
WaButton >> formaction: anObject [

	self propertyAt: #formaction put: anObject
]

{ #category : 'accessing property' }
WaButton >> formenctype [

	^ self propertyAt: #formenctype
]

{ #category : 'accessing property' }
WaButton >> formenctype: anObject [

	self propertyAt: #formenctype put: anObject
]

{ #category : 'accessing property' }
WaButton >> formmethod [

	^ self propertyAt: #formmethod
]

{ #category : 'accessing property' }
WaButton >> formmethod: anObject [

	self propertyAt: #formmethod put: anObject
]

{ #category : 'accessing attribute' }
WaButton >> formnovalidate [

	^ (self attributeAt: #formnovalidate) notNil
]

{ #category : 'accessing attribute' }
WaButton >> formnovalidate: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #formnovalidate ]
		ifFalse: [ self removeAttributeAt: #formnovalidate ]
]

{ #category : 'accessing property' }
WaButton >> formtarget [

	^ self propertyAt: #formtarget
]

{ #category : 'accessing property' }
WaButton >> formtarget: anObject [

	self propertyAt: #formtarget put: anObject
]

{ #category : 'accessing property' }
WaButton >> href [

	^ self propertyAt: #href
]

{ #category : 'accessing property' }
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

{ #category : 'accessing attribute' }
WaButton >> loading [

	^ (self attributeAt: #loading) notNil
]

{ #category : 'accessing attribute' }
WaButton >> loading: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #loading ]
		ifFalse: [ self removeAttributeAt: #loading ]
]

{ #category : 'accessing property' }
WaButton >> name [

	^ self propertyAt: #name
]

{ #category : 'accessing property' }
WaButton >> name: anObject [

	self propertyAt: #name put: anObject
]

{ #category : 'accessing attribute' }
WaButton >> pill [

	^ (self attributeAt: #pill) notNil
]

{ #category : 'accessing attribute' }
WaButton >> pill: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #pill ]
		ifFalse: [ self removeAttributeAt: #pill ]
]

{ #category : 'accessing property' }
WaButton >> rel [

	^ self propertyAt: #rel
]

{ #category : 'accessing property' }
WaButton >> rel: anObject [

	self propertyAt: #rel put: anObject
]

{ #category : 'accessing property' }
WaButton >> size [

	^ self propertyAt: #size
]

{ #category : 'accessing property' }
WaButton >> size: anObject [

	self propertyAt: #size put: anObject
]

{ #category : 'accessing property' }
WaButton >> sizeBeLarge [

	self size: 'large'
]

{ #category : 'accessing property' }
WaButton >> sizeBeMedium [

	self size: 'medium'
]

{ #category : 'accessing property' }
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

{ #category : 'accessing property' }
WaButton >> target [

	^ self propertyAt: #target
]

{ #category : 'accessing property' }
WaButton >> target: anObject [

	self propertyAt: #target put: anObject
]

{ #category : 'accessing property' }
WaButton >> type [

	^ self propertyAt: #type
]

{ #category : 'accessing property' }
WaButton >> type: anObject [

	self propertyAt: #type put: anObject
]

{ #category : 'accessing property' }
WaButton >> typeBeButton [

	self type: 'button'
]

{ #category : 'accessing property' }
WaButton >> typeBeReset [

	self type: 'reset'
]

{ #category : 'accessing property' }
WaButton >> typeBeSubmit [

	self type: 'submit'
]

{ #category : 'accessing property' }
WaButton >> value [

	^ self propertyAt: #value
]

{ #category : 'accessing property' }
WaButton >> value: anObject [

	self propertyAt: #value put: anObject
]

{ #category : 'accessing property' }
WaButton >> variant [

	^ self propertyAt: #variant
]

{ #category : 'accessing property' }
WaButton >> variant: anObject [

	self propertyAt: #variant put: anObject
]

{ #category : 'accessing property' }
WaButton >> variantBeBrand [

	self variant: 'brand'
]

{ #category : 'accessing property' }
WaButton >> variantBeDanger [

	self variant: 'danger'
]

{ #category : 'accessing property' }
WaButton >> variantBeNeutral [

	self variant: 'neutral'
]

{ #category : 'accessing property' }
WaButton >> variantBeSuccess [

	self variant: 'success'
]

{ #category : 'accessing property' }
WaButton >> variantBeWarning [

	self variant: 'warning'
]

{ #category : 'accessing attribute' }
WaButton >> withCaret [

	^ (self attributeAt: #'with-caret') notNil
]

{ #category : 'accessing attribute' }
WaButton >> withCaret: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #'with-caret' ]
		ifFalse: [ self removeAttributeAt: #'with-caret' ]
]
