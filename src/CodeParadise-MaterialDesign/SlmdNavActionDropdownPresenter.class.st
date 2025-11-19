Class {
	#name : 'SlmdNavActionDropdownPresenter',
	#superclass : 'SlmdNavActionPresenter',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
SlmdNavActionDropdownPresenter >> renderPopup [
	| popup |

	popup := self layout
		popupsAt: self model eventSubtype
		ifAbsent: [ ^ self traceCr: 'ERROR missing popup: ', self model groupTag printString ].

	self
		renderAllChildViewsForModels: popup popupItems
		usingPresenter: SlmdNavActionSubmenuPresenter
		atSlotNamed: #content

]

{ #category : 'rendering' }
SlmdNavActionDropdownPresenter >> renderView [

	self application layout layoutSettings navRailExpanded
		ifTrue: [ self view renderNavExpandedDropdown: self model asDictionary ]
		ifFalse: [ self view renderNavNarrowDropdown: self model asDictionary ].

	self renderPopup.

]
