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
SlmdPresenter >> handleNavEvent: aNavEvent [
	| item |

	"self systemLog logTrace: '****', aNavEvent printString."
	item := self model navActionAtId: aNavEvent id.
	item ifNil: [
		self systemLog logError: 'Not found: ', aNavEvent id printString.
		^ self ].
	self application navTo: item.

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
