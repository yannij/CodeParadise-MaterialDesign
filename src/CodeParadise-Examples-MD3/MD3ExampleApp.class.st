"
I am a simple WebApplication based on Model-View-Presenter pattern.
I only live in the ServerEnvironment.
"
Class {
	#name : 'MD3ExampleApp',
	#superclass : 'WamWebApplication',
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

{ #category : 'accessing' }
MD3ExampleApp class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { WaElement package. WamView package }
]

{ #category : 'accessing' }
MD3ExampleApp class >> app [
	"self register"

	^ #'MD3-Example'
]

{ #category : 'accessing' }
MD3ExampleApp class >> appName [
	"Answer name to be shown in AppBar headline"

	^ #'MD3 Example - CodeParadise'
]

{ #category : 'accessing' }
MD3ExampleApp >> applicationPresenterClass [

	^ MD3ExampleAppPresenter
]

{ #category : 'presenter' }
MD3ExampleApp >> clientBehaviorClass [

	^ MD3ExampleAppClientBehavior
]

{ #category : 'initialization' }
MD3ExampleApp >> initialize [
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
	appBar1 navActionItemsAddAll: (self actionItemsInGroup: appBar1 actionGroupToUse) 

]

{ #category : 'actions' }
MD3ExampleApp >> load [

	super load.

	"Add development tools"
	"self addViewInspector"
]

{ #category : 'as yet unclassified' }
MD3ExampleApp >> navItemsToUse [

	^ OrderedCollection new
		add: (self nativeEventSpecAt: #settingsOpen);
		add: (self nativeEventSpecAt: #login);
		addAll: super navItemsToUse;
		yourself.
]

{ #category : 'initialization' }
MD3ExampleApp >> navPopup1Items [

	^ OrderedCollection new
		addAll: (self navItemsSpecs select: [ :each | each groupTag = #popup1 ]);
		yourself.
]

{ #category : 'initialization' }
MD3ExampleApp >> navPopup2Items [

	^ OrderedCollection new
		add: (WamNavActionModel newNavSubtype: #'spiral' groupTag: #popup2 iconName: 'spiral' iconLabel: 'Spiral popup' data: 'spiral popup');
		add: (WamNavActionModel newNavSubtype: #'burst' groupTag: #popup2 iconName: 'burst' iconLabel: 'Burst popup' data: 'burst popup');
		yourself.

]

{ #category : 'actions' }
MD3ExampleApp >> postLoad [

	super postLoad.

	self setUpPopup1.
	self setUpPopup2.

]

{ #category : 'initialization' }
MD3ExampleApp >> setUpCustomEvents [

	super setUpCustomEvents.

	self
		addActionSubtype: #'circle' groupTag: #primary iconName: 'circle' iconLabel: 'Circle';
		addActionSubtype: #'bookmark' groupTag: #primary  iconName: 'bookmark' iconLabel: 'Bookmark';
		addActionSubtype: #'certificate' groupTag: #primary  iconName: 'certificate' iconLabel: 'Certificate' ;
		addActionSubtype: #'crown' groupTag: #primary  iconName: 'crown' iconLabel: 'Crown' ;
		addActionSubtype: #'square' groupTag: #float iconName: 'square' iconLabel: 'Square';
		addActionSubtype: #'pentagon' groupTag: #float iconName: 'pentagon' iconLabel: 'Pentagon';
		addActionSubtype: #'star' groupTag: #docked iconName: 'star' iconLabel: 'Star';
		addActionSubtype: #'octagon' groupTag: #docked iconName: 'octagon' iconLabel: 'Octagon';
		yourself.

	self
		addNavSubtype: #'clover' groupTag: #primary iconName: 'clover' iconLabel: 'Clover' data: 'Clover Page';
		addNavSubtype: #'diamond' groupTag: #primary iconName: 'diamond' iconLabel: 'Diamond' data: 'Diamond Page';
		addNavSubtype: #'heart' groupTag: #primary iconName: 'heart' iconLabel: 'Heart' data: 'Heart Page';
		addNavSubtype: #'star' groupTag: #primary iconName: 'star' iconLabel: 'Star' data: 'Star Page';
		addNavSubtype: #'popup1' groupTag: #primary iconName: 'hexagon' iconLabel: 'Popup-1' data: #menu;
		addNavSubtype: #'square' groupTag: #popup1 iconName: 'square' iconLabel: 'Square popup' data: 'Square popup';
		addNavSubtype: #'pentagon' groupTag: #popup1 iconName: 'pentagon' iconLabel: 'Pentagon popup' data: 'Pentagon popup';
		addNavSubtype: #'octagon' groupTag: #popup1 iconName: 'octagon' iconLabel: 'Octagon popup' data: 'Octagon popup';
		yourself.

]

{ #category : 'actions' }
MD3ExampleApp >> setUpPopup1 [

	self layout popupsAt: #popup1 put: (WamNavPopup new popupItems: self navPopup1Items; yourself).
	self layout navRail valueChanged.

]

{ #category : 'initialization' }
MD3ExampleApp >> setUpPopup2 [

	self layout navRail
		navActionAdd: (WamNavActionModel newNavSubtype: #popup2 groupTag: #primary iconName: 'shapes' iconLabel: 'Popup-2' data: #menu).

	self layout popupsAt: #popup2 put: (WamNavPopup new popupItems: self navPopup2Items; yourself).
	self layout navRail valueChanged.

]

{ #category : 'as yet unclassified' }
MD3ExampleApp >> userEventSpecFAB [
	"Subclasses may override"

	^ nil
]
