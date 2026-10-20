Class {
	#name : 'WamListItemDivPresenter',
	#superclass : 'WamListItemPresenter',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'accessing' }
WamListItemDivPresenter class >> defaultViewClass [

	^ WamListItemDivView
]

{ #category : 'rendering' }
WamListItemDivPresenter >> renderView [

	self view renderListItemAsDiv: self model wrappedModel asListItemMap.

]
