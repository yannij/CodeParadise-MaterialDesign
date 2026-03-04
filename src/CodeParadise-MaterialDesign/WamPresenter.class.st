Class {
	#name : 'WamPresenter',
	#superclass : 'CpPresenter',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'testing' }
WamPresenter class >> isAbstract [

	^ self == WamPresenter
]

{ #category : 'events' }
WamPresenter >> handleNavEvent: aNavEvent [
	| item |

	self systemLog logTrace: '**** ', aNavEvent printString.

	item := self model navActionAtId: aNavEvent id.
	item ifNotNil: [
		^ self application navTo: item ].

	self systemLog logError: 'Not found: ', aNavEvent id printString.

]

{ #category : 'accessing - model' }
WamPresenter >> layout [

	^ self application layout
]

{ #category : 'events' }
WamPresenter >> subscribeToNavActionEvent [

	self view when: WamNavActionEvent send: #handleNavEvent: to: self
]

{ #category : 'accessing' }
WamPresenter >> systemLog [

	^ WamLog
]

{ #category : 'view' }
WamPresenter >> viewCreated [

	self view viewProxyLogTrace: self class name, '>>viewCreated'.
	super viewCreated
]

{ #category : 'view' }
WamPresenter >> viewInitialized [

	self view viewProxyLogTrace: self class name, '>>viewInitialized'.
	super viewInitialized
]
