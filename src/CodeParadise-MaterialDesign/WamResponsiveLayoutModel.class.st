Class {
	#name : 'WamResponsiveLayoutModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'layoutSettings',
		'paneLayout',
		'twoPaneSplitPosition',
		'navRail',
		'navPopups',
		'sidesheet',
		'dialog',
		'dockedToolbar',
		'floatingToolbar',
		'fab'
	],
	#category : 'CodeParadise-MaterialDesign-WAM',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'WAM'
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
	layoutSettings := SlmdLayoutSettingsModel new.
	twoPaneSplitPosition := 300.
	paneLayout := SlmdPaneLayoutModel new.
	navRail := SlmdNavModel new.
	sidesheet := SlmdSidesheetModel new.
	dialog := SlmdDialogModel new.
	dockedToolbar := SlmdToolbarDockedModel new.
	floatingToolbar := SlmdToolbarFloatingModel new.
	fab := SlmdFabModel new.

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
