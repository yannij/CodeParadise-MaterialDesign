Class {
	#name : 'WamPaneContentPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'rendering' }
WamPaneContentPresenter >> renderView [

	self view renderContent: self model content

]
