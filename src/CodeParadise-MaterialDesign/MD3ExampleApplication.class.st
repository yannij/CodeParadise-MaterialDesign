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
	sidesheetModel := SlmdSidesheetModel new.
	layout := SlmdResponsiveLayoutModel new.
	layout paneLayout pane1: pane1Model.
	layout paneLayout pane2: pane2Model.
	navActions := OrderedCollection new
		add: (SlmdNavAction id: #settings iconName: 'gear' iconLabel: 'Settings' arg1: 'Settings');
		add: (SlmdNavAction id: #club iconName: 'suit-club' iconLabel: 'Club' arg1: 'Club Page');
		add: (SlmdNavAction id: #diamond iconName: 'suit-diamond' iconLabel: 'Diamond' arg1: 'Diamond Page');
		add: (SlmdNavAction id: #heart iconName: 'suit-heart' iconLabel: 'Heart' arg1: 'Heart Page');
		add: (SlmdNavAction id: #spade iconName: 'suit-spade' iconLabel: 'Spade' arg1: 'Spade Page');
		add: (SlmdNavAction id: #square1 iconName: '1-square' iconLabel: 'Square1' arg1: 'Square-1');
		add: (SlmdNavAction id: #square2 iconName: '2-square' iconLabel: 'Square2' arg1: 'Square-2');
		add: (SlmdNavAction id: #square3 iconName: '3-square' iconLabel: 'Square3' arg1: 'Square-3');
		yourself.
	actionItems := OrderedCollection new
		add: (SlmdNavAction id: #circle1 iconName: '1-circle' iconLabel: '1-circle' arg1: '1-circle');
		add: (SlmdNavAction id: #circle2 iconName: '2-circle' iconLabel: '2-circle' arg1: '2-circle');
		add: (SlmdNavAction id: #circle3 iconName: '3-circle' iconLabel: '3-circle' arg1: '3-circle');
		add: (SlmdNavAction id: #circle4 iconName: '4-circle' iconLabel: '4-circle' arg1: '4-circle');
		yourself.

]

{ #category : 'actions' }
MD3ExampleApplication >> load [

	super load.

	"Add development tools"
	"self addViewInspector"
]
