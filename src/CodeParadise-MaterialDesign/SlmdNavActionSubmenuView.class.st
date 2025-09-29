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
		addClass: 'smd-navrail-item';
		"appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-icon';
				appendChild: (SlIconButton named: (aNavAction at: #iconName));
				yourself);"
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-labelText';
				textContent: (aNavAction at: #iconLabel);
				yourself);
		yourself.

	div when: CpClickEvent basicPrimary do: [ self handleNavAction: aNavAction ] for: self.

	^ div

]

{ #category : 'actions' }
SlmdNavActionSubmenuView >> handleNavAction: aNavAction [

	self layoutViewLazy popupBeNotActive: (aNavAction at: #groupTag).

	super handleNavAction: aNavAction.

]

{ #category : 'rendering' }
SlmdNavActionSubmenuView >> renderNavSubmenu: anItem [
	| element |

	element := self divSubmenu: anItem.
	self replaceAllChildrenWith: element atSlotNamed: #content.

]
