Class {
	#name : 'SlmdSidesheetPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'rendering' }
SlmdSidesheetPresenter >> renderView [

	self view renderContent: (String loremIpsum: 1024)
]
