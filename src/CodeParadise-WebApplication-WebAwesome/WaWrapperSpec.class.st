Class {
	#name : 'WaWrapperSpec',
	#superclass : 'Object',
	#instVars : [
		'wrapperClassName',
		'wrapperSuperclass',
		'slots',
		'cssProperties',
		'booleanProperties',
		'stringProperties'
	],
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'code generation' }
WaWrapperSpec class >> generateAllWrappers [
	"Generate WebAwesome support classes.

	self generateAllWrappers
	"

	{
	"self waTestSpec."
	self waButtonSpec.
	self waButtonGroupSpec.
	} do: [ :eachSpec | eachSpec generate ]

]

{ #category : 'code generation' }
WaWrapperSpec class >> kebabCaseToAccessor: aKebabCaseString [
	"
	(self kebabCaseToCamelCase: 'aaa-bbb-ccc') = 'aaaBbbCcc'
	"

	^ ('' join: ((aKebabCaseString substrings: '-') collect: [ :each | each asCamelCase ])) asValidSelector

]

{ #category : 'code generation' }
WaWrapperSpec class >> waButtonGroupSpec [

	^ self new
		wrapperClassName: #WaButtonGroup;
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waButtonSpec [

	^ self new
		wrapperClassName: #WaButton;
		slotAdd: '*label'; slotAdd: 'start'; slotAdd: 'end';
		stringPropertyAt: 'variant' put: '*neutral|brand|success|warning|danger';
		stringPropertyAt: 'appearance' put: '*accent|filled|outlined|plain';
		stringPropertyAt: 'size' put: 'small|*medium|large';
		booleanPropertyAt: 'with-caret' put: false;
		booleanPropertyAt: 'disabled' put: false;
		booleanPropertyAt: 'loading' put: false;
		booleanPropertyAt: 'pill' put: false;
		stringPropertyAt: 'type' put: '*button|submit|reset';
		stringPropertyAt: 'name' put: #string;
		stringPropertyAt: 'value' put: #string;
		stringPropertyAt: 'href' put: #string;
		stringPropertyAt: 'target' put: #string;
		stringPropertyAt: 'rel' put: #string;
		stringPropertyAt: 'download' put: #string;
		stringPropertyAt: 'form' put: #string;
		stringPropertyAt: 'formaction' put: #string;
		stringPropertyAt: 'formenctype' put: #string;
		stringPropertyAt: 'formmethod' put: #string;
		booleanPropertyAt: 'formnovalidate' put: nil;
		stringPropertyAt: 'formtarget' put: #string;
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waTestSpec [

	^ self new
		wrapperClassName: #WaTest;
		slotAdd: 'slot1'; slotAdd: 'slot2';
		booleanPropertyAt: 'attr1' put: #todo;
		booleanPropertyAt: 'attr2' put: #todo;
		stringPropertyAt: 'prop1' put: #todo;
		stringPropertyAt: 'prop2' put: #todo;
		cssPropertieAdd: 'css1'; cssPropertieAdd: 'css2';
		yourself
]

{ #category : 'accessing' }
WaWrapperSpec >> booleanProperties [

	^ booleanProperties
]

{ #category : 'accessing' }
WaWrapperSpec >> booleanProperties: anObject [

	booleanProperties := anObject
]

{ #category : 'accessing' }
WaWrapperSpec >> booleanPropertyAt: key put: anObject [

	self booleanProperties at: key put: anObject
]

{ #category : 'code generation' }
WaWrapperSpec >> compileBooleanAttribute: aKebabCaseName in: aClass [
	| accessorString symbolString |

	accessorString := self class kebabCaseToAccessor: aKebabCaseName.
	symbolString := aKebabCaseName asSymbol printString.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString;
				cr; cr; tab; nextPutAll: '^ (self attributeAt: ', symbolString, ') notNil';
				yourself ])
		classified: 'accessing boolean'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': aBoolean';
				cr; cr; tab; nextPutAll: 'aBoolean';
				cr; tab; tab; nextPutAll: 'ifTrue: [ self attributeAdd: ', symbolString, ' ]';
				cr; tab; tab; nextPutAll: 'ifFalse: [ self removeAttributeAt: ', symbolString, ' ]';
				yourself ])
		classified: 'accessing boolean'.

]

{ #category : 'code generation' }
WaWrapperSpec >> compileBooleanConvenience: aKebabCaseName in: aClass [
	| accessorString symbolString |

	accessorString := self class kebabCaseToAccessor: aKebabCaseName.
	symbolString := aKebabCaseName asSymbol printString.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString, 'BeOn';
				cr; cr; tab; nextPutAll: 'self ', accessorString, ': true';
				yourself ])
		classified: 'accessing boolean'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString, 'BeOff';
				cr; cr; tab; nextPutAll: 'self ', accessorString, ': false';
				yourself ])
		classified: 'accessing boolean'.

]

{ #category : 'code generation' }
WaWrapperSpec >> compileCssProperty: aKebabCaseName in: aClass [
	| accessorString symbolString |

	accessorString := self class kebabCaseToAccessor: aKebabCaseName.
	symbolString := aKebabCaseName asSymbol printString.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString;
				cr; cr; tab; nextPutAll: '^ self customPropertyAt: ', symbolString;
				yourself ])
		classified: 'accessing css property'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': aString';
				cr; cr; tab; nextPutAll: 'self customPropertyAt: ', symbolString, ' put: aString';
				yourself ])
		classified: 'accessing css property'.

]

{ #category : 'code generation' }
WaWrapperSpec >> compileSlot: aKebabCaseName in: aClass [
	| accessorString slotNameString |

	(self valueHasDefaultIndicator: aKebabCaseName)
		ifTrue: [
			accessorString := self class kebabCaseToAccessor: (self valueWithoutDefaultIndicator: aKebabCaseName).
			slotNameString := 'nil' ]
		ifFalse: [
			accessorString := self class kebabCaseToAccessor: aKebabCaseName.
			slotNameString := aKebabCaseName asSymbol printString ].

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString;
				cr; cr; tab; nextPutAll: '^ self firstChildAtSlotNamed: ', slotNameString;
				yourself ])
		classified: 'accessing slot'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': aStringOrElement';
				cr; cr; tab; nextPutAll: 'self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: ', slotNameString;
				yourself ])
		classified: 'accessing slot'.

]

{ #category : 'code generation' }
WaWrapperSpec >> compileStringProperty: aKebabCaseName in: aClass [
	| accessorString symbolString |

	accessorString := self class kebabCaseToAccessor: aKebabCaseName.
	symbolString := aKebabCaseName asSymbol printString.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString;
				cr; cr; tab; nextPutAll: '^ self propertyAt: ', symbolString;
				yourself ])
		classified: 'accessing string'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': anObject';
				cr; cr; tab; nextPutAll: 'self propertyAt: ', symbolString, ' put: anObject';
				yourself ])
		classified: 'accessing string'.

]

{ #category : 'code generation' }
WaWrapperSpec >> compileStringProperty: aKebabCaseName types: specString in: aClass [
	| accessorString types |

	specString = #string ifTrue: [
		^ self ].

	accessorString := self class kebabCaseToAccessor: aKebabCaseName.
	types := (specString substrings: '|') collect: [ :each | self valueWithoutDefaultIndicator: each ].

	types do: [ :eachType |
		aClass
			compile: (String streamContents: [ :stream |
				stream
					nextPutAll: accessorString, 'Be', eachType asCamelCase capitalized;
					cr; cr; tab; nextPutAll: 'self ', accessorString, ': ', eachType printString;
					yourself ])
			classified: 'accessing string' ].

]

{ #category : 'accessing' }
WaWrapperSpec >> cssPropertieAdd: anObject [

	self cssProperties add: anObject
]

{ #category : 'accessing' }
WaWrapperSpec >> cssProperties [

	^ cssProperties
]

{ #category : 'accessing' }
WaWrapperSpec >> cssProperties: anObject [

	cssProperties := anObject
]

{ #category : 'code generation' }
WaWrapperSpec >> generate [
	| theClass |

	theClass := self makeClassNamed: self wrapperClassName asSubclassOf: WaElement.

	self slots do: [ :each |
		self compileSlot: each in: theClass ].

	self booleanProperties keysAndValuesDo: [ :key :value |
		self compileBooleanAttribute: key in: theClass.
		self compileBooleanConvenience: key in: theClass ].

	self stringProperties keysAndValuesDo: [ :key :value |
		self compileStringProperty: key in: theClass.
		self compileStringProperty: key types: value in: theClass ].

	self cssProperties do: [ :each |
		self compileCssProperty: each in: theClass ].

]

{ #category : 'initialization' }
WaWrapperSpec >> initialize [

	super initialize.

	wrapperSuperclass := WaElement.
	booleanProperties := IdentityDictionary new.
	stringProperties := IdentityDictionary new.
	cssProperties := OrderedCollection new.
	slots := OrderedCollection new.

]

{ #category : 'code generation' }
WaWrapperSpec >> makeClassNamed: aClassName asSubclassOf: aClass [
	| elementClass |

	elementClass := SmalltalkImage current classNamed: aClassName.
	elementClass ifNotNil: [ :value |
		^ value ].

	self traceCr: 'Creating: ', aClassName asString.

	elementClass := SmalltalkImage current classInstaller make: [ :aBuilder |
		aBuilder
			name: aClassName;
			superclass: aClass;
			slots: #();
			tag: 'Elements';
			package: 'CodeParadise-WebApplication-WebAwesome' ].
	^ elementClass
]

{ #category : 'accessing' }
WaWrapperSpec >> slotAdd: anObject [

	self slots add: anObject
]

{ #category : 'accessing' }
WaWrapperSpec >> slots [

	^ slots
]

{ #category : 'accessing' }
WaWrapperSpec >> slots: anObject [

	slots := anObject
]

{ #category : 'accessing' }
WaWrapperSpec >> stringProperties [

	^ stringProperties
]

{ #category : 'accessing' }
WaWrapperSpec >> stringProperties: anObject [

	stringProperties := anObject
]

{ #category : 'accessing' }
WaWrapperSpec >> stringPropertyAt: key put: anObject [

	self stringProperties at: key put: anObject
]

{ #category : 'code generation' }
WaWrapperSpec >> valueHasDefaultIndicator: aString [

	^ aString beginsWith: '*'
]

{ #category : 'code generation' }
WaWrapperSpec >> valueWithoutDefaultIndicator: aString [

	^ aString withoutPrefix: '*'
]

{ #category : 'accessing' }
WaWrapperSpec >> wrapperClassName [

	^ wrapperClassName
]

{ #category : 'accessing' }
WaWrapperSpec >> wrapperClassName: anObject [

	wrapperClassName := anObject
]

{ #category : 'accessing' }
WaWrapperSpec >> wrapperSuperclass [

	^ wrapperSuperclass
]

{ #category : 'accessing' }
WaWrapperSpec >> wrapperSuperclass: anObject [

	wrapperSuperclass := anObject
]
