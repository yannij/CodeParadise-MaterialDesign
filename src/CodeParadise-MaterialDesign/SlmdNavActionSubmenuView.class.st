Class {
	#name : 'SlmdNavActionSubmenuView',
	#superclass : 'SlmdNavActionView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
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
				textContent: (aNavAction at: #iconLabel);
				yourself);
		yourself.

]

{ #category : 'rendering' }
SlmdNavActionSubmenuView >> dropdownElement [

	^ self parent dropdownElement
]

{ #category : 'actions' }
SlmdNavActionSubmenuView >> handleNavAction: aNavAction [

	self closeSubmenu.
	super handleNavAction: aNavAction.

]

{ #category : 'rendering' }
SlmdNavActionSubmenuView >> renderNavSubmenu: anItem [
	| element |

	element := self divSubmenu: anItem.
	element when: CpClickEvent basicPrimary do: [ self handleNavAction: anItem ] for: self.
	self replaceAllChildrenWith: element atSlotNamed: #content.

]
