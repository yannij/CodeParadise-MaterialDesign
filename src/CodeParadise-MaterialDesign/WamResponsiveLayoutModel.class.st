Class {
	#name : 'WamResponsiveLayoutModel',
	#superclass : 'WamModel',
	#instVars : [
		'layoutSettings',
		'paneLayout',
		'twoPaneSplitPosition',
		'navRail',
		'navPopups',
		'dockedToolbar',
		'floatingToolbar',
		'fab',
		'dialog',
		'brandDialog',
		'layoutReady'
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
WamResponsiveLayoutModel >> appBar2 [

	^ self pane2 appBarModel
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> brandDialog [

	^ brandDialog
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> brandDialog: anObject [

	brandDialog := anObject
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
	twoPaneSplitPosition := 300.
	paneLayout := WamListDetailLayoutModel new.
	navRail := WamNavModel new.
	dockedToolbar := WamToolbarDockedModel new.
	floatingToolbar := WamToolbarFloatingModel new.
	fab := WamFabModel new.
	dialog := WamDialogModel new.
	brandDialog := (WamDialogModel new contentModel: layoutSettings; yourself).
	layoutReady := WamLayoutReadyModel new.

]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> layoutReady [

	^ layoutReady
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> layoutReady: anObject [

	layoutReady := anObject
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

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> pane1 [

	^ self paneLayout pane1
]

{ #category : 'accessing - derived' }
WamResponsiveLayoutModel >> pane2 [

	^ self paneLayout pane2
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> paneLayout [

	^ paneLayout
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> paneLayout: anObject [

	paneLayout := anObject
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

{ #category : 'accessing' }
WamResponsiveLayoutModel >> sidesheet [

	^ self paneLayout sidesheet
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> twoPaneSplitPosition [

	^ twoPaneSplitPosition
]

{ #category : 'accessing' }
WamResponsiveLayoutModel >> twoPaneSplitPosition: anObject [

	twoPaneSplitPosition := anObject
]
