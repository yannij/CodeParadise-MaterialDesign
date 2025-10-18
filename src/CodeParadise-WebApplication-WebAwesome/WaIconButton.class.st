Class {
	#name : 'WaIconButton',
	#superclass : 'WaIcon',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing style' }
WaIconButton >> beDisabled [

	self disabled: true
]

{ #category : 'accessing style' }
WaIconButton >> beEnabled [

	"Convenience method to make receiver enabled"

	self disabled: false
]

{ #category : 'accessing style' }
WaIconButton >> beNotDisabled [

	self disabled: false
]

{ #category : 'accessing style' }
WaIconButton >> beNotEnabled [

	"Convenience method to clear the enabled state of the receiver"

	self disabled: true
]

{ #category : 'accessing' }
WaIconButton >> disabled: aBoolean [

	self propertyAt: #disabled put: aBoolean
]

{ #category : 'accessing' }
WaIconButton >> download [

	^ self propertyAt: #download
]

{ #category : 'accessing' }
WaIconButton >> download: aString [

	self propertyAt: #download put: aString
]

{ #category : 'accessing' }
WaIconButton >> enabled: aBoolean [

	"Convenience method to set receiver's enabled state"

	self disabled: aBoolean not
]

{ #category : 'testing' }
WaIconButton >> isDisabled [

	^ self propertyAt: #disabled
]

{ #category : 'testing' }
WaIconButton >> isEnabled [

	"Convenience method to test if receiver is enabled"

	^ self isDisabled not
]

{ #category : 'accessing' }
WaIconButton >> link [

	^ self propertyAt: #href
]

{ #category : 'accessing' }
WaIconButton >> link: aString [

	self propertyAt: #href put: aString
]

{ #category : 'accessing' }
WaIconButton >> link: linkString download: downloadString [

	self
		link: linkString ;
		download: downloadString
]

{ #category : 'accessing' }
WaIconButton >> link: linkString target: targetString [

	self
		link: linkString ;
		target: targetString
]

{ #category : 'accessing' }
WaIconButton >> target [

	^ self propertyAt: #target
]

{ #category : 'accessing' }
WaIconButton >> target: aString [

	self propertyAt: #target put: aString
]

{ #category : 'accessing target' }
WaIconButton >> targetBlank [

	self target: #'_blank'
]

{ #category : 'accessing target' }
WaIconButton >> targetParent [

	self target: #'_parent'
]

{ #category : 'accessing target' }
WaIconButton >> targetSelf [

	self target: #'_self'
]

{ #category : 'accessing target' }
WaIconButton >> targetTop [

	self target: #'_top'
]
