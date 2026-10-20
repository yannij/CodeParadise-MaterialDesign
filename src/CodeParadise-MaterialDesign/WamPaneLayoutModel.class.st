Class {
	#name : 'WamPaneLayoutModel',
	#superclass : 'WamModel',
	#instVars : [
		'scaffold',
		'paneLayoutStrategy'
	],
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'instance creation' }
WamPaneLayoutModel class >> on: aScaffold [

	^ self new scaffold: aScaffold; yourself
]

{ #category : 'initialization' }
WamPaneLayoutModel >> initialize [

	super initialize.

	paneLayoutStrategy := #listDetail.

]

{ #category : 'accessing' }
WamPaneLayoutModel >> paneLayoutStrategy [

	^ paneLayoutStrategy
]

{ #category : 'accessing' }
WamPaneLayoutModel >> paneLayoutStrategy: anObject [

	paneLayoutStrategy := anObject
]

{ #category : 'presenter' }
WamPaneLayoutModel >> preferredPresenterClass [

	self error: 'Should not invoke'
]

{ #category : 'accessing' }
WamPaneLayoutModel >> presenterClassToUse [

	self paneLayoutStrategy = #feed ifTrue: [ ^ WamFeedLayoutPresenter ].

	^ WamListDetailLayoutPresenter
]

{ #category : 'accessing' }
WamPaneLayoutModel >> scaffold [

	^ scaffold
]

{ #category : 'accessing' }
WamPaneLayoutModel >> scaffold: anObject [

	scaffold := anObject
]

{ #category : 'accessing' }
WamPaneLayoutModel >> useFeedStrategy [

	self paneLayoutStrategy: #feed.
	self scaffold pane1 paneContent viewStyleBeCard.

]

{ #category : 'accessing' }
WamPaneLayoutModel >> useListDetailStrategy [

	self paneLayoutStrategy: #listDetail.
	self scaffold pane1 paneContent viewStyleBeListItem.

]
