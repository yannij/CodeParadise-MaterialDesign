Class {
	#name : 'SlmdLayoutSettingsPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'view' }
SlmdLayoutSettingsPresenter >> viewInitialized [
	| props |

	super viewInitialized.

	props := self model asMap.
	self view
		modalDivSetUp: props;
		layoutInitialSetUp: props.

]
