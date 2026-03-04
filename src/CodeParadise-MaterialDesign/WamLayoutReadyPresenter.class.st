Class {
	#name : 'WamLayoutReadyPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'view' }
WamLayoutReadyPresenter >> viewInitialized [
	| props |

	super viewInitialized.

	props := self application layout layoutSettings asMap.
	self view
		layoutInitialSetUp: props;
		yourself.

]
