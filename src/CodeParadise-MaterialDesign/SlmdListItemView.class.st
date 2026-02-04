Class {
	#name : 'SlmdListItemView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'web resources' }
SlmdListItemView class >> globalStyle [
	<webResource: #css>

	^ '
.smd-item {
  margin-inline-start: 0;
  display: flex;
  min-height: 40px;
  padding: 8px 0;
  background: var(--wa-color-brand-fill-normal);
  border-top: 1px solid var(--wa-color-neutral-60);
}

.smd-item-span1 {
  padding: 0 8px;
  min-height: 24px;
}

.smd-item-span2 {
  padding: 0 8px;
}

.smd-item-leadingIcon {
  margin-top: 4px;
  font-size: 24px;
}

.smd-item-trailingIcon {
  font-size: 24px;
}

.smd-item-headline {
  padding-left: 16px;
  font-size: 16px;
  text-align: left;
  text-overflow: ellipsis;
}
'
]

{ #category : 'web resources' }
SlmdListItemView class >> template [

	<webResource: #html>

	^ '<slot name="listItem"></slot>'
]

{ #category : 'rendering' }
SlmdListItemView >> renderListItem: aMap [
	| headline leadingIcon leadingAction leadingIconTag trailingIcon trailingAction trailingIconTag listItemTag elSpan1 elSpan2 |

	leadingIcon := aMap at: #leadingIcon ifAbsent: [].
	leadingAction := aMap at: #leadingAction ifAbsent: [ #setDetail ].
	headline := aMap at: #headline ifAbsent: [].
	trailingIcon := aMap at: #trailingIcon ifAbsent: [].
	trailingAction := aMap at: #trailingAction ifAbsent: [ #setDetail ].
	elSpan1 := #span asHtmlTag "addClass: 'wa-flank';" addClass: 'smd-item-span1'; yourself.
	elSpan2 := #span asHtmlTag addClass: 'wa-cluster'; addClass: 'smd-item-span2'; yourself.
	listItemTag := #li asHtmlTag addClass: 'wa-split'; addClass: 'wa-align-items-center'; addClass: 'smd-item'; appendChild: elSpan1; appendChild: elSpan2; yourself.

	leadingIcon ifNotNil: [ :value |
		leadingIconTag := WaIcon fullyNamed: value.
		leadingIconTag addClass: 'smd-item-leadingIcon'.
		leadingIconTag when: CpClickEvent basicPrimary do: [ self triggerAction: leadingAction ] for: self.
		elSpan1 appendChild: leadingIconTag. ].

	headline ifNotNil: [ :value | | tag |
		tag := value asHtmlElement.
		tag addClass: 'smd-item-headline'.
		tag when: CpClickEvent basicPrimary do: [ self triggerAction: leadingAction ] for: self.
		elSpan1 appendChild: tag ].

	trailingIcon ifNotNil: [ :value |
		trailingIconTag := WaIcon fullyNamed: value.
		trailingIconTag addClass: 'smd-item-trailingIcon'.
		trailingIconTag when: CpClickEvent basicPrimary do: [ self triggerAction: trailingAction ] for: self.
		elSpan2 appendChild: trailingIconTag. ].

	headline
		ifNil: [
			self removeChildrenAtSlotNamed: #listItem ]
		ifNotNil: [ :value |
			self replaceAllChildrenWith: listItemTag atSlotNamed: #listItem ].

]

{ #category : 'rendering' }
SlmdListItemView >> triggerAction: action [

	self systemLog logTrace5: action printString.

	self serverAnnounce: (WamNavActionEvent id: action parameters: UndefinedObject)

]
