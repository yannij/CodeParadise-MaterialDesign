Class {
	#name : 'TBRootApplication',
	#superclass : 'SlmdWebApplication',
	#category : 'CodeParadise-MaterialDesign-TinyBlogApp',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'TinyBlogApp'
}

{ #category : 'accessing' }
TBRootApplication class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { SlElement package }
]

{ #category : 'accessing' }
TBRootApplication class >> app [
	"self register"

	^ #'tinyblog'
]

{ #category : 'accessing' }
TBRootApplication class >> appName [
	"Answer name to be shown in AppBar headline"

	^ #'Tiny Blog'
]

{ #category : 'accessing' }
TBRootApplication >> applicationPresenterClass [

	^ TBRootPresenter
]

{ #category : 'initialization' }
TBRootApplication >> initialize [
	| pane1Model pane2Model pane1Content |

	super initialize.

	pane1Content := SlmdListDetailModel new.
	pane1Content listSet: TBBlogModel current allBlogPosts.
	pane1Model := SlmdPaneModel on: pane1Content.
	pane2Model := SlmdPaneModel new.
	pane2Model appBarModel beSecondary; actionGroupToUse: #toolbar.
	layout := SlmdResponsiveLayoutModel new.
	layout paneLayout pane1: pane1Model.
	layout paneLayout pane2: pane2Model.
	layout layoutSettings colorThemeName: #cyan; fontFamily: #'var(--sl-font-serif)'.
	self setUpAppBar2.
	self setDetailWithIndex: 1.

]

{ #category : 'accessing' }
TBRootApplication >> setDetailAddNew [
	| detail |

	detail := SlmdItemWrapperModel onNewModel: TBPostModel new.

	self layout pane1 paneContent detail: detail.
	self layout pane2 setPaneContent: detail.

]

{ #category : 'accessing' }
TBRootApplication >> setDetailWithIndex: index [
	| list detail |

	list := self layout pane1 paneContent list.
	detail := list at: index.

	self layout pane1 paneContent detail: detail.
	self layout pane2 setPaneContent: detail.

]

{ #category : 'initialization' }
TBRootApplication >> setUpActionItems [

	self actionItems
		add: (self actionItemName: 'refesh' actionGroup: #primary iconName: 'arrow-clockwise' iconLabel: 'Refresh');
		add: (self actionItemName: 'create' actionGroup: #fab iconName: 'plus' iconLabel: 'Add').

]

{ #category : 'initialization' }
TBRootApplication >> setUpAppBar2 [

	self layout pane2 appBarModel
		actionItemsAdd: (self editItemNamed: #delete);
		actionItemsAdd: (self editItemNamed: #update);
		yourself.

]

{ #category : 'initialization' }
TBRootApplication >> setUpNavItems [

	self navItems
		add: (self navItemName: 'Settings' iconName: 'gear' iconLabel: 'Settings');
		add: (self navItemName: 'Home Page' iconName: 'house' iconLabel: 'Home').


]
