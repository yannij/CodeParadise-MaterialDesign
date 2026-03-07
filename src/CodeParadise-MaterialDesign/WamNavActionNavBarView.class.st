Class {
	#name : 'WamNavActionNavBarView',
	#superclass : 'WamNavActionAbstractView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'web resources' }
WamNavActionNavBarView class >> template [

	<webResource: #html>

	^ '<slot></slot>'
]

{ #category : 'rendering' }
WamNavActionNavBarView >> closeSubmenu [

	self dropdownElement open: false.

]

{ #category : 'rendering' }
WamNavActionNavBarView >> dropdownElement [

	^ self parent dropdownElement
]

{ #category : 'rendering' }
WamNavActionNavBarView >> navbarBuildItem: aNavAction [
	| iconName |

	iconName := aNavAction at: #iconName.

	^ #div asHtmlTag
		addClass: 'wam-navbar-item';
		addClass: 'wam-navbar-font';
		when: CpClickEvent basicPrimary do: [ self triggerNavEvent: aNavAction ] for: self;
		appendChild: (#div asHtmlTag
			addClass: 'wam-navbar-icon';
			appendChild: ((WaIcon fullyNamed: iconName) label: iconName; yourself);
			yourself);
		appendChild: (#div asHtmlTag
			addClass: 'wam-navbar-labelText';
			addClass: 'wa-text-truncate';
			styleAt: 'max-width' put: '200px';
			textContent: (aNavAction at: #iconLabel);
			yourself);
		yourself

]

{ #category : 'rendering' }
WamNavActionNavBarView >> renderNavBarItem: aNavAction [
	| element |

	element := self navbarBuildItem: aNavAction.
	self replaceAllChildrenWith: element atSlotNamed: nil.

]

{ #category : 'rendering' }
WamNavActionNavBarView >> triggerNavEvent: aNavAction [

	self closeSubmenu.
	super triggerNavEvent: aNavAction.

]
