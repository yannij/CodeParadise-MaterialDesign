Class {
	#name : 'WaInput',
	#superclass : 'WaTextControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing style' }
WaInput >> beClearable [

	self clearable: true
]

{ #category : 'accessing type' }
WaInput >> beDate [

	"Causes a popup date selector, however the date type might not be supported on all browsers"
	
	self type: #date
]

{ #category : 'accessing type' }
WaInput >> beEmail [

	self type: #email
]

{ #category : 'accessing style' }
WaInput >> beNotClearable [

	self clearable: false
]

{ #category : 'accessing style' }
WaInput >> beNotPill [

	self pill: false
]

{ #category : 'accessing style' }
WaInput >> beNotTogglePassword [

	self togglePassword: false
]

{ #category : 'accessing type' }
WaInput >> beNumber [

	self type: #number
]

{ #category : 'accessing type' }
WaInput >> bePassword [

	self type: #password
]

{ #category : 'accessing style' }
WaInput >> bePill [

	self pill: true
]

{ #category : 'accessing type' }
WaInput >> beSearch [

	self type: #search
]

{ #category : 'accessing type' }
WaInput >> beTel [

	self type: #tel
]

{ #category : 'accessing type' }
WaInput >> beText [

	self type: #text
]

{ #category : 'accessing style' }
WaInput >> beTogglePassword [

	self togglePassword: true
]

{ #category : 'accessing type' }
WaInput >> beUrl [

	self type: #url
]

{ #category : 'accessing' }
WaInput >> clearIcon [

	self firstChildAtSlotNamed: #'clear-icon'
]

{ #category : 'accessing' }
WaInput >> clearIcon: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #'clear-icon'
]

{ #category : 'accessing' }
WaInput >> clearable: aBoolean [

	self propertyAt: #clearable put: aBoolean
]

{ #category : 'accessing' }
WaInput >> clone [

	"Deep clone the receiver.

	Implementation:
	Set the (non reflecting properties explicitly)."

	self flag: #todo. "This list is incomplete. Question raised on GitHub wrt reflective propeties: https://github.com/shoelace-style/shoelace/discussions/741"

	^ super clone
		placeholder: self placeholder ;
		clearable: self isClearable ;
		yourself

]

{ #category : 'accessing' }
WaInput >> end [

	^ self firstChildAtSlotNamed: #end
]

{ #category : 'accessing' }
WaInput >> end: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #end
]

{ #category : 'accessing' }
WaInput >> hidePasswordIcon [

	self firstChildAtSlotNamed: #'hide-password-icon'
]

{ #category : 'accessing' }
WaInput >> hidePasswordIcon: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #'hide-password-icon'
]

{ #category : 'testing' }
WaInput >> isClearable [

	^ self propertyAt: #clearable
]

{ #category : 'testing' }
WaInput >> isPill [

	^ self propertyAt: #pill
]

{ #category : 'testing' }
WaInput >> isTogglePassword [

	^ self propertyAt: #togglePassword
]

{ #category : 'accessing' }
WaInput >> max [

	^ self propertyAt: #max
]

{ #category : 'accessing' }
WaInput >> max: aNumberOrString [

	self propertyAt: #max put: aNumberOrString
]

{ #category : 'accessing' }
WaInput >> min [

	^ self propertyAt: #min
]

{ #category : 'accessing' }
WaInput >> min: aNumberOrString [

	self propertyAt: #min put: aNumberOrString
]

{ #category : 'accessing' }
WaInput >> pill: aBoolean [

	self propertyAt: #pill put: aBoolean
]

{ #category : 'accessing' }
WaInput >> showPasswordIcon [

	self firstChildAtSlotNamed: #'show-password-icon'
]

{ #category : 'accessing' }
WaInput >> showPasswordIcon: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #'show-password-icon'
]

{ #category : 'accessing' }
WaInput >> start [

	^ self firstChildAtSlotNamed: #start
]

{ #category : 'accessing' }
WaInput >> start: anElement [

	self replaceAllChildrenWith: anElement atSlotNamed: #start
]

{ #category : 'accessing' }
WaInput >> step [

	^ self propertyAt: #step
]

{ #category : 'accessing' }
WaInput >> step: aNumber [

	self propertyAt: #step put: aNumber
]

{ #category : 'accessing' }
WaInput >> togglePassword: aBoolean [

	self propertyAt: #togglePassword put: aBoolean
]

{ #category : 'accessing' }
WaInput >> type [

	^ self propertyAt: #type
]

{ #category : 'accessing' }
WaInput >> type: aString [

	self propertyAt: #type put: aString
]
