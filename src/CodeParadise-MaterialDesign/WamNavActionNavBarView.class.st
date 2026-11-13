Class {
	#name : 'WamNavActionNavBarView',
	#superclass : 'WamNavActionAbstractView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
WamNavActionNavBarView >> closeSubmenu [

	self dropdownElement open: false.

]

{ #category : 'rendering' }
WamNavActionNavBarView >> dropdownElement [

	^ self parent dropdownElement
]

{ #category : 'rendering' }
WamNavActionNavBarView >> navbarBuildItem: aDictionary [
	| iconName |

	iconName := aDictionary at: #iconName.

	^ #div asHtmlTag
		addClass: 'wam-navbar-item';
		addClass: 'wam-navbar-font';
		when: CpClickEvent basicPrimary do: [ self triggerNavEvent: (WamNavActionEvent fromDictionary: aDictionary) ] for: self;
		appendChild: (#div asHtmlTag
			addClass: 'wam-navbar-icon';
			appendChild: ((WaIcon fullyNamed: iconName) label: iconName; yourself);
			yourself);
		appendChild: (#div asHtmlTag
			addClass: 'wam-navbar-labelText';
			addClass: 'wa-text-truncate';
			styleAt: 'max-width' put: '200px';
			textContent: (aDictionary at: #iconLabel);
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
WamNavActionNavBarView >> triggerNavEventPre: aNavAction [

	self closeSubmenu.

]
