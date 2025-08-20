Class {
	#name : 'SlmdObjectPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'rendering' }
SlmdObjectPresenter >> renderView [
	| props |

	props := self model asProperties.
	self view fieldsSetUp: props.

]
