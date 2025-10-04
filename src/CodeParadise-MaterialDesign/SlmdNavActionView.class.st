Class {
	#name : 'SlmdNavActionView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'web resources' }
SlmdNavActionView class >> globalStyle [
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

.smd-navsubmenu-item {
  display: flex;
  height: 56px;
  width: 220px;
  background: var(--sl-color-primary-100);
  align-items: center;
}

.smd-navsubmenu-icon {
  padding-left: 8px;
  font-size: 24px;
}

.smd-navsubmenu-labelText {
  padding-left: 16px;
  font-size: 16px;
}
'
]

{ #category : 'web resources' }
SlmdNavActionView class >> template [

	<webResource: #html>

	^ '<slot name="content"></slot>'
]

{ #category : 'rendering' }
SlmdNavActionView >> divExpanded: aNavAction [

	^ #div asHtmlTag
		addClass: 'smd-navrailx-item';
		addClass: 'smd-nav-font';
		appendChild: (
			(SlIconButton named: (aNavAction at: #iconName)) addClass: 'smd-navrailx-icon'; yourself);
		appendChild: (#div asHtmlTag
			addClass: 'smd-navrailx-labelText';
			textContent: (aNavAction at: #iconLabel);
			yourself);
		yourself
]

{ #category : 'rendering' }
SlmdNavActionView >> divNarrow: aNavAction [

	^ #div asHtmlTag
		addClass: 'smd-navrail-item';
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-icon';
				appendChild: (SlIconButton named: (aNavAction at: #iconName));
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-labelText';
				textContent: (aNavAction at: #iconLabel);
				yourself);
		yourself.

]

{ #category : 'actions' }
SlmdNavActionView >> handleNavAction: aNavAction [

	(aNavAction at: #data) = #menu
		"ifTrue: [
			self layoutViewLazy popupToggleActive: (aNavAction at: #subtype); hideNavModal ]"
		ifTrue: [
			self layoutViewLazy "dropdownOpen: (aNavAction at: #subtype);" hideNavModal ]
		ifFalse: [
			self layoutViewLazy triggerUserEvent: aNavAction; hideNavModal ].

]

{ #category : 'rendering' }
SlmdNavActionView >> renderNavExpanded: anItem [
	| element |

	element := self divExpanded: anItem.
	element when: CpClickEvent basicPrimary do: [ self handleNavAction: anItem ] for: self.
	self replaceAllChildrenWith: element atSlotNamed: #content.

]

{ #category : 'rendering' }
SlmdNavActionView >> renderNavNarrow: anItem [
	| element |

	element := self divNarrow: anItem.

	"(anItem at: #data) = #menu" false
		ifTrue: [
			element := SlDropdown new
				placementRightStart;
				appendChild: element atSlotNamed: #trigger;
				appendChild: ('HELLO' asHtmlElement);
				yourself ]
		ifFalse: [
			element when: CpClickEvent basicPrimary do: [ self handleNavAction: anItem ] for: self ].

	self replaceAllChildrenWith: element atSlotNamed: #content.

]
