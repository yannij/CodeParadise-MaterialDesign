Extension { #name : 'WaSwitch' }

{ #category : '*CodeParadise-MaterialDesign' }
WaSwitch >> label [

	^ self firstChildAtSlotNamed: nil
]

{ #category : '*CodeParadise-MaterialDesign' }
WaSwitch >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]
