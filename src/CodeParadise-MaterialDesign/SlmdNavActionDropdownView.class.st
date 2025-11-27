Class {
	#name : 'SlmdNavActionDropdownView',
	#superclass : 'SlmdNavActionView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

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
  background: var(--wa-color-brand-80);
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

	^ '<wa-dropdown placement="right-start" class="smd-nav-dropdown">
  <slot name="content"></slot>
</wa-dropdown>'
]

{ #category : 'rendering' }
SlmdNavActionDropdownView >> dropdownElement [

	^ self shadowRoot firstDescendantMatching: WaDropdown asCssSelector
]

{ #category : 'actions' }
SlmdNavActionDropdownView >> dropdownOpen: aBoolean [

	self dropdownElement open: aBoolean
]

{ #category : 'actions' }
SlmdNavActionDropdownView >> handleNavAction: aNavAction [

	self layoutViewLazy hideNavModal

]

{ #category : 'rendering' }
SlmdNavActionDropdownView >> renderNavExpandedDropdown: anItem [
	| div |

	div := self divExpanded: anItem.
	div when: CpPointerEnterEvent do: [ self dropdownOpen: true ] for: self.
	"div when: CpPointerLeaveEvent do: [ self dropdownOpen: false ] for: self."
	self dropdownElement replaceAllChildrenWith: div atSlotNamed: #trigger.

]

{ #category : 'rendering' }
SlmdNavActionDropdownView >> renderNavNarrowDropdown: anItem [
	| div |

	div := self divNarrow: anItem.
	div when: CpPointerEnterEvent do: [ self dropdownOpen: true ] for: self.
	"div when: CpPointerLeaveEvent do: [ self dropdownOpen: false ] for: self."
	self dropdownElement replaceAllChildrenWith: div atSlotNamed: #trigger.

]
