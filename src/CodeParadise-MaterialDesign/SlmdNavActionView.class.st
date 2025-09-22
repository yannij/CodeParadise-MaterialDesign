Class {
	#name : 'SlmdNavActionView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'web resources' }
SlmdNavActionView class >> template [

	<webResource: #html>

	^ '<div id="container">
  <slot name="content"></slot>
</div>'
]

{ #category : 'nav' }
SlmdNavActionView >> buttonCssClass [

	^ 'smd-toolbar-buttons'
]

{ #category : 'rendering' }
SlmdNavActionView >> navrailExpandedBuildItem: aNavAction [
	| iconName |

	iconName := aNavAction at: #iconName.

	^ #div asHtmlTag
		addClass: 'smd-navrailx-item';
		addClass: 'smd-nav-font';
		when: CpClickEvent basicPrimary do: [ self layoutViewLazy triggerUserEvent: aNavAction ] for: self;
		"when: CpClickEvent basicPrimary send: #hide to: drawer;"
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
		when: CpClickEvent basicPrimary do: [ self layoutViewLazy triggerUserEvent: aNavAction ] for: self;
		"when: CpClickEvent basicPrimary send: #hide to: drawer;"
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
SlmdNavActionView >> renderNavItem: anItem expanded: aBoolean [
	| element |

	element := aBoolean
		ifTrue: [ self navrailExpandedBuildItem: anItem ]
		ifFalse: [ self navrailNarrowBuildItem: anItem ].

	self replaceAllChildrenWith: element atSlotNamed: #content.

]
