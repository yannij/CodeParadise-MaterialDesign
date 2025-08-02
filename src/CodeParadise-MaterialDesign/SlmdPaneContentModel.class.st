Class {
	#name : 'SlmdPaneContentModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'content'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'instance creation' }
SlmdPaneContentModel class >> on: aString [

	^ self new
		content: aString;
		yourself
]

{ #category : 'accessing' }
SlmdPaneContentModel >> content [

	^ content
]

{ #category : 'accessing' }
SlmdPaneContentModel >> content: anObject [

	content := anObject
]

{ #category : 'actions' }
SlmdPaneContentModel >> handleUserEvent: aBasicEvent [
	| newContent |

	newContent := aBasicEvent parameterAt: #to.
	newContent ifNil: [
		newContent := aBasicEvent parameterAt: #type ].
	self setContent: newContent.

]

{ #category : 'accessing' }
SlmdPaneContentModel >> setContent: anObject [

	self content: anObject.
	self valueChanged.

]
