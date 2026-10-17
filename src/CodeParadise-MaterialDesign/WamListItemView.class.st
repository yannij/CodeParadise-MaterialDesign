Class {
	#name : 'WamListItemView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'web resources' }
WamListItemView class >> globalStyle [
	<webResource: #css>

	^ '
.wam-item {
  min-height: 40px;
  padding: 8px 0 8px 16px;
  background: var(--wa-color-brand-fill-normal);
}

.wam-item-leadingIcon {
  padding-right: 16px;
  font-size: 24px;
}

.wam-item-trailingIcon {
  padding-right: 16px;
  font-size: 24px;
}

.wam-item-label-text {
  padding-right: 16px;
  font-size: 16px;
  text-align: left;
  text-overflow: ellipsis;
}
'
]

{ #category : 'rendering' }
WamListItemView >> contentElement: aMap [
	| labelText leadingAction tag |

	labelText := aMap at: #labelText ifAbsent: [].
	leadingAction := aMap at: #leadingAction ifAbsent: [ #setDetail ].

	labelText ifNil: [ ^ nil ].

	tag := #div asHtmlTag textContent: labelText.
	tag addClass: 'wam-item-label-text'.
	tag when: CpClickEvent basicPrimary do: [ self triggerAction: leadingAction ] for: self.

	^ tag
]

{ #category : 'rendering' }
WamListItemView >> leadingElement: aMap [
	| leadingIcon leadingAction leadingIconTag |

	leadingIcon := aMap at: #leadingIcon ifAbsent: [].
	leadingAction := aMap at: #leadingAction ifAbsent: [ #setDetail ].

	leadingIcon ifNil: [ ^ nil ].

	leadingIconTag := WaIcon fullyNamed: leadingIcon.
	leadingIconTag when: CpClickEvent basicPrimary do: [ self triggerAction: leadingAction ] for: self.

	^ #div asHtmlTag
		appendChild: leadingIconTag;
		addClass: 'wam-item-leadingIcon';
		yourself
]

{ #category : 'rendering' }
WamListItemView >> renderListItem: aMap [

	"self renderListItemAsCard: aMap."
	self renderListItemAsDiv: aMap.

]

{ #category : 'rendering' }
WamListItemView >> renderListItemAsCard: aMap [
	| contentsElement card |


	(contentsElement := self contentElement: aMap) ifNil: [
		^ self removeChildrenAtSlotNamed: nil ].

	card := WaCard new "orientation: 'horizontal'; yourself".
	card replaceAllChildrenWith: contentsElement atSlotNamed: nil.

	(self leadingElement: aMap)
		ifNil: [ card removeChildrenAtSlotNamed: #media ]
		ifNotNil: [ :value | card replaceAllChildrenWith: value atSlotNamed: #media ].

	(self trailingElement: aMap)
		ifNil: [ card removeChildrenAtSlotNamed: #actions ]
		ifNotNil: [ :value | card replaceAllChildrenWith: value atSlotNamed: #actions ].

	self replaceAllChildrenWith: card atSlotNamed: nil.

]

{ #category : 'rendering' }
WamListItemView >> renderListItemAsDiv: aMap [
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

{ #category : 'rendering' }
WamListItemView >> trailingElement: aMap [
	| trailingIcon trailingAction trailingIconTag |

	trailingIcon := aMap at: #trailingIcon ifAbsent: [].
	trailingAction := aMap at: #trailingAction ifAbsent: [ #setDetail ].

	trailingIcon ifNil: [ ^ nil ].

	trailingIconTag := WaIcon fullyNamed: trailingIcon.
	trailingIconTag when: CpClickEvent basicPrimary do: [ self triggerAction: trailingAction ] for: self.

	^ #div asHtmlTag
		appendChild: trailingIconTag;
		addClass: 'wam-item-trailingIcon';
		yourself
]

{ #category : 'rendering' }
WamListItemView >> triggerAction: action [

	self systemLog logTrace5: action printString.

	self serverAnnounce: (WamNavActionEvent id: action parameters: UndefinedObject)

]
