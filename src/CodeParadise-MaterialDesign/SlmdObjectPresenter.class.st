Class {
	#name : 'SlmdObjectPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-TinyBlogApp',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'TinyBlogApp'
}

{ #category : 'rendering' }
SlmdObjectPresenter >> renderView [
	| props |

	props := self model asProperties.
	self view fieldsSetUp: props.


]

{ #category : 'view' }
SlmdObjectPresenter >> viewCreated [

	super viewCreated.

	self subscribeToActionRequest.

]
