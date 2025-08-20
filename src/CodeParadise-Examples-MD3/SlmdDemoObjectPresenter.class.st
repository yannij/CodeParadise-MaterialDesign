Class {
	#name : 'SlmdDemoObjectPresenter',
	#superclass : 'SlmdObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'rendering' }
SlmdDemoObjectPresenter >> renderView [
	| props |

	props := self model asMap.
	self view fields: self model attributeData map: props.

]
