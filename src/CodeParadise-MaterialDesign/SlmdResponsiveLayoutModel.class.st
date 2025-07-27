Class {
	#name : 'SlmdResponsiveLayoutModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'layoutSettings',
		'paneLayout',
		'twoPaneSplitPosition',
		'navRail',
		'navBar',
		'dockedToolbar',
		'floatingToolbar',
		'fab'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
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

	layoutSettings := SlmdLayoutSettingsModel new.
	twoPaneSplitPosition := 300.
	paneLayout := SlmdPaneLayoutModel new.
	navRail := SlmdNavRailModel new.
	navBar := SlmdNavBarModel new.
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
SlmdResponsiveLayoutModel >> navBar [

	^ navBar
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> navBar: anObject [

	navBar := anObject
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

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> twoPaneSplitPosition [

	^ twoPaneSplitPosition
]

{ #category : 'accessing' }
SlmdResponsiveLayoutModel >> twoPaneSplitPosition: anObject [

	twoPaneSplitPosition := anObject
]
