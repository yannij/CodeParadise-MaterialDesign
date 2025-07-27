Class {
	#name : 'SlmdPaneContentPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'rendering' }
SlmdPaneContentPresenter >> renderView [

	self view renderContent: self model content

]
