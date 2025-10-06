Class {
	#name : 'SlmdNavActionDropdownView',
	#superclass : 'SlmdNavActionView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'web resources' }
SlmdNavActionDropdownView class >> style [
	<webResource: #css>

	^ '
.smd-nav-font {
  line-height: var(--sl-line-height-normal);
  font-size: var(--sl-font-size-medium);
  font-weight: var(--sl-font-weight-bold);
}

.smd-navrail-item {
  display: flex;
  flex-flow: column;
  height: 56px;
  width: 96px;
  padding-top: 12px;
}

.smd-navrail-icon {
  font-size: 24px;
  padding-left: 28px;
}

.smd-navrail-labelText {
  padding: 0;
  line-height: 16px;
  font-size: var(--sl-font-size-x-small);
  align-items: center;
  text-align: center;
  overflow-x: clip;
}

.smd-navrailx-item {
  display: flex;
  border-radius: 28px;
  height: 56px;
  width: 220px;
  background: var(--sl-color-primary-100);
  align-items: center;
}

.smd-navrailx-icon {
  padding-left: 8px;
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

	^ '<sl-dropdown placement="right-start">
  <slot name="content"></slot>
</sl-dropdown>'
]

{ #category : 'rendering' }
SlmdNavActionDropdownView >> dropdownElement [

	^ self shadowRoot firstDescendantMatching: SlDropdown asCssSelector
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
SlmdNavActionDropdownView >> renderNavDropdown: anItem [
	| div |

	div := self divNarrow: anItem.
	div when: CpPointerEnterEvent do: [ self dropdownOpen: true ] for: self.
	"div when: CpPointerLeaveEvent do: [ self dropdownOpen: false ] for: self."
	self dropdownElement replaceAllChildrenWith: div atSlotNamed: #trigger.

]
