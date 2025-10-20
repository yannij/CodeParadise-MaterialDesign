Class {
	#name : 'SlmdDemoObjectView',
	#superclass : 'SlmdObjectView',
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

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

	details := WaDetails new.
	details addClass: 'slmd-details'.
	details propertyAt: 'summary' put: aTitleString.
	details propertyAt: 'open' put: true.
	details appendChild: table.

	self appendChild: details atSlotNamed: #details.

]

{ #category : 'rendering' }
SlmdDemoObjectView >> renderModelTableClear [

	self removeChildrenAtSlotNamed: #details
]
