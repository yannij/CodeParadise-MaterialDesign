Class {
	#name : 'WamPaneLayoutModel',
	#superclass : 'WamModel',
	#instVars : [
		'scaffold',
		'paneLayoutStrategy',
		'paneLayoutChanged',
		'presenterClassMap'
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

	presenterClassMap := self presenterClassMapDefault.
	paneLayoutChanged := true.
	paneLayoutStrategy := WamListDetailLayoutPresenter strategyName.

]

{ #category : 'accessing' }
WamPaneLayoutModel >> paneLayoutChanged [

	^ paneLayoutChanged
]

{ #category : 'accessing' }
WamPaneLayoutModel >> paneLayoutChanged: anObject [

	paneLayoutChanged := anObject
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
WamPaneLayoutModel >> presenterClassMap [

	^ presenterClassMap
]

{ #category : 'accessing' }
WamPaneLayoutModel >> presenterClassMap: anObject [

	presenterClassMap := anObject
]

{ #category : 'accessing' }
WamPaneLayoutModel >> presenterClassMapAt: key put: value [

	self presenterClassMap at: key put: value
]

{ #category : 'initialization' }
WamPaneLayoutModel >> presenterClassMapDefault [

	^ IdentityDictionary new
		at: WamFeedLayoutPresenter strategyName put: WamFeedLayoutPresenter;
		at: WamListDetailLayoutPresenter strategyName put: WamListDetailLayoutPresenter;
		at: WamSupportingPaneLayoutPresenter strategyName put: WamSupportingPaneLayoutPresenter;
		yourself
]

{ #category : 'accessing' }
WamPaneLayoutModel >> presenterClassToUse [

	^ self presenterClassMap
		at: self paneLayoutStrategy
		ifAbsent: [ self error: 'Pane layout strategy not found: '. self paneLayoutStrategy asString ]
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

	self useStrategy: WamFeedLayoutPresenter strategyName.


]

{ #category : 'accessing' }
WamPaneLayoutModel >> useListDetailStrategy [

	self useStrategy: WamListDetailLayoutPresenter strategyName.


]

{ #category : 'accessing' }
WamPaneLayoutModel >> useStrategy: aStrategyName [

	self paneLayoutStrategy: aStrategyName.
	self paneLayoutChanged: true.

]

{ #category : 'accessing' }
WamPaneLayoutModel >> useSupportingPaneStrategy [

	self useStrategy: WamSupportingPaneLayoutPresenter strategyName.

]
