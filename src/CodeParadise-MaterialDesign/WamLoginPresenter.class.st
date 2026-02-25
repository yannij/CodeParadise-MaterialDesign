Class {
	#name : 'WamLoginPresenter',
	#superclass : 'WamObjectPresenter',
	#category : 'CodeParadise-MaterialDesign-Login',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Login'
}

{ #category : 'actions' }
WamLoginPresenter >> handleLoginRequested: anObject [

	self application username: 'foobar'.
	self application layout valueChanged.

]

{ #category : 'rendering' }
WamLoginPresenter >> renderView [
	| props |

	props := self model asMap.
	self view
		header: self application class appName;
		fields: self model fieldsData map: props slot: #fields;
		addButtons;
		yourself.

]

{ #category : 'view' }
WamLoginPresenter >> viewCreated [

	super viewCreated.

	self view
		when: WamLoginRequested send: #handleLoginRequested: to: self
]
