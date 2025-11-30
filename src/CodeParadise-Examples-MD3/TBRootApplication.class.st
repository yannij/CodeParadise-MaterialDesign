Class {
	#name : 'TBRootApplication',
	#superclass : 'SlmdWebApplication',
	#category : 'CodeParadise-Examples-MD3-TinyBlog',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'TinyBlog'
}

{ #category : 'accessing' }
TBRootApplication class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { WaElement package. SlmdView package }
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

{ #category : 'initialization' }
TBRootApplication >> allModels [

	^ TBBlogModel current allBlogPosts
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
	pane1Content listSet: self allModels.
	pane1Model := SlmdPaneModel on: pane1Content.
	pane2Model := SlmdPaneModel new.
	pane2Model appBarModel beSecondary; actionGroupToUse: #toolbar.
	layout := SlmdResponsiveLayoutModel new.
	layout paneLayout pane1: pane1Model.
	layout paneLayout pane2: pane2Model.
	layout layoutSettings colorThemeName: #cyan; fontFamily: #'serif'.
	self setUpAppBar1.
	self setUpAppBar2.
	self layout appBar1 headline: self class appName.
	self setDetailWithIndex: 1.

]

{ #category : 'initialization' }
TBRootApplication >> modelAdd: aModel [

	TBBlogModel current writeBlogPost: aModel.

]

{ #category : 'accessing' }
TBRootApplication >> modelClass [

	^ TBPostModel
]

{ #category : 'initialization' }
TBRootApplication >> modelRemove: aModel [

	TBBlogModel current removeBlogPost: aModel.

]

{ #category : 'accessing' }
TBRootApplication >> navItemsToUse [

	^ OrderedCollection new
		add: (self nativeEventSpecAt: #home);
		add: (self nativeEventSpecAt: #settingsOpen);
		yourself.
]

{ #category : 'events' }
TBRootApplication >> refresh [

	self setDetailWithIndex: 1.

]

{ #category : 'initialization' }
TBRootApplication >> setUpAppBar1 [

	self layout pane1 appBarModel
		navActionItemsAdd: (self nativeEventSpecAt: #refresh);
		yourself.

]

{ #category : 'initialization' }
TBRootApplication >> setUpAppBar2 [

	self layout pane2 appBarModel
		navActionItemsAdd: (self nativeEventSpecAt: #delete);
		navActionItemsAdd: (self nativeEventSpecAt: #update);
		yourself.

]
