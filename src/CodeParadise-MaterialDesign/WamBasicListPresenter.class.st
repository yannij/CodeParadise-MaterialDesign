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
WamBasicListPresenter >> presenterForCard [

	^ WamListItemCardPresenter
]

{ #category : 'rendering' }
WamBasicListPresenter >> presenterForList [

	^ WamListItemDivPresenter
]

{ #category : 'rendering' }
WamBasicListPresenter >> presenterToUse [

	^ self model viewMode = WamView modeCardGrid
		ifTrue: [ self presenterForCard ]
		ifFalse: [ self presenterForList ]
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

	self model viewMode = WamView modeCardGrid
		ifTrue: [ self view useCards ]
		ifFalse: [ self view useListItem ].

	self
		renderAllChildViewsForModels: self model list
		usingPresenter: self presenterToUse
		atSlotNamed: #list
]
