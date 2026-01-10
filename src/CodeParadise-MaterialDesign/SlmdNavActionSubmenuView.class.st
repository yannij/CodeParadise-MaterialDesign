Class {
	#name : 'SlmdNavActionSubmenuView',
	#superclass : 'SlmdNavActionView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'actions' }
SlmdNavActionSubmenuView >> closeSubmenu [

	self dropdownElement open: false.

]

{ #category : 'rendering' }
SlmdNavActionSubmenuView >> divSubmenu: aNavAction [
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
SlmdNavActionSubmenuView >> dropdownElement [

	^ self parent dropdownElement
]

{ #category : 'rendering' }
SlmdNavActionSubmenuView >> renderNavSubmenu: anItem [
	| element |

	element := self divSubmenu: anItem.
	element when: CpClickEvent basicPrimary do: [ self triggerNavEvent: anItem ] for: self.
	self replaceAllChildrenWith: element atSlotNamed: #content.

]

{ #category : 'actions' }
SlmdNavActionSubmenuView >> triggerNavEvent: aNavAction [

	self closeSubmenu.
	super triggerNavEvent: aNavAction.

]
