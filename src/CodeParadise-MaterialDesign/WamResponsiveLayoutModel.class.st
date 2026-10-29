Class {
	#name : 'WamResponsiveLayoutModel',
	#superclass : 'WamModel',
	#instVars : [
		'layoutSettings',
		'pane1',
		'pane1Width',
		'pane2',
		'sidesheet',
		'paneLayout',
		'twoPaneSplitPosition',
		'navRail',
		'navPopups',
		'dockedToolbar',
		'floatingToolbar',
		'fab',
		'dialog',
		'brandDialog'
	],
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> appBar1 [

	^ self pane1 appBarModel
]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> appBar1Headline: aString [

	self appBar1 headline: aString; valueChanged
]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> appBar2 [

	^ self pane2 appBarModel
]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> appBar2Headline: aString [

	self appBar2 headline: aString; valueChanged
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> brandDialog [

	^ brandDialog
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> brandDialog: anObject [

	brandDialog := anObject
]

{ #category : 'initialization' }
WamResponsiveLayoutModel >> brandDialogSetup [
	| item |

	item := WamTabGroupItemModel on: layoutSettings label: 'Settings'.
	brandDialog tabGroupItemAt: 1 put: item.

]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> dialog [

	^ dialog
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> dialog: anObject [

	dialog := anObject
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> dockedToolbar [

	^ dockedToolbar
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> dockedToolbar: anObject [

	dockedToolbar := anObject
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> fab [

	^ fab
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> fab: anObject [

	fab := anObject
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> floatingToolbar [

	^ floatingToolbar
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> floatingToolbar: anObject [

	floatingToolbar := anObject
]

{ #category : 'initialization' }
WamResponsiveLayoutModel >> initialize [

	super initialize.

	navPopups := OrderedIdentityDictionary new.
	layoutSettings := WamPreferencesModel new.
	paneLayout := WamPaneLayoutModel on: self.
	twoPaneSplitPosition := 300.
	pane1Width := 500.
	sidesheet := nil.
	navRail := WamNavModel new.
	dockedToolbar := WamToolbarDockedModel new.
	floatingToolbar := WamToolbarFloatingModel new.
	fab := WamFabModel new.
	dialog := WamDialogModel new.
	brandDialog := WamBrandDialogModel new.
	self brandDialogSetup.

]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> layoutSettings [

	^ layoutSettings
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> layoutSettings: anObject [

	layoutSettings := anObject
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> navPopups [

	^ navPopups
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> navPopups: anObject [

	navPopups := anObject
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> navRail [

	^ navRail
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> navRail: anObject [

	navRail := anObject
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> pane1 [

	^ pane1
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> pane1: anObject [

	pane1 := anObject
]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> pane1Changed [

	self pane1 valueChanged
]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> pane1Content [

	^ self pane1 paneContent
]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> pane1Content: anObject [

	self pane1 paneContent: anObject
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> pane1Width [

	^ pane1Width
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> pane1Width: anObject [

	pane1Width := anObject
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> pane2 [

	^ pane2
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> pane2: anObject [

	pane2 := anObject
]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> pane2Changed [

	self pane2 valueChanged
]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> pane2Clear [

	self pane2Content: nil.
	self pane2Changed.
	self appBar2Headline: ''.
	self setAppBar2TrailingActionsNone.

]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> pane2Content [

	^ self pane2 paneContent
]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> pane2Content: anObject [

	self pane2 paneContent: anObject
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> paneLayout [

	^ paneLayout
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> paneLayout: anObject [

	paneLayout := anObject
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> paneLayoutBeFeed [

	self paneLayout useFeedStrategy.
	self pane1 paneContent viewStyleBeCard.

]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> paneLayoutBeListDetail [

	self paneLayout useListDetailStrategy.
	self pane1 paneContent viewStyleBeListItem.

]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> paneLayoutBeNotChanged [

	^ self paneLayout paneLayoutChanged: false
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> paneLayoutBeSupportingPane [

	self paneLayout useSupportingPaneStrategy.
	self pane1 paneContent viewStyleBeCard.

]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> paneLayoutChanged [

	^ self paneLayout paneLayoutChanged
]

{ #category : 'accessing - popups' }
WamResponsiveLayoutModel >> popupsAt: aSymbol [

	^ self navPopups at: aSymbol
]

{ #category : 'accessing - popups' }
WamResponsiveLayoutModel >> popupsAt: aSymbol ifAbsent: aBlock [

	^ self navPopups at: aSymbol ifAbsent: aBlock
]

{ #category : 'accessing - popups' }
WamResponsiveLayoutModel >> popupsAt: aSymbol ifAbsentPut: aBlock [

	^ self navPopups at: aSymbol ifAbsentPut: aBlock
]

{ #category : 'accessing - popups' }
WamResponsiveLayoutModel >> popupsAt: aSymbol put: aNavPopop [

	self navPopups at: aSymbol put: aNavPopop
]

{ #category : 'accessing - popups' }
WamResponsiveLayoutModel >> popupsHasKey: aSymbol [

	^ self navPopups hasKey: aSymbol
]

{ #category : 'presenter' }
WamResponsiveLayoutModel >> preferredPresenterClass [

	^ WamResponsiveLayoutPresenter
]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> setAppBar2EditDelete [

	self appBar2
		navActionItemsClear;
		navActionItemsAdd: (self application nativeEventSpecAt: #delete);
		navActionItemsAdd: (self application nativeEventSpecAt: #update);
		valueChanged;
		yourself.

]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> setAppBar2SaveCancel [

	self appBar2
		navActionItemsClear;
		navActionItemsAdd: (self application nativeEventSpecAt: #save);
		navActionItemsAdd: (self application nativeEventSpecAt: #cancel);
		valueChanged;
		yourself.

]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> setAppBar2TrailingActionsNone [

	self appBar2
		navActionItemsClear;
		valueChanged;
		yourself.

]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> setDetailAddNew [
	| detail |

	detail := self application newWrappedModel.
	self pane2Content: detail.
	self pane2Changed.
	self appBar2Headline: detail wrappedModel mdAddingTitle.
	self setAppBar2SaveCancel.

]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> sidesheet [

	^ sidesheet
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> sidesheet: anObject [

	sidesheet := anObject
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> twoPaneSplitPosition [

	^ twoPaneSplitPosition
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> twoPaneSplitPosition: anObject [

	twoPaneSplitPosition := anObject
]
