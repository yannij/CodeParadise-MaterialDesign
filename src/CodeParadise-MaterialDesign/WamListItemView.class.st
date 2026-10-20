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
