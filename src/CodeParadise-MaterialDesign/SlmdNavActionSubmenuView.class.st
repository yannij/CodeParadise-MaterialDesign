Class {
	#name : 'SlmdNavActionSubmenuView',
	#superclass : 'SlmdNavActionView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
SlmdNavActionSubmenuView >> divSubmenu: aNavAction [
	| div |

	div := #div asHtmlTag
		addClass: 'smd-navsubmenu-item';
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navsubmenu-icon';
				appendChild: (SlIconButton named: (aNavAction at: #iconName));
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navsubmenu-labelText';
				textContent: (aNavAction at: #iconLabel);
				yourself);
		yourself.

	div when: CpClickEvent basicPrimary do: [ self handleNavAction: aNavAction ] for: self.

	^ div

]

{ #category : 'rendering' }
SlmdNavActionSubmenuView >> renderNavSubmenu: anItem [
	| element |

	element := self divSubmenu: anItem.
	self replaceAllChildrenWith: element atSlotNamed: #content.

]
