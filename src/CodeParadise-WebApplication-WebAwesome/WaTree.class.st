Class {
	#name : 'WaTree',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'instance creation' }
WaTree class >> label: object1 [ 

	^ self new 
		label: object1;
		yourself
]

{ #category : 'slots' }
WaTree >> collapseIcon [

	^ self firstChildAtSlotNamed: #'collapse-icon'
]

{ #category : 'slots' }
WaTree >> collapseIcon: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'collapse-icon'
]

{ #category : 'slots' }
WaTree >> expandIcon [

	^ self firstChildAtSlotNamed: #'expand-icon'
]

{ #category : 'slots' }
WaTree >> expandIcon: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #'expand-icon'
]

{ #category : 'css custom properties' }
WaTree >> indentGuideColor [

	^ self customPropertyAt: #'indent-guide-color'
]

{ #category : 'css custom properties' }
WaTree >> indentGuideColor: aString [

	self customPropertyAt: #'indent-guide-color' put: aString
]

{ #category : 'css custom properties' }
WaTree >> indentGuideOffset [

	^ self customPropertyAt: #'indent-guide-offset'
]

{ #category : 'css custom properties' }
WaTree >> indentGuideOffset: aString [

	self customPropertyAt: #'indent-guide-offset' put: aString
]

{ #category : 'css custom properties' }
WaTree >> indentGuideStyle [

	^ self customPropertyAt: #'indent-guide-style'
]

{ #category : 'css custom properties' }
WaTree >> indentGuideStyle: aString [

	self customPropertyAt: #'indent-guide-style' put: aString
]

{ #category : 'css custom properties' }
WaTree >> indentGuideWidth [

	^ self customPropertyAt: #'indent-guide-width'
]

{ #category : 'css custom properties' }
WaTree >> indentGuideWidth: aString [

	self customPropertyAt: #'indent-guide-width' put: aString
]

{ #category : 'css custom properties' }
WaTree >> indentSize [

	^ self customPropertyAt: #'indent-size'
]

{ #category : 'css custom properties' }
WaTree >> indentSize: aString [

	self customPropertyAt: #'indent-size' put: aString
]

{ #category : 'slots' }
WaTree >> label [

	^ self firstChildAtSlotNamed: nil
]

{ #category : 'slots' }
WaTree >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]

{ #category : 'properties' }
WaTree >> selection [

	^ self propertyAt: #selection
]

{ #category : 'properties' }
WaTree >> selection: anObject [

	self propertyAt: #selection put: anObject
]

{ #category : 'properties' }
WaTree >> selectionBeLeaf [

	self selection: #leaf
]

{ #category : 'properties' }
WaTree >> selectionBeMultiple [

	self selection: #multiple
]

{ #category : 'properties' }
WaTree >> selectionBeSingle [

	self selection: #single
]
