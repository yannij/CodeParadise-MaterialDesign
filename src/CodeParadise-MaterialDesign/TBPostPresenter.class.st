Class {
	#name : 'TBPostPresenter',
	#superclass : 'SlmdObjectPresenter',
	#category : 'CodeParadise-MaterialDesign-TinyBlogApp',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'TinyBlogApp'
}

{ #category : 'rendering' }
TBPostPresenter >> renderView [
	| props |

	props := self model asMap.
	self view fields: self model fieldsData map: props  slot: #fields.

]
