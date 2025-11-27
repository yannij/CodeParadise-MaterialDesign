Class {
	#name : 'SlmdNavAbstractPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'events' }
SlmdNavAbstractPresenter >> handleNavEvent: aNavEvent [
	| item |

	item := self model navActionFind: aNavEvent id.
	item ifNil: [
		self systemLog logTrace: 'Not found: ', aNavEvent id printString method: 'handleNavEvent:'.
		^ self ].
	self application navTo: item.

]
