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
  display: flex;
  height: 40px;
  padding: 8px 16px;
  background: var(--wa-color-brand-80);
  border-top: 1px solid var(--wa-color-neutral-60);
}

.smd-item-leadingIcon {
  padding: 8px 16px 8px 0;
  font-size: 24px;
}

.smd-item-trailingIcon {
  padding: 8px 0 8px 16px;
  font-size: 24px;
}

.smd-item-headline {
  line-height: 40px;
  font-size: 16px;
  text-align: left;
  text-overflow: ellipsis;
  margin-right: auto;
}
'
]

{ #category : 'web resources' }
SlmdListItemView class >> style [
	<webResource: #css>

	^ '
.container {
  display: flex;
  flex-wrap: no-wrap;
  height: 40px;
  padding: 8px 16px;
  background: var(--wa-color-brand-80);
  border-top: 1px solid var(--wa-color-neutral-60);
}

.leadingIcon {
  padding: 8px 16px 8px 0;
  font-size: 24px;
}

.list-text {
  margin-right: auto;
}

.headline {
  line-height: 40px;
  font-size: 16px;
  text-align: left;
  overflow-x: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.trailingIcon {
  padding: 8px 0 8px 16px;
  font-size: 24px;
}
'
]

{ #category : 'web resources' }
SlmdListItemView class >> template [

	<webResource: #html>

	^ '<div class="container">
<div class="leadingIcon"><slot name="leadingIcon"></slot></div>
<div class="list-text">
  <div class="headline"><slot name="headline"></slot></div>
</div>
<div class="trailingIcon"><slot name="trailingIcon"></slot></div>
</div>'
]

{ #category : 'rendering' }
SlmdListItemView >> renderLeadingIcon: aMap [
	| icon action |

	icon := aMap at: #leadingIcon ifAbsent: [].
	action := aMap at: #leadingAction ifAbsent: [ #setDetail ].

	icon
		ifNil: [
			self removeChildrenAtSlotNamed: #leadingIcon ]
		ifNotNil: [ :value | | element |
			self replaceAllChildrenWith: (element := WaIcon fullyNamed: value) atSlotNamed: #leadingIcon.
			element when: CpClickEvent basicPrimary do: [ self triggerAction: action ] for: self ].

]

{ #category : 'rendering' }
SlmdListItemView >> renderListItemMap: aMap [

	self renderLeadingIcon: aMap.
	self renderText: aMap.
	self renderTrailingIcon: aMap.

]

{ #category : 'rendering' }
SlmdListItemView >> renderText: aMap [
	| headline action |

	headline := aMap at: #headline ifAbsent: [].
	action := aMap at: #leadingAction ifAbsent: [ #setDetail ].

	headline
		ifNil: [
			self removeChildrenAtSlotNamed: #headline ]
		ifNotNil: [ :value | | element |
			self replaceAllChildrenWith: (element := value asHtmlElement) atSlotNamed: #headline.
			element when: CpClickEvent basicPrimary do: [ self triggerAction: action ] for: self ].

]

{ #category : 'rendering' }
SlmdListItemView >> renderTrailingIcon: aMap [
	| icon action |

	icon := aMap at: #trailingIcon ifAbsent: [].
	action := aMap at: #trailingAction ifAbsent: [ #setDetail ].

	icon
		ifNil: [
			self removeChildrenAtSlotNamed: #trailingIcon ]
		ifNotNil: [ :value | | element |
			self replaceAllChildrenWith: (element := WaIcon fullyNamed: value) atSlotNamed: #trailingIcon.
			element when: CpClickEvent basicPrimary do: [ self triggerAction: action ] for: self ].

]

{ #category : 'rendering' }
SlmdListItemView >> triggerAction: action [

	self systemLog logTrace5: action printString.

	self serverAnnounce: (WamNavActionEvent id: action)

]
