Class {
	#name : 'SlmdDemoObjectView',
	#superclass : 'SlmdObjectView',
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'rendering' }
SlmdDemoObjectView >> fields: list map: props [
	| details fields |

	fieldElements := OrderedDictionary new.

	fields := #div asHtmlTag addClass: 'slmd-fields'; yourself.
	details := SlDetails new.
	details addClass: 'slmd-details'.
	details propertyAt: 'summary' put: 'Fields'.
	details propertyAt: 'open' put: true.
	details appendChild: fields.

	list do: [ :fieldName |
		fields appendChild: (self fieldAt: fieldName label: fieldName capitalized text: (props at: fieldName)) ].

	self replaceAllChildrenWith: details atSlotNamed: 'card'.

]

{ #category : 'rendering' }
SlmdDemoObjectView >> fieldsSetUp: props [
	| card |

	fieldElements := OrderedDictionary new.

	card := #div asHtmlTag addClass: 'slmd-fields'; yourself.

	props keysAndValuesDo: [ :fieldName :value |
		card appendChild: (self fieldAt: fieldName label: fieldName capitalized text: value) ].

	self replaceAllChildrenWith: card atSlotNamed: 'card'.

]

{ #category : 'rendering' }
SlmdDemoObjectView >> renderModelTable: aList columns: columns title: aTitleString [
	| table thead row tbody details |

	table := #table asHtmlTag addClass: 'slmd-table'; yourself.
	table attributeAt: 'border' put: '1'.
	"table appendChild: (#caption asHtmlTag textContent: aTitleString; yourself).
"
	thead := #thead asHtmlTag.
	row := #tr asHtmlTag.
	columns do: [ :field | | th |
		th := #td asHtmlTag.
		th textContent: field capitalized.
		row appendChild: th ].
	thead appendChild: row.
	table appendChild: thead.

	tbody := #tbody asHtmlTag.
	aList do: [ :eachMap | | tr |
		tr := #tr asHtmlTag.
		columns do: [ :field | | td |
			td := #td asHtmlTag.
			td textContent: (eachMap at: field).
			tr appendChild: td ].
		tbody appendChild: tr ].
	table appendChild: tbody.

	details := SlDetails new.
	details addClass: 'slmd-details'.
	details propertyAt: 'summary' put: aTitleString.
	details appendChild: table.

	self appendChild: details atSlotNamed: 'details'.

]

{ #category : 'rendering' }
SlmdDemoObjectView >> renderModelTableClear [

	self removeChildrenAtSlotNamed: 'details'
]
