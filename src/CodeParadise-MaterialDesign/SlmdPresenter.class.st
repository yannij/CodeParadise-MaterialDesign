Class {
	#name : 'SlmdPresenter',
	#superclass : 'CpPresenter',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'testing' }
SlmdPresenter class >> isAbstract [

	^ self == SlmdPresenter
]

{ #category : 'events' }
SlmdPresenter >> appBar2ButtonsSetEditDelete [

	self layout appBar2 setEditDelete.

]

{ #category : 'events' }
SlmdPresenter >> appBar2ButtonsSetSaveCancel [

	self application layout appBar2 setSaveCancel
]

{ #category : 'events' }
SlmdPresenter >> handleNavEvent: aNavEvent [
	| item |

	item := self model navActionFind: aNavEvent id.
	item ifNil: [
		self systemLog logError: 'Not found: ', aNavEvent id printString.
		^ self ].
	self application navTo: item.

]

{ #category : 'events' }
SlmdPresenter >> handleUserEvent: anObject [

	self systemLog logTrace5: 'Subclass should provide code to handle: ', anObject printString
]

{ #category : 'accessing - model' }
SlmdPresenter >> layout [

	^ self application layout
]

{ #category : 'events' }
SlmdPresenter >> subscribeToNavActionEvent [

	self view when: WamNavActionEvent send: #handleNavEvent: to: self
]

{ #category : 'accessing' }
SlmdPresenter >> systemLog [

	^ SlmdLog
]

{ #category : 'view' }
SlmdPresenter >> viewCreated [

	self view viewProxyLogTrace: self class name, '>>viewCreated'.
	super viewCreated
]

{ #category : 'view' }
SlmdPresenter >> viewInitialized [

	self view viewProxyLogTrace: self class name, '>>viewInitialized'.
	super viewInitialized
]
