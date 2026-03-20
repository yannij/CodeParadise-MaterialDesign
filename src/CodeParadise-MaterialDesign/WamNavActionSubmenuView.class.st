Class {
	#name : 'WamNavActionSubmenuView',
	#superclass : 'WamNavActionAbstractView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'actions' }
WamNavActionSubmenuView >> closeSubmenu [

	self dropdownElement active: false.

]

{ #category : 'rendering' }
WamNavActionSubmenuView >> divSubmenu: aNavAction [
	| iconName |

	iconName := aNavAction at: #iconName.

	^ #div asHtmlTag
		addClass: 'wam-navsubmenu-item';
		when: CpClickEvent basicPrimary do: [ self triggerNavEvent: aNavAction ] for: self;
		appendChild: (
			#div asHtmlTag
				addClass: 'wam-navsubmenu-icon';
				appendChild: ((WaIcon fullyNamed: iconName) label: iconName; yourself);
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'wam-navsubmenu-labelText';
				addClass: 'wa-text-truncate';
				textContent: (aNavAction at: #iconLabel);
				yourself);
		yourself.

]

{ #category : 'rendering' }
WamNavActionSubmenuView >> dropdownElement [

	^ self parent dropdownElement
]

{ #category : 'rendering' }
WamNavActionSubmenuView >> renderNavSubmenu: anItem [
	| element |

	element := self divSubmenu: anItem.
	self replaceAllChildrenWith: element atSlotNamed: nil.

]

{ #category : 'actions' }
WamNavActionSubmenuView >> triggerNavEvent: aNavAction [

	self closeSubmenu.
	super triggerNavEvent: aNavAction.

]
