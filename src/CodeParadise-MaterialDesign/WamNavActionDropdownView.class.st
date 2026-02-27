Class {
	#name : 'WamNavActionDropdownView',
	#superclass : 'WamNavActionAbstractView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'web resources' }
WamNavActionDropdownView class >> beLoaded [

	WaPopup beLoaded
]

{ #category : 'web resources' }
WamNavActionDropdownView class >> style [
	<webResource: #css>

	^ '
.wam-nav-font {
  line-height: var(--wa-line-height-normal);
  font-size: var(--wa-font-size-medium);
  font-weight: var(--wa-font-weight-bold);
}

.wam-nav-dropdown::part(menu) {
  padding: 0;
}

.wam-navrail-item {
  display: flex;
  flex-flow: column;
  height: 56px;
  width: 96px;
  background: var(--wa-color-brand-fill-normal);
}

.wam-navrail-icon {
  font-size: 24px;
  line-height: 28px;
  padding-left: 33px;
  padding-top: 4px;
}

.wam-navrail-labelText {
  height: 24px;
  line-height: 18px;
  font-size: 14px;
  text-align: center;
  overflow-x: clip;
}

.wam-navrailx-item {
  display: flex;
  border-radius: 28px;
  height: 56px;
  width: 220px;
  align-items: center;
}

.wam-navrailx-icon {
  padding-left: 20px;
  font-size: 24px;
}

.wam-navrailx-labelText {
  padding-left: 16px;
  font-size: 16px;
}
'
]

{ #category : 'web resources' }
WamNavActionDropdownView class >> template [

	<webResource: #html>

	^ '
<wa-popup placement="right" hover-bridge shift>
  <slot></slot>
</wa-popup>'
]

{ #category : 'rendering' }
WamNavActionDropdownView >> dropdownElement [

	^ self shadowRoot firstDescendantMatching: WaPopup asCssSelector
]

{ #category : 'actions' }
WamNavActionDropdownView >> dropdownOpen: aBoolean [

	self dropdownElement active: aBoolean
]

{ #category : 'rendering' }
WamNavActionDropdownView >> renderNavExpandedDropdown: anItem [
	| div |

	div := self divExpanded: anItem.
	self dropdownElement
		when: CpPointerEnterEvent do: [ self dropdownOpen: true ] for: self;
		when: CpPointerLeaveEvent do: [ self dropdownOpen: false ] for: self;
		replaceAllChildrenWith: div atSlotNamed: #anchor.

]

{ #category : 'rendering' }
WamNavActionDropdownView >> renderNavNarrowDropdown: anItem [
	| div |

	div := self divNarrow: anItem.
	self dropdownElement
		when: CpPointerEnterEvent do: [ self dropdownOpen: true ] for: self;
		when: CpPointerLeaveEvent do: [ self dropdownOpen: false ] for: self;
		replaceAllChildrenWith: div atSlotNamed: #anchor.

]

{ #category : 'actions' }
WamNavActionDropdownView >> triggerNavEvent: aNavAction [

	self layoutViewLazy hideNavModal

]
