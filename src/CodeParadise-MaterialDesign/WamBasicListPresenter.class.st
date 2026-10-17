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
	| list page pageSize slice |

	list := self model list.
	page := 1.
	pageSize := 10.
	slice := list copyFrom: ((page - 1) * pageSize) + 1 to: ((page * pageSize) min: list size).

	self view
		renderPaginationTotal: list size pageSize: pageSize page: page.

	self
		renderAllChildViewsForModels: self model list
		usingPresenter: WamListItemPresenter
		atSlotNamed: #list
]
