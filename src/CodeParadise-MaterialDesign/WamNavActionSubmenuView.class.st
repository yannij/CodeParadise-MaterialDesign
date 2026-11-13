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
WamNavActionSubmenuView >> divSubmenu: aDictionary [
	| iconName |

	iconName := aDictionary at: #iconName.

	^ #div asHtmlTag
		addClass: 'wam-navsubmenu-item';
		when: CpClickEvent basicPrimary do: [ self triggerNavEvent: (WamNavActionEvent fromDictionary: aDictionary) ] for: self;
		appendChild: (
			#div asHtmlTag
				addClass: 'wam-navsubmenu-icon';
				appendChild: ((WaIcon fullyNamed: iconName) label: iconName; yourself);
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'wam-navsubmenu-labelText';
				addClass: 'wa-text-truncate';
				textContent: (aDictionary at: #iconLabel);
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
WamNavActionSubmenuView >> triggerNavEventPre: aNavAction [

	self closeSubmenu.

]
