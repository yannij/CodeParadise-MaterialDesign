"
Drawers slide in from a container to expose additional options and information.


"
Class {
	#name : 'WaDrawer',
	#superclass : 'WaAbstractPrompter',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing' }
WaDrawer >> beBottom [

	self placement: #bottom
]

{ #category : 'accessing' }
WaDrawer >> beContained [

	self contained: true
]

{ #category : 'accessing' }
WaDrawer >> beEnd [

	self placement: #end
]

{ #category : 'accessing' }
WaDrawer >> beNotContained [

	self contained: false
]

{ #category : 'accessing' }
WaDrawer >> beStart [

	self placement: #start
]

{ #category : 'accessing' }
WaDrawer >> beTop [

	self placement: #top
]

{ #category : 'accessing' }
WaDrawer >> contained: aBoolean [

	"By default, the drawer slides out of its containing block (usually the viewport).
	To make the drawer slide out of its parent element, set this property and
	add 'position: relative' to the parent."

	self propertyAt: #contained put: aBoolean

]

{ #category : 'testing' }
WaDrawer >> isContained [

	^ self propertyAt: #contained
]

{ #category : 'accessing' }
WaDrawer >> placement [

	"Answer the direction from which the drawer will open"

	^ self propertyAt: #placement

]

{ #category : 'accessing' }
WaDrawer >> placement: aString [

	"The direction from which the drawer will open. 'top' | 'right' | 'bottom' | 'left'"

	self propertyAt: #placement put: aString

]
