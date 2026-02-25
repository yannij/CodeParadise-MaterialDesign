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
  margin-inline-start: 0;
  display: flex;
  min-height: 40px;
  padding: 8px 0;
  background: var(--wa-color-brand-fill-normal);
  border-top: 1px solid var(--wa-color-neutral-60);
}

.wam-item-span1 {
  padding: 0 8px;
  min-height: 24px;
}

.wam-item-span2 {
  padding: 0 8px;
}

.wam-item-leadingIcon {
  margin-top: 4px;
  font-size: 24px;
}

.wam-item-trailingIcon {
  font-size: 24px;
}

.wam-item-headline {
  padding-left: 16px;
  font-size: 16px;
  text-align: left;
  text-overflow: ellipsis;
}
'
]

{ #category : 'web resources' }
WamListItemView class >> template [

	<webResource: #html>

	^ '<slot name="listItem"></slot>'
]

{ #category : 'rendering' }
WamListItemView >> renderListItem: aMap [
	| headline leadingIcon leadingAction leadingIconTag trailingIcon trailingAction trailingIconTag listItemTag elSpan1 elSpan2 |

	leadingIcon := aMap at: #leadingIcon ifAbsent: [].
	leadingAction := aMap at: #leadingAction ifAbsent: [ #setDetail ].
	headline := aMap at: #headline ifAbsent: [].
	trailingIcon := aMap at: #trailingIcon ifAbsent: [].
	trailingAction := aMap at: #trailingAction ifAbsent: [ #setDetail ].
	elSpan1 := #span asHtmlTag "addClass: 'wa-flank';" addClass: 'wam-item-span1'; yourself.
	elSpan2 := #span asHtmlTag addClass: 'wa-cluster'; addClass: 'wam-item-span2'; yourself.
	listItemTag := #li asHtmlTag addClass: 'wa-split'; addClass: 'wa-align-items-center'; addClass: 'wam-item'; appendChild: elSpan1; appendChild: elSpan2; yourself.

	leadingIcon ifNotNil: [ :value |
		leadingIconTag := WaIcon fullyNamed: value.
		leadingIconTag addClass: 'wam-item-leadingIcon'.
		leadingIconTag when: CpClickEvent basicPrimary do: [ self triggerAction: leadingAction ] for: self.
		elSpan1 appendChild: leadingIconTag. ].

	headline ifNotNil: [ :value | | tag |
		tag := value asHtmlElement.
		tag addClass: 'wam-item-headline'.
		tag when: CpClickEvent basicPrimary do: [ self triggerAction: leadingAction ] for: self.
		elSpan1 appendChild: tag ].

	trailingIcon ifNotNil: [ :value |
		trailingIconTag := WaIcon fullyNamed: value.
		trailingIconTag addClass: 'wam-item-trailingIcon'.
		trailingIconTag when: CpClickEvent basicPrimary do: [ self triggerAction: trailingAction ] for: self.
		elSpan2 appendChild: trailingIconTag. ].

	headline
		ifNil: [
			self removeChildrenAtSlotNamed: #listItem ]
		ifNotNil: [ :value |
			self replaceAllChildrenWith: listItemTag atSlotNamed: #listItem ].

]

{ #category : 'rendering' }
WamListItemView >> triggerAction: action [

	self systemLog logTrace5: action printString.

	self serverAnnounce: (WamNavActionEvent id: action parameters: UndefinedObject)

]
