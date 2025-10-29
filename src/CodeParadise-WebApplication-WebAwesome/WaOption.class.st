Class {
	#name : 'WaOption',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'instance creation' }
WaOption class >> value: object1 label: object2 [ 

	^ self new 
		value: object1;
		label: object2;
		yourself
]

{ #category : 'instance creation' }
WaOption class >> value: object1 labelText: object2 [ 

	^ self new 
		value: object1;
		labelText: object2;
		yourself
]

{ #category : 'properties' }
WaOption >> disabled [

	^ self propertyAt: #disabled
]

{ #category : 'properties' }
WaOption >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'properties' }
WaOption >> disabledBeOff [

	self disabled: false
]

{ #category : 'properties' }
WaOption >> disabledBeOn [

	self disabled: true
]

{ #category : 'properties' }
WaOption >> disabledIsOff [

	^ (self propertyAt: #disabled) not
]

{ #category : 'properties' }
WaOption >> disabledIsOn [

	^ self propertyAt: #disabled
]

{ #category : 'slots' }
WaOption >> end [

	^ self firstChildAtSlotNamed: #end
]

{ #category : 'slots' }
WaOption >> end: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #end
]

{ #category : 'slots' }
WaOption >> label [

	^ self firstChildAtSlotNamed: #label
]

{ #category : 'slots' }
WaOption >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #label
]

{ #category : 'slots' }
WaOption >> labelText [

	^ self textContent
]

{ #category : 'slots' }
WaOption >> labelText: aString [

	self textContent: aString
]

{ #category : 'properties' }
WaOption >> selected [

	^ self propertyAt: #selected
]

{ #category : 'properties' }
WaOption >> selected: aBoolean [

	self propertyAt: #selected put: aBoolean
]

{ #category : 'properties' }
WaOption >> selectedBeOff [

	self selected: false
]

{ #category : 'properties' }
WaOption >> selectedBeOn [

	self selected: true
]

{ #category : 'properties' }
WaOption >> selectedIsOff [

	^ (self propertyAt: #selected) not
]

{ #category : 'properties' }
WaOption >> selectedIsOn [

	^ self propertyAt: #selected
]

{ #category : 'slots' }
WaOption >> start [

	^ self firstChildAtSlotNamed: #start
]

{ #category : 'slots' }
WaOption >> start: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #start
]

{ #category : 'properties' }
WaOption >> value [

	^ self propertyAt: #value
]

{ #category : 'properties' }
WaOption >> value: anObject [

	self propertyAt: #value put: anObject
]
