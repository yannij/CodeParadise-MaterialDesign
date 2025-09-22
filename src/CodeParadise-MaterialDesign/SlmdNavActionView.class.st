Class {
	#name : 'SlmdNavActionView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'web resources' }
SlmdNavActionView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <slot name="content"></slot>
</div>'
]

{ #category : 'rendering' }
SlmdNavActionView >> buttonCssClass [

	^ 'smd-toolbar-buttons'
]

{ #category : 'actions' }
SlmdNavActionView >> handleNavAction: aNavAction [

	self layoutViewLazy 
		triggerUserEvent: aNavAction;
		hideNavModal

]

{ #category : 'rendering' }
SlmdNavActionView >> navrailExpandedBuildItem: aNavAction [
	| iconName |

	iconName := aNavAction at: #iconName.

	^ #div asHtmlTag
		addClass: 'smd-navrailx-item';
		addClass: 'smd-nav-font';
		when: CpClickEvent basicPrimary do: [ self handleNavAction: aNavAction ] for: self;
		appendChild: ((SlIconButton named: iconName) addClass: 'smd-navrailx-icon'; yourself);
		appendChild: (#div asHtmlTag
			addClass: 'smd-navrailx-labelText';
			textContent: (aNavAction at: #iconLabel);
			yourself);
		yourself
]

{ #category : 'rendering' }
SlmdNavActionView >> navrailNarrowBuildItem: aNavAction [
	| iconName |

	iconName := aNavAction at: #iconName.

	"(aNavAction at: #data) = #menu ifTrue: [
		^ self renderMenu: aNavAction ]."

	^ #div asHtmlTag
		addClass: 'smd-navrail-item';
		when: CpClickEvent basicPrimary do: [ self handleNavAction: aNavAction ] for: self;
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-icon';
				appendChild: (SlIconButton named: iconName);
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-labelText';
				textContent: (aNavAction at: #iconLabel);
				yourself);
		yourself
]

{ #category : 'rendering' }
SlmdNavActionView >> renderMenu: aNavAction [

	^ self dropdownMenu: (Array with: aNavAction) css: nil.

]

{ #category : 'rendering' }
SlmdNavActionView >> renderNavItem: anItem expanded: aBoolean [
	| element |

	element := aBoolean
		ifTrue: [ self navrailExpandedBuildItem: anItem ]
		ifFalse: [ self navrailNarrowBuildItem: anItem ].

	self replaceAllChildrenWith: element atSlotNamed: #content.

]
