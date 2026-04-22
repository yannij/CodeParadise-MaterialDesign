Class {
	#name : 'WamTabGroupItemPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-Preferences',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Preferences'
}

{ #category : 'rendering' }
WamTabGroupItemPresenter >> renderView [

self systemLog logTrace: self model tabContent printString.
	self renderChildViewForModel: self model tabContent.

]
