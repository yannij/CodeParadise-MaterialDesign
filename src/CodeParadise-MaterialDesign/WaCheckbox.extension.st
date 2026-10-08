Extension { #name : 'WaCheckbox' }

{ #category : '*CodeParadise-MaterialDesign' }
WaCheckbox >> label [

	^ self firstChildAtSlotNamed: nil
]

{ #category : '*CodeParadise-MaterialDesign' }
WaCheckbox >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]
