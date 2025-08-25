Class {
	#name : 'SlmdDemoAccountingAppPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'rendering' }
SlmdDemoAccountingAppPresenter >> renderView [

	self application username isNil
		ifTrue: [
			self renderChildViewForModel: self model login atSlotNamed: #layout.
			self application username: 'foobar' ]
		ifFalse: [
			self removeAllChildPresentersAtSlotNamed: #layout.
			self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout ].

]
