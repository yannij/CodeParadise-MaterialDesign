Class {
	#name : 'SlmdDemoObject',
	#superclass : 'SlmdObjectModel',
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'printing' }
SlmdDemoObject class >> attributeNames [

	^ #()
]

{ #category : 'printing' }
SlmdDemoObject class >> modelName [

	^ 'abstract'
]

{ #category : 'rendering' }
SlmdDemoObject >> applyChanges: changes [

	self class attributeNames do: [ :field |
		changes at: field ifPresent: [ :value | self perform: (field, ':') asSymbol with: value ] ].

	self valueChanged.

]

{ #category : 'converting' }
SlmdDemoObject >> asMap [
	| map |

	map := Dictionary new.

	self class attributeNames do: [ :each |
		map at: each put: (self perform: each asSymbol) asString ].

	^ map
]

{ #category : 'printing' }
SlmdDemoObject >> attributeNames [

	^ self class attributeNames
]

{ #category : 'metadata' }
SlmdDemoObject >> fieldsData [

	^ self class attributeNames collect: [ :each | each -> #string ]
]

{ #category : 'printing' }
SlmdDemoObject >> modelName [

	^ self class modelName
]

{ #category : 'presenter' }
SlmdDemoObject >> preferredPresenterClass [
	"Answer corresponding Presenter class if present,
	else answer a generic presenter"
	| className presenterClass |

	className := (self class name withoutSuffix: #Model) asSymbol , #Presenter.
	presenterClass := Smalltalk classNamed: className.

	presenterClass ifNil: [
		^ SlmdDemoObjectPresenter ].

	^ presenterClass
]

{ #category : 'printing' }
SlmdDemoObject >> summaryString [

	^ self modelName, ': ', ('/' join: (self attributeNames collect: [ :each | self perform: each ]))
]
