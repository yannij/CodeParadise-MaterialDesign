Class {
	#name : 'WamBasicListPresenter',
	#superclass : 'WamPresenter',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'accessing' }
WamBasicListPresenter class >> defaultViewClass [

	^ WamBasicListView
]

{ #category : 'rendering' }
WamBasicListPresenter >> renderView [

	self
		renderAllChildViewsForModels: self model list
		usingPresenter: WamListItemPresenter
		atSlotNamed: #list
]
