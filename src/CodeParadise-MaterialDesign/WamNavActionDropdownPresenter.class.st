Class {
	#name : 'WamNavActionDropdownPresenter',
	#superclass : 'WamNavActionPresenter',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'rendering' }
WamNavActionDropdownPresenter >> renderPopup [
	| popup |

	popup := self layout
		popupsAt: self model eventId
		ifAbsent: [ ^ self systemLog logError: 'Missing popup: ', self model groupTag printString ].

	self
		renderAllChildViewsForModels: popup popupItems
		usingPresenter: WamNavActionSubmenuPresenter
		atSlotNamed: #content

]

{ #category : 'rendering' }
WamNavActionDropdownPresenter >> renderView [

	self application layout layoutSettings navRailExpanded
		ifTrue: [ self view renderNavExpandedDropdown: self model asDictionary ]
		ifFalse: [ self view renderNavNarrowDropdown: self model asDictionary ].

	self renderPopup.

]
