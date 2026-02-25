Class {
	#name : 'WamDemoObject',
	#superclass : 'WamObjectModel',
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'printing' }
WamDemoObject class >> attributeNames [

	^ #()
]

{ #category : 'printing' }
WamDemoObject class >> modelName [

	^ 'abstract'
]

{ #category : 'rendering' }
WamDemoObject >> applyChanges: changes [

	self class attributeNames do: [ :field |
		changes at: field ifPresent: [ :value | self perform: (field, ':') asSymbol with: value ] ].

	self valueChanged.

]

{ #category : 'converting' }
WamDemoObject >> asMap [
	| map |

	map := super asMap.

	self class attributeNames do: [ :each |
		map at: each put: (self perform: each asSymbol) asString ].

	^ map
]

{ #category : 'printing' }
WamDemoObject >> attributeNames [

	^ self class attributeNames
]

{ #category : 'metadata' }
WamDemoObject >> fieldsData [

	^ self class attributeNames collect: [ :each | each -> #string ]
]

{ #category : 'printing' }
WamDemoObject >> modelName [

	^ self class modelName
]

{ #category : 'presenter' }
WamDemoObject >> preferredPresenterClass [
	"Answer corresponding Presenter class if present,
	else answer a generic presenter"
	| className presenterClass |

	className := (self class name withoutSuffix: #Model) asSymbol , #Presenter.
	presenterClass := Smalltalk classNamed: className.

	presenterClass ifNil: [
		^ WamDemoObjectPresenter ].

	^ presenterClass
]

{ #category : 'printing' }
WamDemoObject >> summaryString [

	^ self modelName, ': ', ('/' join: (self attributeNames collect: [ :each | self perform: each ]))
]
