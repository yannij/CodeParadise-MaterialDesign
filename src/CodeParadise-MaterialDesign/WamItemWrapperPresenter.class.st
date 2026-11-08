Class {
	#name : 'WamItemWrapperPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'accessing' }
WamItemWrapperPresenter class >> defaultViewClass [

	^ WamItemWrapperView
]

{ #category : 'events' }
WamItemWrapperPresenter >> doSave: aNavActionEvent [
	| result |

	result := self application wrapperSave: aNavActionEvent.
	result = true ifTrue: [
		self view beNotEditablePane2 ].

]

{ #category : 'events' }
WamItemWrapperPresenter >> handleNavEvent: anObject [
	| eventId |

	self systemLog logTrace: anObject printString.

	eventId := anObject id.

	eventId = #save ifTrue: [
		^ self doSave: anObject ].

	^ super handleNavEvent: anObject
]

{ #category : 'rendering' }
WamItemWrapperPresenter >> renderView [

	self
		renderAllChildViewsForModels: (self model wrappedModel ifNil: [{}] ifNotNil: [ :value | {value} ])
		atSlotNamed: #wrapped
]
