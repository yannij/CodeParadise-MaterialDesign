Class {
	#name : 'SlmdNavActionPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
SlmdNavActionPresenter >> renderView [

	self application layout layoutSettings navRailExpanded
		ifTrue: [ self view renderNavExpanded: self model asDictionary ]
		ifFalse: [ self view renderNavNarrow: self model asDictionary ].

]
