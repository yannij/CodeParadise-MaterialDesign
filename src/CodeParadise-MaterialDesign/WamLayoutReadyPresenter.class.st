Class {
	#name : 'WamLayoutReadyPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'view' }
WamLayoutReadyPresenter >> viewInitialized [
	| layout props |

	super viewInitialized.

	layout := self application layout.

	layout brandDialog label: self application class appName.

	props := layout layoutSettings asMap.
	self view
		layoutInitialSetUp: props;
		yourself.

]
