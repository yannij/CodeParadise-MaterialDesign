Extension { #name : 'WaRadio' }

{ #category : '*CodeParadise-MaterialDesign' }
WaRadio >> label [

	^ self firstChildAtSlotNamed: nil
]

{ #category : '*CodeParadise-MaterialDesign' }
WaRadio >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]
