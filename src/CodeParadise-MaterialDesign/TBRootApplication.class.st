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
		add: (SlmdNavAction id: #slmdRefresh iconName: 'arrow-clockwise' iconLabel: 'Refresh' actionName: #action actionGroup: #primary arg1: 'refresh');
		add: (SlmdNavAction id: #crudCreate iconName: 'plus' iconLabel: 'Add' actionName: #action actionGroup: #fab arg1: 'create');
		add: (SlmdNavAction id: #crudRead iconName: 'file-ruled' iconLabel: 'View' actionName: #action actionGroup: #toolbar arg1: 'read');
		add: (SlmdNavAction id: #crudDelete iconName: 'trash' iconLabel: 'Delete' actionName: #action actionGroup: #toolbar arg1: 'delete');
		add: (SlmdNavAction id: #crudUpdate iconName: 'pencil' iconLabel: 'Edit' actionName: #action actionGroup: #toolbar arg1: 'update');
		add: (SlmdNavAction id: #crudSave iconName: 'check' iconLabel: 'Save' actionName: #action actionGroup: #toolbar arg1: 'save');
		add: (SlmdNavAction id: #crudCancel iconName: 'x' iconLabel: 'Cancel' actionName: #action actionGroup: #toolbar arg1: 'cancel').

]

{ #category : 'initialization' }
TBRootApplication >> setUpAppBar2 [

	self layout pane2 appBarModel
		actionItemsAdd: (self actionItemNamed: #crudDelete);
		actionItemsAdd: (self actionItemNamed: #crudUpdate);
		yourself.

]

{ #category : 'initialization' }
TBRootApplication >> setUpNavItems [

	self navItems
		add: (SlmdNavAction id: #settings iconName: 'gear' iconLabel: 'Settings' arg1: 'Settings');
		add: (SlmdNavAction id: #home iconName: 'house' iconLabel: 'Home' arg1: 'Home Page').


]
