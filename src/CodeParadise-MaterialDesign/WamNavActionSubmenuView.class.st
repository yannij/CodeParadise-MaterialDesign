Class {
	#name : 'WamNavActionSubmenuView',
	#superclass : 'WamNavActionView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
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
		addClass: 'smd-navsubmenu-item';
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navsubmenu-icon';
				appendChild: ((WaIcon fullyNamed: iconName) label: iconName; yourself);
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navsubmenu-labelText';
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
	element when: CpClickEvent basicPrimary do: [ self triggerNavEvent: anItem ] for: self.
	self replaceAllChildrenWith: element atSlotNamed: #content.

]

{ #category : 'actions' }
WamNavActionSubmenuView >> triggerNavEvent: aNavAction [

	self closeSubmenu.
	super triggerNavEvent: aNavAction.

]
