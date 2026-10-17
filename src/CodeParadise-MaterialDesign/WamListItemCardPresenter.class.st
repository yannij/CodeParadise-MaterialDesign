Class {
	#name : 'WamListItemCardPresenter',
	#superclass : 'WamListItemPresenter',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'rendering' }
WamListItemCardPresenter >> renderView [

	self view renderListItemAsCard: self model wrappedModel asListItemMap.

]
