Class {
	#name : 'SlmdDemoObjectView',
	#superclass : 'SlmdObjectView',
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'rendering' }
SlmdDemoObjectView >> fields: list map: props [
	| card |

	fieldElements := OrderedDictionary new.

	card := #div asHtmlTag addClass: 'tblog-post'; yourself.

	list do: [ :fieldName |
		card appendChild: (self fieldAt: fieldName label: fieldName capitalized text: (props at: fieldName)) ].


	self replaceAllChildrenWith: card atSlotNamed: 'card'.

]

{ #category : 'rendering' }
SlmdDemoObjectView >> fieldsSetUp: props [
	| card |

	fieldElements := OrderedDictionary new.

	card := #div asHtmlTag addClass: 'tblog-post'; yourself.

	props keysAndValuesDo: [ :fieldName :value |
		card appendChild: (self fieldAt: fieldName label: fieldName capitalized text: value) ].


	self replaceAllChildrenWith: card atSlotNamed: 'card'.

]
