Class {
	#name : 'SlmdNavActionDropdownView',
	#superclass : 'SlmdNavActionView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

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

{ #category : 'rendering' }
SlmdNavActionDropdownView >> renderNavDropdown: anItem [
	| div |

	div := self divNarrow: anItem.
	self dropdownElement replaceAllChildrenWith: div atSlotNamed: #trigger.

]
