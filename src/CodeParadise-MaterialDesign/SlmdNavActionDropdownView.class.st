Class {
	#name : 'SlmdNavActionDropdownView',
	#superclass : 'SlmdNavActionView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'web resources' }
SlmdNavActionDropdownView class >> beLoaded [

	WaPopup beLoaded
]

{ #category : 'web resources' }
SlmdNavActionDropdownView class >> style [
	<webResource: #css>

	^ '
.smd-nav-font {
  line-height: var(--wa-line-height-normal);
  font-size: var(--wa-font-size-medium);
  font-weight: var(--wa-font-weight-bold);
}

.smd-nav-dropdown::part(menu) {
  padding: 0;
}

.smd-navrail-item {
  display: flex;
  flex-flow: column;
  height: 56px;
  width: 96px;
  background: var(--wa-color-brand-fill-normal);
}

.smd-navrail-icon {
  font-size: 24px;
  line-height: 28px;
  padding-left: 33px;
  padding-top: 4px;
}

.smd-navrail-labelText {
  height: 24px;
  line-height: 18px;
  font-size: 14px;
  text-align: center;
  overflow-x: clip;
}

.smd-navrailx-item {
  display: flex;
  border-radius: 28px;
  height: 56px;
  width: 220px;
  align-items: center;
}

.smd-navrailx-icon {
  padding-left: 20px;
  font-size: 24px;
}

.smd-navrailx-labelText {
  padding-left: 16px;
  font-size: 16px;
}
'
]

{ #category : 'web resources' }
SlmdNavActionDropdownView class >> template [

	<webResource: #html>

	^ '
<wa-popup placement="right" hover-bridge shift>
  <slot name="content"></slot>
</wa-popup>'
]

{ #category : 'rendering' }
SlmdNavActionDropdownView >> dropdownElement [

	^ self shadowRoot firstDescendantMatching: WaPopup asCssSelector
]

{ #category : 'actions' }
SlmdNavActionDropdownView >> dropdownOpen: aBoolean [

	self dropdownElement active: aBoolean
]

{ #category : 'rendering' }
SlmdNavActionDropdownView >> renderNavExpandedDropdown: anItem [
	| div |

	div := self divExpanded: anItem.
	self dropdownElement
		when: CpPointerEnterEvent do: [ self dropdownOpen: true ] for: self;
		when: CpPointerLeaveEvent do: [ self dropdownOpen: false ] for: self;
		replaceAllChildrenWith: div atSlotNamed: #anchor.

]

{ #category : 'rendering' }
SlmdNavActionDropdownView >> renderNavNarrowDropdown: anItem [
	| div |

	div := self divNarrow: anItem.
	self dropdownElement
		when: CpPointerEnterEvent do: [ self dropdownOpen: true ] for: self;
		when: CpPointerLeaveEvent do: [ self dropdownOpen: false ] for: self;
		replaceAllChildrenWith: div atSlotNamed: #anchor.

]

{ #category : 'actions' }
SlmdNavActionDropdownView >> triggerNavEvent: aNavAction [

	self layoutViewLazy hideNavModal

]
