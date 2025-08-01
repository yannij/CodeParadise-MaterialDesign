Class {
	#name : 'SlmdNavPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'rendering' }
SlmdNavPresenter >> renderView [

	self view renderNavContent: (self application navItems collect: [ :each | each asDictionary ]) asArray.

]
