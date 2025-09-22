Class {
	#name : 'SlmdPaneContentPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'rendering' }
SlmdPaneContentPresenter >> renderView [

	self view renderContent: self model content

]
