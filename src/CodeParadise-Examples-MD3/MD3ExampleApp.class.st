"
I am a simple WebApplication based on Model-View-Presenter pattern.
I only live in the ServerEnvironment.
"
Class {
	#name : 'MD3ExampleApp',
	#superclass : 'SlmdWebApplication',
	#category : 'CodeParadise-Examples-MD3-SimpleDemo',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'SimpleDemo'
}

{ #category : 'accessing' }
MD3ExampleApp class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { SlElement package. SlmdView package }
]

{ #category : 'accessing' }
MD3ExampleApp class >> app [
	"self register"

	^ #'Shoelace-MD3'
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
	| pane1Model pane2Model |

	super initialize.

	pane1Model := SlmdPaneModel on: (SlmdPaneContentModel on: 'Initial Pane1...').
	pane2Model := SlmdPaneModel on: (SlmdPaneContentModel on: 'Initial Pane2...').
	pane2Model appBarModel beSecondary.
	layout := SlmdResponsiveLayoutModel new.
	layout paneLayout pane1: pane1Model.
	layout paneLayout pane2: pane2Model.

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
		add: (SlmdNavActionModel newNavSubtype: #'1-circle' groupTag: #popup2 iconName: '1-circle' iconLabel: 'Circle1 popup' data: 'Circle1 popup');
		add: (SlmdNavActionModel newNavSubtype: #'2-circle' groupTag: #popup2 iconName: '2-circle' iconLabel: 'Circle2 popup' data: 'Circle2 popup');
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
		addActionSubtype: #'1-circle' groupTag: #primary iconName: '1-circle' iconLabel: '1-circle';
		addActionSubtype: #'2-circle' groupTag: #primary  iconName: '2-circle' iconLabel: '2-circle';
		addActionSubtype: #'3-circle' groupTag: #primary  iconName: '3-circle' iconLabel: '3-circle' ;
		addActionSubtype: #'4-circle' groupTag: #primary  iconName: '4-circle' iconLabel: '4-circle' ;
		addActionSubtype: #'1-square' groupTag: #float iconName: '1-square' iconLabel: 'Square1';
		addActionSubtype: #'2-square' groupTag: #float iconName: '2-square' iconLabel: 'Square2';
		addActionSubtype: #'3-square' groupTag: #docked iconName: '3-square' iconLabel: 'Square3';
		addActionSubtype: #'1-square' groupTag: #docked iconName: '1-square' iconLabel: 'Square1';
		yourself.

	self
		addNavSubtype: #'suit-club' groupTag: #primary iconName: 'suit-club' iconLabel: 'Club' data: 'Club Page';
		addNavSubtype: #'suit-diamond' groupTag: #primary iconName: 'suit-diamond' iconLabel: 'Diamond' data: 'Diamond Page';
		addNavSubtype: #'suit-heart' groupTag: #primary iconName: 'suit-heart' iconLabel: 'Heart' data: 'Heart Page';
		addNavSubtype: #'suit-spade' groupTag: #primary iconName: 'suit-spade' iconLabel: 'Spade' data: 'Spade Page';
		addNavSubtype: #'popup1' groupTag: #primary iconName: 'hexagon' iconLabel: 'Popup-1' data: #menu;
		addNavSubtype: #'1-square' groupTag: #popup1 iconName: '1-square' iconLabel: 'Square1 popup' data: 'Square1 popup';
		addNavSubtype: #'2-square' groupTag: #popup1 iconName: '2-square' iconLabel: 'Square2 popup' data: 'Square2 popup';
		addNavSubtype: #'3-square' groupTag: #popup1 iconName: '3-square' iconLabel: 'Square3 popup' data: 'Square3 popup';
		yourself.

]

{ #category : 'actions' }
MD3ExampleApp >> setUpPopup1 [

	self layout popupsAt: #popup1 put: (SlmdNavPopup new popupItems: self navPopup1Items; yourself).
	self layout navRail valueChanged.

]

{ #category : 'initialization' }
MD3ExampleApp >> setUpPopup2 [

	self layout navRail
		navActionAdd: (SlmdNavActionModel newNavSubtype: #popup2 groupTag: #primary iconName: 'hexagon' iconLabel: 'Popup-2' data: #menu).

	self layout popupsAt: #popup2 put: (SlmdNavPopup new popupItems: self navPopup2Items; yourself).
	self layout navRail valueChanged.

]

{ #category : 'as yet unclassified' }
MD3ExampleApp >> userEventSpecFAB [
	"Subclasses may override"

	^ nil
]
