Class {
	#name : 'WaTest',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing attribute' }
WaTest >> attr1 [

	^ (self attributeAt: #attr1) notNil
]

{ #category : 'accessing attribute' }
WaTest >> attr1: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #attr1 ]
		ifFalse: [ self removeAttributeAt: #attr1 ]
]

{ #category : 'accessing attribute' }
WaTest >> attr2 [

	^ (self attributeAt: #attr2) notNil
]

{ #category : 'accessing attribute' }
WaTest >> attr2: aBoolean [

	aBoolean
		ifTrue: [ self attributeAdd: #attr2 ]
		ifFalse: [ self removeAttributeAt: #attr2 ]
]

{ #category : 'accessing css property' }
WaTest >> css1 [

	^ self customPropertyAt: #css1
]

{ #category : 'accessing css property' }
WaTest >> css1: aString [

	self customPropertyAt: #css1 put: aString
]

{ #category : 'accessing css property' }
WaTest >> css2 [

	^ self customPropertyAt: #css2
]

{ #category : 'accessing css property' }
WaTest >> css2: aString [

	self customPropertyAt: #css2 put: aString
]

{ #category : 'accessing property' }
WaTest >> prop1 [

	^ self propertyAt: #prop1
]

{ #category : 'accessing property' }
WaTest >> prop1: anObject [

	self propertyAt: #prop1 put: anObject
]

{ #category : 'accessing property' }
WaTest >> prop1BeTodo [

	self prop1: 'todo'
]

{ #category : 'accessing property' }
WaTest >> prop1Todo [

	self prop1: 'todo'
]

{ #category : 'accessing property' }
WaTest >> prop2 [

	^ self propertyAt: #prop2
]

{ #category : 'accessing property' }
WaTest >> prop2: anObject [

	self propertyAt: #prop2 put: anObject
]

{ #category : 'accessing property' }
WaTest >> prop2BeTodo [

	self prop2: 'todo'
]

{ #category : 'accessing property' }
WaTest >> prop2Todo [

	self prop2: 'todo'
]

{ #category : 'accessing slot' }
WaTest >> slot1 [

	^ self firstChildAtSlotNamed: #slot1
]

{ #category : 'accessing slot' }
WaTest >> slot1: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #slot1
]

{ #category : 'accessing slot' }
WaTest >> slot2 [

	^ self firstChildAtSlotNamed: #slot2
]

{ #category : 'accessing slot' }
WaTest >> slot2: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #slot2
]
