Class {
	#name : 'WamTabGroupItemPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Preferences',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Preferences'
}

{ #category : 'rendering' }
WamTabGroupItemPresenter >> renderView [

	self renderChildViewForModel: self model tabContent.

]
