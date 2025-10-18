Class {
	#name : 'WaCheckbox',
	#superclass : 'WaCheckControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing' }
WaCheckbox class >> label: aStringOrElement [

	^ self new
		label: aStringOrElement ;
		yourself
]

{ #category : 'accessing style' }
WaCheckbox >> beIndeterminate [

	self indeterminate: true
]

{ #category : 'accessing style' }
WaCheckbox >> beNotIndeterminate [

	self indeterminate: false
]

{ #category : 'accessing' }
WaCheckbox >> indeterminate: aBoolean [

	self propertyAt: #indeterminate put: aBoolean
]

{ #category : 'testing' }
WaCheckbox >> isIndeterminate [

	^ self propertyAt: #indeterminate
]
