Class {
	#name : 'SlmdResponsiveLayoutModel',
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
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'accessing - derived' }
SlmdResponsiveLayoutModel >> appBar1 [

	^ self pane1 appBarModel
]

{ #category : 'accessing - derived' }
SlmdResponsiveLayoutModel >> appBar2 [

	^ self pane2 appBarModel
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> dialog [

	^ dialog
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> dialog: anObject [

	dialog := anObject
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> dockedToolbar [

	^ dockedToolbar
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> dockedToolbar: anObject [

	dockedToolbar := anObject
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> fab [

	^ fab
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> fab: anObject [

	fab := anObject
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> floatingToolbar [

	^ floatingToolbar
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> floatingToolbar: anObject [

	floatingToolbar := anObject
]

{ #category : 'initialization' }
SlmdResponsiveLayoutModel >> initialize [

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
SlmdResponsiveLayoutModel >> layoutSettings [

	^ layoutSettings
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> layoutSettings: anObject [

	layoutSettings := anObject
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> navPopups [

	^ navPopups
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> navPopups: anObject [

	navPopups := anObject
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> navRail [

	^ navRail
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> navRail: anObject [

	navRail := anObject
]

{ #category : 'accessing - derived' }
SlmdResponsiveLayoutModel >> pane1 [

	^ self paneLayout pane1
]

{ #category : 'accessing - derived' }
SlmdResponsiveLayoutModel >> pane2 [

	^ self paneLayout pane2
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> paneLayout [

	^ paneLayout
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> paneLayout: anObject [

	paneLayout := anObject
]

{ #category : 'accessing - popups' }
SlmdResponsiveLayoutModel >> popupsAt: aSymbol [

	^ self navPopups at: aSymbol
]

{ #category : 'accessing - popups' }
SlmdResponsiveLayoutModel >> popupsAt: aSymbol ifAbsent: aBlock [

	^ self navPopups at: aSymbol ifAbsent: aBlock
]

{ #category : 'accessing - popups' }
SlmdResponsiveLayoutModel >> popupsAt: aSymbol ifAbsentPut: aBlock [

	^ self navPopups at: aSymbol ifAbsentPut: aBlock
]

{ #category : 'accessing - popups' }
SlmdResponsiveLayoutModel >> popupsAt: aSymbol put: aNavPopop [

	self navPopups at: aSymbol put: aNavPopop
]

{ #category : 'accessing - popups' }
SlmdResponsiveLayoutModel >> popupsHasKey: aSymbol [

	^ self navPopups hasKey: aSymbol
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> sidesheet [

	^ sidesheet
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> sidesheet: anObject [

	sidesheet := anObject
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> twoPaneSplitPosition [

	^ twoPaneSplitPosition
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> twoPaneSplitPosition: anObject [

	twoPaneSplitPosition := anObject
]
