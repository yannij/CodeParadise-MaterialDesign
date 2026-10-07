Class {
	#name : 'WamExampleContentPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

{ #category : 'rendering' }
WamExampleContentPresenter >> renderView [

	self view renderContent: self model content

]
