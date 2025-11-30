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

	item := self model navActionFind: aNavEvent id.
	item ifNil: [
		self systemLog logError: 'Not found: ', aNavEvent id printString.
		^ self ].
	item eventSubtype = #create ifTrue: [
		^ self doCreate: aNavEvent ].
	self systemLog logError: 'No handler for: ', item eventSubtype printString.

]

{ #category : 'rendering' }
SlmdFabPresenter >> renderView [

	self model fab ifNotNil: [ :value |
		self view renderFab: value asDictionary ].

]
