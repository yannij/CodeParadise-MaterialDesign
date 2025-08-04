Class {
	#name : 'SlmdLayoutSettingsPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'view' }
SlmdLayoutSettingsPresenter >> viewInitialized [
	| props |

	super viewInitialized.

	props := self model asProperties.
	self view
		modalDivSetUp: props;
		layoutInitialSetUp: props.

]
