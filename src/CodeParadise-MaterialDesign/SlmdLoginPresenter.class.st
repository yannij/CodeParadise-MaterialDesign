Class {
	#name : 'SlmdLoginPresenter',
	#superclass : 'SlmdObjectPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'actions' }
SlmdLoginPresenter >> handleLoginRequested: anObject [

	self application username: 'foobar'.
	self application layout valueChanged.

]

{ #category : 'rendering' }
SlmdLoginPresenter >> renderView [
	| props |

	props := self model asMap.
	self view
		header: self application class appName;
		fields: self model fieldsData map: props slot: #fields;
		addButtons;
		yourself.

]

{ #category : 'view' }
SlmdLoginPresenter >> viewCreated [

	super viewCreated.

	self view
		when: SlmdLoginRequested send: #handleLoginRequested: to: self
]
