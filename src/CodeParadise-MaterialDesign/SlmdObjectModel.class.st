Class {
	#name : 'SlmdObjectModel',
	#superclass : 'SlmdModel',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'accessing' }
SlmdObjectModel class >> soilTransientInstVars [

	^ #( announcer )
]

{ #category : 'rendering' }
SlmdObjectModel >> applyChanges: changes [

	self subclassResponsibility
]

{ #category : 'converting' }
SlmdObjectModel >> asListItemMap [
	"Subclasses may override"

	^ Dictionary new
		at: #headline put: self mdPrimaryString;
		yourself
]

{ #category : 'converting' }
SlmdObjectModel >> asMap [
	"Subclasses may override"

	^ Dictionary new
]

{ #category : 'metadata' }
SlmdObjectModel >> fieldsData [

	^ #()
]

{ #category : 'rendering' }
SlmdObjectModel >> handleDelete: anObject [

	self systemLog logTrace: anObject printString.
	^ self.

]

{ #category : 'rendering' }
SlmdObjectModel >> handleSave: anObject [
	| changes |

	self systemLog logTrace: anObject printString.

	changes := anObject parameters at: #changes ifAbsent: [ ^ self systemLog logError: 'Missing "changes" value on "save" event'].
	self applyChanges: changes.

]

{ #category : 'rendering' }
SlmdObjectModel >> handleUpdate: anObject [

	self systemLog logTrace: anObject printString.

]

{ #category : 'printing' }
SlmdObjectModel >> mdPrimaryString [
	"Answer a short descriptive string of the receiver.
	Typically used for display in a list.
	Subclasses should provide better string"

	^ self printString
]
