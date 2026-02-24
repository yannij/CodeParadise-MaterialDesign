Class {
	#name : 'SlmdFabPresenter',
	#superclass : 'SlmdToolbarPresenter',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'events' }
SlmdFabPresenter >> handleNavEvent: aNavEvent [
	| item |

	self systemLog logTrace: aNavEvent printString.

	item := self model navActionAtId: aNavEvent id.
	item ifNil: [
		self systemLog logError: 'Not found: ', aNavEvent id printString.
		^ self ].
	item eventId = #create ifTrue: [
		^ self doCreate: aNavEvent ].
	self systemLog logError: 'No handler for: ', item eventId printString.

]

{ #category : 'rendering' }
SlmdFabPresenter >> renderView [

	self model fab ifNotNil: [ :value |
		self view renderFab: value asDictionary ].

]
