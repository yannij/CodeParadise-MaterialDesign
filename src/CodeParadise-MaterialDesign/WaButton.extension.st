Extension { #name : 'WaButton' }

{ #category : '*CodeParadise-MaterialDesign' }
WaButton >> end [

	^ self firstChildAtSlotNamed: #end
]

{ #category : '*CodeParadise-MaterialDesign' }
WaButton >> end: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: #end
]

{ #category : '*CodeParadise-MaterialDesign' }
WaButton >> label [

	^ self firstChildAtSlotNamed: nil
]

{ #category : '*CodeParadise-MaterialDesign' }
WaButton >> label: aStringOrElement [

	self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: nil
]
