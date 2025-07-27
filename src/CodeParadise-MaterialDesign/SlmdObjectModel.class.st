Class {
	#name : 'SlmdObjectModel',
	#superclass : 'SlmdModel',
	#category : 'CodeParadise-MaterialDesign-TinyBlogApp',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'TinyBlogApp'
}

{ #category : 'converting' }
SlmdObjectModel >> asProperties [
	"Subclasses may override"

	^ Dictionary new
]

{ #category : 'rendering' }
SlmdObjectModel >> handleDelete: anObject [

	"self logTrace: anObject printString method: 'handleDelete:'."
	self traceCr: anObject printString.
	^ self.

]

{ #category : 'rendering' }
SlmdObjectModel >> handleSave: anObject [
	| changes |

	self traceCr: anObject printString.

	changes := anObject parameters at: #changes.
	self applyChanges: changes.

]

{ #category : 'rendering' }
SlmdObjectModel >> handleUpdate: anObject [

	self traceCr: anObject printString.

]
