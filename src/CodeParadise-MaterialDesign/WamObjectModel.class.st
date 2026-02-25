Class {
	#name : 'WamObjectModel',
	#superclass : 'WamModel',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'accessing' }
WamObjectModel class >> soilTransientInstVars [

	^ #( announcer )
]

{ #category : 'rendering' }
WamObjectModel >> applyChanges: changes [

	self subclassResponsibility
]

{ #category : 'converting' }
WamObjectModel >> asListItemMap [
	"Subclasses may override"

	^ Dictionary new
		at: #headline put: self mdPrimaryString;
		yourself
]

{ #category : 'converting' }
WamObjectModel >> asMap [
	"Subclasses may override"

	^ Dictionary new
]

{ #category : 'metadata' }
WamObjectModel >> fieldsData [

	^ #()
]

{ #category : 'rendering' }
WamObjectModel >> handleDelete: anObject [

	self systemLog logTrace: anObject printString.
	^ self.

]

{ #category : 'rendering' }
WamObjectModel >> handleSave: anObject [
	| changes |

	self systemLog logTrace: anObject printString.

	changes := anObject parameterAt: #changes.
	changes ifNil: [
		^ self systemLog logError: 'Missing "changes" value on "save" event'].
	self applyChanges: changes.

]

{ #category : 'rendering' }
WamObjectModel >> handleUpdate: anObject [

	self systemLog logTrace: anObject printString.

]

{ #category : 'printing' }
WamObjectModel >> mdPrimaryString [
	"Answer a short descriptive string of the receiver.
	Typically used for display in a list.
	Subclasses should provide better string"

	^ self printString
]
