"
I am a simple WebApplication based on Model-View-Presenter pattern.
I only live in the ServerEnvironment.
"
Class {
	#name : 'MD3ExampleApplication',
	#superclass : 'SlmdWebApplication',
	#category : 'CodeParadise-MaterialDesign-SimpleDemoApp',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'SimpleDemoApp'
}

{ #category : 'accessing' }
MD3ExampleApplication class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { SlElement package }
]

{ #category : 'accessing' }
MD3ExampleApplication class >> app [
	"self register"

	^ #'Shoelace-MD3'
]

{ #category : 'accessing' }
MD3ExampleApplication class >> appName [
	"Answer name to be shown in AppBar headline"

	^ #'MD3 Example - CodeParadise'
]

{ #category : 'accessing' }
MD3ExampleApplication >> applicationPresenterClass [

	^ MD3ExampleApplicationPresenter
]

{ #category : 'initialization' }
MD3ExampleApplication >> initialize [
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
MD3ExampleApplication >> load [

	super load.

	"Add development tools"
	"self addViewInspector"
]

{ #category : 'initialization' }
MD3ExampleApplication >> setUpActionItems [

	self actionItems
		add: (self actionItemName: '1-circle' actionGroup: #primary iconName: '1-circle' iconLabel: '1-circle');
		add: (self actionItemName: '2-circle' actionGroup: #primary  iconName: '2-circle' iconLabel: '2-circle');
		add: (self actionItemName: '3-circle' actionGroup: #primary  iconName: '3-circle' iconLabel: '3-circle' );
		add: (self actionItemName: '4-circle' actionGroup: #primary  iconName: '4-circle' iconLabel: '4-circle' );
		yourself.

]

{ #category : 'initialization' }
MD3ExampleApplication >> setUpNavItems [

	self navItems
		add: (self navItemName: 'Settings' iconName: 'gear' iconLabel: 'Settings');
		add: (self navItemName: 'Club Page' iconName: 'suit-club' iconLabel: 'Club');
		add: (self navItemName: 'Diamond Page' iconName: 'suit-diamond' iconLabel: 'Diamond');
		add: (self navItemName: 'Heart Page' iconName: 'suit-heart' iconLabel: 'Heart');
		add: (self navItemName: 'Spade Page' iconName: 'suit-spade' iconLabel: 'Spade');
		add: (self navItemName: 'Square-1' iconName: '1-square' iconLabel: 'Square1');
		add: (self navItemName: 'Square-2' iconName: '2-square' iconLabel: 'Square2');
		add: (self navItemName: 'Square-3' iconName: '3-square' iconLabel: 'Square3');
		yourself.

]
