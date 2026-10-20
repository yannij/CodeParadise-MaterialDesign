Class {
	#name : 'WamListItemDivView',
	#superclass : 'WamListItemView',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'rendering' }
WamListItemDivView >> renderListItemAsDiv: aMap [
	| contentElement item div1 div2 divider div |

	(contentElement := self contentElement: aMap) ifNil: [
		^ self removeChildrenAtSlotNamed: nil ].

	div1 := #div asHtmlTag addClass: 'wa-flank:end'; addClass: 'wa-gap-0'; yourself.
	div2 := #div asHtmlTag addClass: 'wa-flank'; addClass: 'wa-gap-0'; yourself.
	div1 appendChild: div2.
	item := #div asHtmlTag addClass: 'wam-item'; appendChild: div1; yourself.

	(self leadingElement: aMap) ifNotNil: [ :element | div2 appendChild: element ].
	div2 appendChild: contentElement.
	(self trailingElement: aMap) ifNotNil: [ :element | div1 appendChild: element ].

	divider := WaDivider new
		customPropertyAt: 'spacing' put: '0'; 
		customPropertyAt: 'color' put: 'var(--wa-color-text-normal)';
		yourself .
	div := #div asHtmlTag appendChild: divider; appendChild: item; yourself.

	self replaceAllChildrenWith: div atSlotNamed: nil.

]
