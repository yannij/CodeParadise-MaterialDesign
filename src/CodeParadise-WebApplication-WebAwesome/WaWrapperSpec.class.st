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
		'numberProperties',
		'textContent',
		'instanceCreators'
	],
	#category : 'CodeParadise-WebApplication-WebAwesome-Abstract',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Abstract'
}

{ #category : 'code generation' }
WaWrapperSpec class >> generateAllWrappers [
	"Generate WebAwesome support classes.

	self generateAllWrappers
	"

	self waButtonSpec generate.
	self waButtonGroupSpec generate.
	self waCardSpec generate.
	self waCheckboxSpec generate.
	self waColorPickerSpec generate.
	self waDetailsSpec generate.
	self waDialogSpec generate.
	self waDrawerSpec generate.
	self waDropdownSpec generate.
	self waDropdownItemSpec generate.
	self waIconSpec generate.
	self waInputSpec generate.
	self waOptionSpec generate.
	self waRadioSpec generate.
	self waRadioGroupSpec generate.
	self waResizeObserverSpec generate.
	self waSelectSpec generate.
	self waSplitPanelSpec generate.
	self waSwitchSpec generate.
	self waTextareaSpec generate.
	self waTreeSpec generate.
	self waTreeItemSpec generate.

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
		instanceCreatorsAddAll: #('label:' 'label:end:' 'start:label:' 'start:label:end:');
		slotAdd: '*label'; slotAdd: 'start'; slotAdd: 'end';
		stringPropertyAt: 'variant' put: '*neutral|brand|success|warning|danger';
		stringPropertyAt: 'appearance' put: '*accent|filled|outlined|filled-outlined|plain';
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
WaWrapperSpec class >> waCardSpec [

	^ self new
		wrapperClassName: #WaCard;
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waCheckboxSpec [

	^ self new
		wrapperClassName: #WaCheckbox;
		wrapperSuperclass: WaFormControl;
		slotAdd: '*label'; slotAdd: 'hint';
		instanceCreatorAdd: #'label:';
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
WaWrapperSpec class >> waColorPickerSpec [

	^ self new
		wrapperClassName: #WaColorPicker;
		wrapperSuperclass: WaFormControl;
		slotsAddAll: #('label' 'hint');
		booleanPropertyAt: 'disabled' put: false;
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waDetailsSpec [

	^ self new
		wrapperClassName: #WaDetails;
		slotsAddAll: #('summary' 'expand-icon' 'collapse-icon');
		booleanPropertyAt: 'open' put: false;
		"stringPropertyAt: 'summary' put: #string;"
		stringPropertyAt: 'name' put: #string;
		booleanPropertyAt: 'disabled' put: false;
		stringPropertyAt: 'appearance' put: 'filled|*outlined|filled-outlined|plain';
		stringPropertyAt: 'icon-placement' put: 'start|*end';
		cssPropertieAdd: 'spacing';
		cssPropertieAdd: 'show-duration';
		cssPropertieAdd: 'hide-duration';
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waDialogSpec [

	^ self new
		wrapperClassName: #WaDialog;
		instanceCreatorAdd: #'label:';
		slotsAddAll: #('*body' 'label' 'header-actions' 'footer');
		booleanPropertyAt: 'open' put: false;
		booleanPropertyAt: '=without-header' put: false;
		booleanPropertyAt: '=light-dismiss' put: true;
		cssPropertieAdd: 'spacing';
		cssPropertieAdd: 'width';
		cssPropertieAdd: 'show-duration';
		cssPropertieAdd: 'hide-duration';
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waDrawerSpec [

	^ self new
		wrapperClassName: #WaDrawer;
		instanceCreatorAdd: #'label:';
		slotsAddAll: #('*body' 'label' 'header-actions' 'footer');
		booleanPropertyAt: 'open' put: false;
		booleanPropertyAt: '=without-header' put: false;
		booleanPropertyAt: '=light-dismiss' put: true;
		stringPropertyAt: 'placement' put: 'top|*end|bottom|start';
		cssPropertieAdd: 'spacing';
		cssPropertieAdd: 'size';
		cssPropertieAdd: 'show-duration';
		cssPropertieAdd: 'hide-duration';
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waDropdownItemSpec [

	^ self new
		wrapperClassName: #WaDropdownItem;
		instanceCreatorsAddAll: #('value:label:' 'value:labelText:');
		slotsAddAll: #('*label' 'icon' 'details' 'submenu');
		textContent: 'labelText';
		stringPropertyAt: 'variant' put: 'danger|*default';
		stringPropertyAt: 'value' put: #string;
		stringPropertyAt: 'placement' put: '*normal|checkbox';
		booleanPropertyAt: 'checked' put: false;
		booleanPropertyAt: 'disabled' put: false;
		booleanPropertyAt: 'submenuOpen' put: false;
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waDropdownSpec [

	^ self new
		wrapperClassName: #WaDropdown;
		slotsAddAll: #('trigger');
		booleanPropertyAt: 'open' put: false;
		stringPropertyAt: 'size' put: 'small|*medium|large';
		stringPropertyAt: 'placement' put: 'top|top-start|top-end|bottom|*bottom-start|bottom-end|right|right-start|right-end|left|left-start|left-end';
		numberPropertyAt: 'distance' put: 0;
		numberPropertyAt: 'skidding' put: 0;
		cssPropertieAdd: 'show-duration';
		cssPropertieAdd: 'hide-duration';
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waIconSpec [

	^ self new
		wrapperClassName: #WaIcon;
		instanceCreatorAdd: #'name:';
		instanceCreatorAdd: #'name:label:';
		instanceCreatorAdd: #'name:label:library:';
		stringPropertyAt: 'name' put: #string;
		stringPropertyAt: 'family' put: #string;
		stringPropertyAt: 'variant' put: #string;
		booleanPropertyAt: '=auto-width' put: false;
		booleanPropertyAt: 'swap-opacity' put: false;
		stringPropertyAt: 'src' put: #string;
		stringPropertyAt: '=label' put: #string;
		stringPropertyAt: 'library' put: #string;
		cssPropertieAdd: 'primary-color';
		cssPropertieAdd: 'primary-opacity';
		cssPropertieAdd: 'secondary-color';
		cssPropertieAdd: 'secondary-opacity';
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waInputSpec [

	^ self new
		wrapperClassName: #WaInput;
		wrapperSuperclass: WaFormControl;
		slotsAddAll: #('label' 'start' 'end'	'clear-icon' 'show-password-icon' 'hide-password-icon' 'hint');
		instanceCreatorAdd: #'label:';
		booleanPropertyAt: '=disabled' put: false;
		booleanPropertyAt: 'readonly' put: false;
		booleanPropertyAt: 'required' put: false;
		stringPropertyAt: 'type' put: 'date|datetime-local|email|number|password|search|tel|*text|time|url';
		stringPropertyAt: 'label' put: #string;
		stringPropertyAt: 'hint' put: #string;
		booleanPropertyAt: '=with-clear' put: false;
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
WaWrapperSpec class >> waOptionSpec [

	^ self new
		wrapperClassName: #WaOption;
		slotsAddAll: #('label' 'start' 'end');
		instanceCreatorAdd: #'value:label:';
		instanceCreatorAdd: #'value:labelText:';
		textContent: 'label-text';
		stringPropertyAt: 'value' put: #string;
		booleanPropertyAt: 'disabled' put: false;
		booleanPropertyAt: 'selected' put: false;
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waRadioGroupSpec [

	^ self new
		wrapperClassName: #WaRadioGroup;
		slotsAddAll: #('label' 'hint');
		stringPropertyAt: 'name' put: #string;
		stringPropertyAt: 'value' put: #string;
		booleanPropertyAt: 'disabled' put: 'false';
		stringPropertyAt: 'orientation' put: 'horizontal|*vertical';
		stringPropertyAt: 'size' put: 'small|*medium|large';
		booleanPropertyAt: 'required' put: 'false';
		booleanPropertyAt: 'with-label' put: 'false';
		booleanPropertyAt: 'with-hint' put: 'false';
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waRadioSpec [

	^ self new
		wrapperClassName: #WaRadio;
		slotAdd: '*label';
		stringPropertyAt: 'form' put: #string;
		stringPropertyAt: 'value' put: #string;
		stringPropertyAt: 'appearance' put: '*default|button';
		stringPropertyAt: 'size' put: 'small|*medium|large';
		booleanPropertyAt: 'disabled' put: 'false';
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waResizeObserverSpec [

	^ self new
		wrapperClassName: #WaResizeObserver;
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waSelectSpec [

	^ self new
		wrapperClassName: #WaSelect;
		wrapperSuperclass: WaFormControl;
		slotsAddAll: #('label' 'start' 'end'	'clear-icon' 'expand-icon' 'hint');
		stringPropertyAt: 'size' put: 'small|*medium|large';
		stringPropertyAt: 'placeholder' put: #string;
		booleanPropertyAt: 'multiple' put: false;
		numberPropertyAt: 'max-options-visible' put: 3;
		booleanPropertyAt: 'disabled' put: false;
		booleanPropertyAt: 'with-clear' put: false;
		booleanPropertyAt: 'open' put: false;
		stringPropertyAt: 'appearance' put: 'filled|*outlined';
		booleanPropertyAt: 'pill' put: false;
		stringPropertyAt: 'label' put: #string;
		stringPropertyAt: 'placement' put: 'top|*bottom';
		booleanPropertyAt: 'with-label' put: false;
		booleanPropertyAt: 'with-hint' put: false;
		booleanPropertyAt: 'required' put: false;
		cssPropertieAdd: 'show-duration';
		cssPropertieAdd: 'hide-duration';
		cssPropertieAdd: 'tag-max-size';
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waSplitPanelSpec [

	^ self new
		wrapperClassName: #WaSplitPanel;
		slotAdd: 'start'; slotAdd: 'end'; slotAdd: 'divider';
		numberPropertyAt: 'position' put: 50;
		numberPropertyAt: '=position-in-pixels' put: #number;
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
		wrapperSuperclass: WaFormControl;
		slotAdd: '*label'; slotAdd: 'hint';
		instanceCreatorAdd: #'label:';
		stringPropertyAt: 'size' put: 'small|*medium|large';
		booleanPropertyAt: 'disabled' put: false;
		booleanPropertyAt: '=checked' put: false;
		booleanPropertyAt: 'required' put: false;
		stringPropertyAt: 'hint' put: #string;
		cssPropertieAdd: 'width';
		cssPropertieAdd: 'height';
		cssPropertieAdd: 'thumb-size';
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waTextareaSpec [

	^ self new
		wrapperClassName: #WaTextarea;
		wrapperSuperclass: WaFormControl;
		slotAdd: 'label'; slotAdd: 'hint';
		instanceCreatorAdd: #'label:';
		booleanPropertyAt: 'disabled' put: false;
		booleanPropertyAt: 'readonly' put: false;
		booleanPropertyAt: 'required' put: false;
		stringPropertyAt: 'placeholder' put: #string;
		stringPropertyAt: 'appearance' put: 'filled|*outlined';
		stringPropertyAt: 'size' put: 'small|*medium|large';
		booleanPropertyAt: 'pill' put: false;
		numberPropertyAt: 'rows' put: 4;
		stringPropertyAt: 'resize' put: 'none|*vertical|horizontal|both|auto';
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waTreeItemSpec [

	^ self new
		wrapperClassName: #WaTreeItem;
		instanceCreatorAdd: 'label:';
		slotsAddAll: #('*label' 'expand-icon' 'collapse-icon');
		booleanPropertyAt: '=expanded' put: false;
		booleanPropertyAt: '=selected' put: false;
		booleanPropertyAt: '=disabled' put: false;
		booleanPropertyAt: '=lazy' put: false;
		cssPropertieAdd: 'show-duration';
		cssPropertieAdd: 'hide-duration';
		yourself
]

{ #category : 'code generation' }
WaWrapperSpec class >> waTreeSpec [

	^ self new
		wrapperClassName: #WaTree;
		instanceCreatorAdd: 'label:';
		slotsAddAll: #('*label' 'expand-icon' 'collapse-icon');
		stringPropertyAt: 'selection' put: '*single|multiple|leaf';
		cssPropertieAdd: 'indent-size';
		cssPropertieAdd: 'indent-guide-color';
		cssPropertieAdd: 'indent-guide-offset';
		cssPropertieAdd: 'indent-guide-style';
		cssPropertieAdd: 'indent-guide-width';
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
WaWrapperSpec >> compileBoolean: aKebabCaseName in: aClass [
	| isAttribute propertyName |

	isAttribute := (aKebabCaseName first: 1) = '='.
	propertyName := isAttribute
		ifTrue: [ aKebabCaseName allButFirst: 1 ]
		ifFalse: [ aKebabCaseName ].

	isAttribute
		ifTrue: [ self compileBooleanAttribute: propertyName in: aClass ]
		ifFalse: [ self compileBooleanProperty: propertyName in: aClass ].

	self compileBooleanConvenience: propertyName in: aClass

]

{ #category : 'code generation' }
WaWrapperSpec >> compileBooleanAttribute: aKebabCaseName in: aClass [
	"Compile get/set methods for a boolean property that adds/removes a markup tag attribute.
	
	Some boolean properties work with propertyAt:put: code, but some don't, and require
	that the tag attribute be used. In such cases, prefix the property name with '=',
	so the code generation below is used."

	| accessorString symbolString |

	accessorString := self class kebabCaseToAccessor: aKebabCaseName.
	symbolString := aKebabCaseName asSymbol printString.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; cr;
				cr; tab; nextPutAll: '^ (self attributeAt: ', symbolString, ') notNil';
				yourself ])
		classified: 'properties'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': aBoolean'; cr;
				cr; tab; nextPutAll: 'aBoolean';
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
				nextPutAll: accessorString, 'BeOn'; cr;
				cr; tab; nextPutAll: 'self ', accessorString, ': true';
				yourself ])
		classified: 'properties'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString, 'BeOff'; cr;
				cr; tab; nextPutAll: 'self ', accessorString, ': false';
				yourself ])
		classified: 'properties'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString, 'IsOn'; cr;
				cr; tab; nextPutAll: '^ self propertyAt: ', symbolString;
				yourself ])
		classified: 'properties'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString, 'IsOff'; cr;
				cr; tab; nextPutAll: '^ (self propertyAt: ', symbolString, ') not';
				yourself ])
		classified: 'properties'.

]

{ #category : 'code generation' }
WaWrapperSpec >> compileBooleanProperty: aKebabCaseName in: aClass [
	| accessorString symbolString |

	accessorString := self class kebabCaseToAccessor: aKebabCaseName.
	symbolString := aKebabCaseName asSymbol printString.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; cr; 
				cr; tab; nextPutAll: '^ self propertyAt: ', symbolString;
				yourself ])
		classified: 'properties'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': aBoolean'; cr;
				cr; tab; nextPutAll: 'self propertyAt: ', symbolString, ' put: aBoolean';
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
WaWrapperSpec >> compileInstanceCreator: aMethodSelector in: aClass [
	| parts |

	parts := aMethodSelector asString substrings: ':'.

	aClass class
		compile: (String streamContents: [ :stream |
			parts withIndexDo: [ :eachPart :i |
				stream
					nextPutAll: eachPart; nextPut: $:; space; nextPutAll: 'object'; nextPutAll: i printString; space;
					yourself ].
			stream cr; cr; tab; nextPutAll: '^ self new '.
			parts withIndexDo: [ :eachPart :i |
				stream
					cr; tab; tab; nextPutAll: eachPart; nextPut: $:; space; nextPutAll: 'object'; nextPutAll: i printString; nextPut: $;
					yourself ].
			stream
				cr; tab; tab; nextPutAll: 'yourself' ])
		classified: 'instance creation'.

]

{ #category : 'code generation' }
WaWrapperSpec >> compileNumber: aKebabCaseName in: aClass [
	| isAttribute propertyName |

	isAttribute := (aKebabCaseName first: 1) = '='.
	propertyName := isAttribute
		ifTrue: [ aKebabCaseName allButFirst: 1 ]
		ifFalse: [ aKebabCaseName ].

	isAttribute
		ifTrue: [ self compileNumberAttribute: propertyName in: aClass ]
		ifFalse: [ self compileNumberProperty: propertyName in: aClass ].

]

{ #category : 'code generation' }
WaWrapperSpec >> compileNumberAttribute: aKebabCaseName in: aClass [
	| accessorString symbolString |

	accessorString := self class kebabCaseToAccessor: aKebabCaseName.
	symbolString := aKebabCaseName asSymbol printString.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString;
				cr; cr; tab; nextPutAll: '^ self attributeAt: ', symbolString;
				yourself ])
		classified: 'properties'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': anObject';
				cr; cr; tab; nextPutAll: 'self attributeAt: ', symbolString, ' put: anObject';
				yourself ])
		classified: 'properties'.

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
WaWrapperSpec >> compileString: aKebabCaseName types: specString in: aClass [
	| isAttribute propertyName |

	isAttribute := (aKebabCaseName first: 1) = '='.
	propertyName := isAttribute
		ifTrue: [ aKebabCaseName allButFirst: 1 ]
		ifFalse: [ aKebabCaseName ].

	isAttribute
		ifTrue: [ self compileStringAttribute: propertyName in: aClass ]
		ifFalse: [ self compileStringProperty: propertyName in: aClass ].

	self compileStringProperty: propertyName types: specString in: aClass

]

{ #category : 'code generation' }
WaWrapperSpec >> compileStringAttribute: aKebabCaseName in: aClass [
	| accessorString symbolString |

	accessorString := self class kebabCaseToAccessor: aKebabCaseName.
	symbolString := aKebabCaseName asSymbol printString.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString;
				cr; cr; tab; nextPutAll: '^ self attributeAt: ', symbolString;
				yourself ])
		classified: 'properties'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': anObject';
				cr; cr; tab; nextPutAll: 'self attributeAt: ', symbolString, ' put: anObject';
				yourself ])
		classified: 'properties'.

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

{ #category : 'code generation' }
WaWrapperSpec >> compileTextContent: aKebabCaseName in: aClass [
	| accessorString slotNameString |

	accessorString := self class kebabCaseToAccessor: aKebabCaseName.
	slotNameString := aKebabCaseName asSymbol printString.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; cr;
				cr; tab; nextPutAll: '^ self textContent';
				yourself ])
		classified: 'slots'.

	aClass
		compile: (String streamContents: [ :stream |
			stream
				nextPutAll: accessorString; nextPutAll: ': aString'; cr;
				cr; tab; nextPutAll: 'self textContent: aString';
				yourself ])
		classified: 'slots'.

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
		self compileBoolean: key in: theClass ].

	self stringProperties keysAndValuesDo: [ :key :value |
		self compileString: key types: value in: theClass ].

	self numberProperties keysAndValuesDo: [ :key :value |
		self compileNumber: key in: theClass ].

	self cssProperties do: [ :each |
		self compileCssProperty: each in: theClass ].

	self instanceCreators do: [ :each |
		self compileInstanceCreator: each in: theClass ].

	self textContent ifNotNil: [ :value |
		self compileTextContent: value in: theClass ]

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
	instanceCreators := OrderedCollection new.

]

{ #category : 'accessing' }
WaWrapperSpec >> instanceCreatorAdd: anObject [

	self instanceCreators add: anObject
]

{ #category : 'accessing' }
WaWrapperSpec >> instanceCreators [

	^ instanceCreators
]

{ #category : 'accessing' }
WaWrapperSpec >> instanceCreators: anObject [

	instanceCreators := anObject
]

{ #category : 'accessing' }
WaWrapperSpec >> instanceCreatorsAddAll: aCollection [

	self instanceCreators addAll: aCollection
]

{ #category : 'code generation' }
WaWrapperSpec >> makeClassNamed: aClassName asSubclassOf: aClass [
	| elementClass |

	elementClass := SmalltalkImage current classNamed: aClassName.
	elementClass ifNotNil: [ :value |
		value superclass = aClass ifTrue: [
			^ value ] ].

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

{ #category : 'accessing' }
WaWrapperSpec >> textContent [

	^ textContent
]

{ #category : 'accessing' }
WaWrapperSpec >> textContent: anObject [

	textContent := anObject
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
