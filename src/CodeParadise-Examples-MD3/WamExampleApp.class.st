"
I am a simple WebApplication based on Model-View-Presenter pattern.
I only live in the ServerEnvironment.
"
Class {
	#name : 'WamExampleApp',
	#superclass : 'WamWebApplication',
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

{ #category : 'accessing' }
WamExampleApp class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { WaElement package. WamView package }
]

{ #category : 'accessing' }
WamExampleApp class >> app [
	"self register"

	^ #'WAM-Example'
]

{ #category : 'accessing' }
WamExampleApp class >> appName [
	"Answer name to be shown in AppBar headline"

	^ #'WAM Example - CodeParadise'
]

{ #category : 'accessing' }
WamExampleApp >> applicationPresenterClass [

	^ WamExampleAppPresenter
]

{ #category : 'presenter' }
WamExampleApp >> clientBehaviorClass [

	^ WamExampleAppClientBehavior
]

{ #category : 'initialization' }
WamExampleApp >> initialize [
	| pane1Model pane2Model sidesheetModel appBar1 |

	super initialize.

	pane1Model := WamPaneModel on: (WamPaneContentModel on: (String loremIpsum: 4000)).
	pane2Model := WamPaneModel on: (WamPaneContentModel on: (String loremIpsum: 2000)).
	pane2Model appBarModel beSecondary.
	sidesheetModel := WamSidesheetModel on: (WamPaneContentModel on: (String loremIpsum: 1000)).
	layout := WamResponsiveLayoutModel new.
	layout paneLayout pane1: pane1Model.
	layout paneLayout pane2: pane2Model.
	layout paneLayout sidesheet: sidesheetModel.
	appBar1 := self layout appBar1.
	appBar1 headline: self class appName.
	appBar1 navActionItemsAddAll: (self navItemSpecsInGroup: appBar1 actionGroupToUse) 

]

{ #category : 'actions' }
WamExampleApp >> load [

	super load.

	"Add development tools"
	"self addViewInspector"
]

{ #category : 'as yet unclassified' }
WamExampleApp >> navItemsToUse [

	^ OrderedCollection new
		add: (self nativeEventSpecAt: #settingsOpen);
		add: (self nativeEventSpecAt: #login);
		addAll: super navItemsToUse;
		yourself.
]

{ #category : 'initialization' }
WamExampleApp >> navPopup1Items [

	^ OrderedCollection new
		addAll: (self userEventSpecs select: [ :each | each groupTag = #popup1 ]);
		yourself.
]

{ #category : 'initialization' }
WamExampleApp >> navPopup2Items [

	^ OrderedCollection new
		add: (WamNavActionModel newNavAction: #'spiral' groupTag: #popup2 iconName: 'spiral' iconLabel: 'Spiral popup' data: 'spiral popup');
		add: (WamNavActionModel newNavAction: #'burst' groupTag: #popup2 iconName: 'burst' iconLabel: 'Burst popup' data: 'burst popup');
		yourself.

]

{ #category : 'actions' }
WamExampleApp >> postLoad [

	super postLoad.

	self setUpPopup1.
	self setUpPopup2.

]

{ #category : 'initialization' }
WamExampleApp >> setUpCustomEvents [

	super setUpCustomEvents.

	self
		addNavActionAt: #'clover' groupTag: #primary iconName: 'clover' iconLabel: 'Clover' data: 'Clover Page';
		addNavActionAt: #'diamond' groupTag: #primary iconName: 'diamond' iconLabel: 'Diamond' data: 'Diamond Page';
		addNavActionAt: #'heart' groupTag: #primary iconName: 'heart' iconLabel: 'Heart' data: 'Heart Page';
		addNavActionAt: #'star' groupTag: #primary iconName: 'star' iconLabel: 'Star' data: 'Star Page';
		addNavActionAt: #'popup1' groupTag: #primary iconName: 'hexagon' iconLabel: 'Popup-1' data: #menu;
		addNavActionAt: #'square' groupTag: #popup1 iconName: 'square' iconLabel: 'Square popup' data: 'Square popup';
		addNavActionAt: #'pentagon' groupTag: #popup1 iconName: 'pentagon' iconLabel: 'Pentagon popup' data: 'Pentagon popup';
		addNavActionAt: #'octagon' groupTag: #popup1 iconName: 'octagon' iconLabel: 'Octagon popup' data: 'Octagon popup';
		addNavActionAt: #'circle' groupTag: #appBar1 iconName: 'circle' iconLabel: 'Circle' data: 'Circle Page';
		addNavActionAt: #'bookmark' groupTag: #appBar1 iconName: 'bookmark' iconLabel: 'Bookmark' data: 'Bookmark Page';
		addNavActionAt: #'certificate' groupTag: #appBar1 iconName: 'certificate' iconLabel: 'Certificate' data: 'Certificate Page';
		addNavActionAt: #'crown' groupTag: #appBar1 iconName: 'crown' iconLabel: 'Crown' data: 'Crown Page';
		addNavActionAt: #'square2' groupTag: #float iconName: 'square' iconLabel: 'Square2' data: 'Square2 Page';
		addNavActionAt: #'pentagon2' groupTag: #float iconName: 'pentagon' iconLabel: 'Pentagon2' data: 'Pentagon2 Page';
		addNavActionAt: #'star2' groupTag: #docked iconName: 'star' iconLabel: 'Star2' data: 'Star2 Page';
		addNavActionAt: #'octagon2' groupTag: #docked iconName: 'octagon' iconLabel: 'Octagon2' data: 'Octagon2 Page';
		yourself.

]

{ #category : 'actions' }
WamExampleApp >> setUpPopup1 [

	self layout popupsAt: #popup1 put: (WamNavPopup new popupItems: self navPopup1Items; yourself).
	self layout navRail valueChanged.

]

{ #category : 'initialization' }
WamExampleApp >> setUpPopup2 [

	self layout navRail
		navActionAdd: (WamNavActionModel newNavAction: #popup2 groupTag: #primary iconName: 'shapes' iconLabel: 'Popup-2' data: #menu).

	self layout popupsAt: #popup2 put: (WamNavPopup new popupItems: self navPopup2Items; yourself).
	self layout navRail valueChanged.

]

{ #category : 'as yet unclassified' }
WamExampleApp >> userEventSpecFAB [
	"Subclasses may override"

	^ nil
]
