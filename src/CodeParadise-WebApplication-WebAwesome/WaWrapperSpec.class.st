Class {
	#name : 'WaWrapperSpec',
	#superclass : 'Object',
	#instVars : [
		'wrapperClassName',
		'wrapperSuperclass',
		'slots',
		'cssProperties',
		'booleanProperties',
		'stringProperties',
		'numberProperties'
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
	self waCheckboxSpec.
	self waInputSpec.
	self waSplitPanelSpec.
	self waSwitchSpec.
	self waTextareaSpec.
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
		stringPropertyAt: 'label' put: #string;
		stringPropertyAt: 'orientation' put: '*horizontal|vertical';
		stringPropertyAt: 'variant' put: '*neutral|brand|success|warning|danger';
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
WaWrapperSpec class >> waCheckboxSpec [

	^ self new
		wrapperClassName: #WaCheckbox;
		wrapperSuperclass: WaCheckControl;
		slotAdd: '*label'; slotAdd: 'hint';
		stringPropertyAt: 'size' put: 'small|*medium|large';
		booleanPropertyAt: 'disabled' put: false;
		booleanPropertyAt: 'indeterminate' put: false;
		booleanPropertyAt: 'checked' put: false;
		booleanPropertyAt: 'required' put: false;
		stringPropertyAt: 'hint' put: #string;
		cssPropertieAdd: 'width';
		cssPropertieAdd: 'height';
		cssPropertieAdd: 'thumb-size';
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waInputSpec [

	^ self new
		wrapperClassName: #WaInput;
		wrapperSuperclass: WaTextControl;
		slotsAddAll: #('label' 'start' 'end'	 'clear-icon' 'show-password-icon' 'hide-password-icon' 'hint');
		booleanPropertyAt: 'readonly' put: false;
		booleanPropertyAt: 'required' put: false;
		stringPropertyAt: 'type' put: 'date|datetime-local|email|number|password|search|tel|*text|time|url';
		stringPropertyAt: 'label' put: #string;
		stringPropertyAt: 'hint' put: #string;
		booleanPropertyAt: 'with-clear' put: false;
		stringPropertyAt: 'placeholder' put: #string;
		stringPropertyAt: 'appearance' put: 'filled|*outlined';
		stringPropertyAt: 'size' put: 'small|*medium|large';
		booleanPropertyAt: 'pill' put: false;
		booleanPropertyAt: 'password-toggle' put: false;
		booleanPropertyAt: 'password-visible' put: false;
		booleanPropertyAt: 'autofocus' put: nil;
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waSplitPanelSpec [

	^ self new
		wrapperClassName: #WaSplitPanel;
		slotAdd: 'start'; slotAdd: 'end'; slotAdd: 'divider';
		numberPropertyAt: 'position' put: 50;
		numberPropertyAt: 'position-in-pixels' put: #number;
		stringPropertyAt: 'orientation' put: '*horizontal|vertical';
		booleanPropertyAt: 'disabled' put: false;
		stringPropertyAt: 'primary' put: 'start|end';
		stringPropertyAt: 'snap' put: #string;
		numberPropertyAt: 'snap-threshold' put: 12;
		cssPropertieAdd: 'divider-width';
		cssPropertieAdd: 'divider-hit-area';
		cssPropertieAdd: 'min';
		cssPropertieAdd: 'max';
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waSwitchSpec [

	^ self new
		wrapperClassName: #WaSwitch;
		wrapperSuperclass: WaCheckControl;
		slotAdd: '*label'; slotAdd: 'hint';
		stringPropertyAt: 'size' put: 'small|*medium|large';
		booleanPropertyAt: 'disabled' put: false;
		booleanPropertyAt: 'checked' put: false;
		booleanPropertyAt: 'required' put: false;
		stringPropertyAt: 'hint' put: #string;
		cssPropertieAdd: 'checked-icon-color';
		cssPropertieAdd: 'checked-icon-scale';
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

{ #category : 'code generation' }
WaWrapperSpec class >> waTextareaSpec [

	^ self new
		wrapperClassName: #WaTextarea;
		wrapperSuperclass: WaTextControl;
		slotAdd: 'label'; slotAdd: 'hint';
		booleanPropertyAt: 'disabled' put: false;
		booleanPropertyAt: 'readonly' put: false;
		booleanPropertyAt: 'required' put: false;
		stringPropertyAt: 'label' put: #string;
		stringPropertyAt: 'hint' put: #string;
		stringPropertyAt: 'placeholder' put: #string;
		stringPropertyAt: 'appearance' put: 'filled|*outlined';
		stringPropertyAt: 'size' put: 'small|*medium|large';
		booleanPropertyAt: 'pill' put: false;
		numberPropertyAt: 'rows' put: 4;
		stringPropertyAt: 'resize' put: 'none|*vertical|horizontal|both|auto';
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
		classified: 'properties'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': aBoolean';
				cr; cr; tab; nextPutAll: 'aBoolean';
				cr; tab; tab; nextPutAll: 'ifTrue: [ self attributeAdd: ', symbolString, ' ]';
				cr; tab; tab; nextPutAll: 'ifFalse: [ self removeAttributeAt: ', symbolString, ' ]';
				yourself ])
		classified: 'properties'.

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
		classified: 'properties'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString, 'BeOff';
				cr; cr; tab; nextPutAll: 'self ', accessorString, ': false';
				yourself ])
		classified: 'properties'.

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
		classified: 'css custom properties'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': aString';
				cr; cr; tab; nextPutAll: 'self customPropertyAt: ', symbolString, ' put: aString';
				yourself ])
		classified: 'css custom properties'.

]

{ #category : 'code generation' }
WaWrapperSpec >> compileNumberProperty: aKebabCaseName in: aClass [
	| accessorString symbolString |

	accessorString := self class kebabCaseToAccessor: aKebabCaseName.
	symbolString := aKebabCaseName asSymbol printString.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString;
				cr; cr; tab; nextPutAll: '^ self propertyAt: ', symbolString;
				yourself ])
		classified: 'properties'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': anObject';
				cr; cr; tab; nextPutAll: 'self propertyAt: ', symbolString, ' put: anObject';
				yourself ])
		classified: 'properties'.

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
		classified: 'slots'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': aStringOrElement';
				cr; cr; tab; nextPutAll: 'self replaceAllChildrenWith: aStringOrElement asHtmlElement atSlotNamed: ', slotNameString;
				yourself ])
		classified: 'slots'.

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
		classified: 'properties'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': anObject';
				cr; cr; tab; nextPutAll: 'self propertyAt: ', symbolString, ' put: anObject';
				yourself ])
		classified: 'properties'.

]

{ #category : 'code generation' }
WaWrapperSpec >> compileStringProperty: aKebabCaseName types: specString in: aClass [
	| accessorString types |

	specString = #string ifTrue: [
		^ self ].

	accessorString := self class kebabCaseToAccessor: aKebabCaseName.
	types := (specString substrings: '|') collect: [ :each |
		(self valueWithoutDefaultIndicator: each) copyReplaceAll: '-' with: ' ' ].

	types do: [ :eachType |
		aClass
			compile: (String streamContents: [ :stream |
				stream
					nextPutAll: accessorString, 'Be', eachType asCamelCase capitalized;
					cr; cr; tab; nextPutAll: 'self ', accessorString, ': ', eachType asSymbol printString;
					yourself ])
			classified: 'properties' ].

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

	theClass := self makeClassNamed: self wrapperClassName asSubclassOf: self wrapperSuperclass.

	self slots do: [ :each |
		self compileSlot: each in: theClass ].

	self booleanProperties keysAndValuesDo: [ :key :value |
		self compileBooleanAttribute: key in: theClass.
		self compileBooleanConvenience: key in: theClass ].

	self stringProperties keysAndValuesDo: [ :key :value |
		self compileStringProperty: key in: theClass.
		self compileStringProperty: key types: value in: theClass ].

	self numberProperties keysAndValuesDo: [ :key :value |
		self compileNumberProperty: key in: theClass ].

	self cssProperties do: [ :each |
		self compileCssProperty: each in: theClass ].

]

{ #category : 'initialization' }
WaWrapperSpec >> initialize [

	super initialize.

	wrapperSuperclass := WaElement.
	booleanProperties := IdentityDictionary new.
	stringProperties := IdentityDictionary new.
	numberProperties := IdentityDictionary new.
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
WaWrapperSpec >> numberProperties [

	^ numberProperties
]

{ #category : 'accessing' }
WaWrapperSpec >> numberProperties: anObject [

	numberProperties := anObject
]

{ #category : 'accessing' }
WaWrapperSpec >> numberPropertyAt: key put: anObject [

	self numberProperties at: key put: anObject
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
WaWrapperSpec >> slotsAddAll: aCollection [

	self slots addAll: aCollection
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
