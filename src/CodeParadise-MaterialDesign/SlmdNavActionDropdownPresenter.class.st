Class {
	#name : 'SlmdNavActionDropdownPresenter',
	#superclass : 'SlmdNavActionPresenter',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
SlmdNavActionDropdownPresenter >> renderView [
	| popup |

	self view renderNavDropdown: self model asDictionary.

	popup := self layout
		popupsAt: self model eventSubtype
		ifAbsent: [ ^ self traceCr: 'ERROR missing popup: ', self model groupTag printString ].

	self
		renderAllChildViewsForModels: popup popupItems
		usingPresenter: SlmdNavActionSubmenuPresenter
		atSlotNamed: #content

]
