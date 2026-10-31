Class {
	#name : 'WamListItemCardView',
	#superclass : 'WamListItemView',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'rendering' }
WamListItemCardView >> contentElement: aMap [
	| heading headingEl supportingText supportingTextEl leadingAction tag |

	heading := aMap at: #mdPrimaryString ifAbsent: [].
	supportingText := aMap at: #mdSecondaryString ifAbsent: [].
	leadingAction := aMap at: #leadingAction ifAbsent: [ #setDetail ].

	heading ifNil: [ ^ nil ].

	headingEl := #div asHtmlTag textContent: heading.
	headingEl addClass: 'wa-heading-m'.
	supportingTextEl := #div asHtmlTag textContent: supportingText.
	headingEl addClass: 'wa-body-m'.
	tag := #div asHtmlTag.
	tag appendChild: headingEl; appendChild: supportingTextEl.
	tag when: CpClickEvent basicPrimary do: [ self triggerAction: leadingAction ] for: self.

	^ tag
]

{ #category : 'rendering' }
WamListItemCardView >> footerElement: aMap [
	| trailingIcon trailingAction trailingIconTag iconDiv |

	trailingIcon := aMap at: #trailingIcon ifAbsent: [].
	trailingAction := aMap at: #trailingAction ifAbsent: [].

	trailingIcon ifNil: [ ^ nil ].

	trailingIconTag := WaIcon fullyNamed: trailingIcon.
	trailingIconTag when: CpClickEvent basicPrimary do: [ self triggerAction: trailingAction ] for: self.

	iconDiv := #div asHtmlTag
		appendChild: trailingIconTag;
		addClass: 'wam-item-trailingIcon';
		yourself.

	^ #div asHtmlTag
		addClass: 'wa-flank:end';
		appendChild: (#div asHtmlTag textContent: '');
		appendChild: iconDiv;
		yourself
]

{ #category : 'rendering' }
WamListItemCardView >> renderListItemAsCard: aMap [
	| contentsElement card |

	(contentsElement := self contentElement: aMap) ifNil: [
		^ self removeChildrenAtSlotNamed: nil ].

	card := WaCard new "orientation: 'horizontal'; yourself".
	card replaceAllChildrenWith: contentsElement atSlotNamed: nil.

	(self footerElement: aMap)
		ifNil: [ card removeChildrenAtSlotNamed: #footer ]
		ifNotNil: [ :value | card replaceAllChildrenWith: value atSlotNamed: #footer ].

	self replaceAllChildrenWith: card atSlotNamed: nil.

]
