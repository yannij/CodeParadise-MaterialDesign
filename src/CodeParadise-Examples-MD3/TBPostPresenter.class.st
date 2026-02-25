Class {
	#name : 'TBPostPresenter',
	#superclass : 'WamObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-TinyBlog',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'TinyBlog'
}

{ #category : 'rendering' }
TBPostPresenter >> renderView [
	| props |

	props := self model asMap.
	self view fields: self model fieldsData map: props  slot: #fields.

]
