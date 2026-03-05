Class {
	#name : 'CpWebAwesomeExamplesWebClientBehavior',
	#superclass : 'CpWebClientBehavior',
	#category : 'CodeParadise-WebApplication-WebAwesome-Examples',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Examples'
}

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleButton [

	<example: 'Button' order: 100>

	| outputElement button disabledState loadingState pillState outlineState |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement appendChild: (WaButton label: 'Button').

	self subheading: 'Variants' on: outputElement.
	outputElement appendChild: (WaButton new variantBeNeutral ; label: 'Neutral' ; yourself).
	outputElement appendChild: (WaButton new variantBeBrand ; label: 'Brand' ; yourself).
	outputElement appendChild: (WaButton new variantBeSuccess ; label: 'Success' ; yourself).
	outputElement appendChild: (WaButton new variantBeWarning ; label: 'Warning' ; yourself).
	outputElement appendChild: (WaButton new variantBeDanger ; label: 'Danger' ; yourself).
 
	self subheading: 'Appearance' on: outputElement.
	outputElement appendChild: (WaButton new variantBeNeutral; appearanceBeAccent; label: 'Accent'; yourself).
	outputElement appendChild: (WaButton new variantBeNeutral; appearanceBeFilledOutlined; label: 'Filled + Outlined'; yourself).
	outputElement appendChild: (WaButton new variantBeNeutral; appearanceBeFilled; label: 'Filled'; yourself).
	outputElement appendChild: (WaButton new variantBeNeutral; appearanceBeOutlined; label: 'Outlined'; yourself).
	outputElement appendChild: (WaButton new variantBeNeutral; appearanceBePlain; label: 'Plain'; yourself).
	outputElement appendChild: (CpHtmlElement newWithTag: #p).
	outputElement appendChild: (WaButton new variantBeBrand; appearanceBeAccent; label: 'Accent'; yourself).
	outputElement appendChild: (WaButton new variantBeBrand; appearanceBeFilledOutlined; label: 'Filled + Outlined'; yourself).
	outputElement appendChild: (WaButton new variantBeBrand; appearanceBeFilled; label: 'Filled'; yourself).
	outputElement appendChild: (WaButton new variantBeBrand; appearanceBeOutlined; label: 'Outlined'; yourself).
	outputElement appendChild: (WaButton new variantBeBrand; appearanceBePlain; label: 'Plain'; yourself).
	outputElement appendChild: (CpHtmlElement newWithTag: #p).
	outputElement appendChild: (WaButton new variantBeSuccess ; appearanceBeAccent; label: 'Accent'; yourself).
	outputElement appendChild: (WaButton new variantBeSuccess; appearanceBeFilledOutlined; label: 'Filled + Outlined'; yourself).
	outputElement appendChild: (WaButton new variantBeSuccess; appearanceBeFilled; label: 'Filled'; yourself).
	outputElement appendChild: (WaButton new variantBeSuccess; appearanceBeOutlined; label: 'Outlined'; yourself).
	outputElement appendChild: (WaButton new variantBeSuccess; appearanceBePlain; label: 'Plain'; yourself).
	outputElement appendChild: (CpHtmlElement newWithTag: #p).
	outputElement appendChild: (WaButton new variantBeWarning; appearanceBeAccent; label: 'Accent'; yourself).
	outputElement appendChild: (WaButton new variantBeWarning; appearanceBeFilledOutlined; label: 'Filled + Outlined'; yourself).
	outputElement appendChild: (WaButton new variantBeWarning; appearanceBeFilled; label: 'Filled'; yourself).
	outputElement appendChild: (WaButton new variantBeWarning; appearanceBeOutlined; label: 'Outlined'; yourself).
	outputElement appendChild: (WaButton new variantBeWarning; appearanceBePlain; label: 'Plain'; yourself).
	outputElement appendChild: (CpHtmlElement newWithTag: #p).
	outputElement appendChild: (WaButton new variantBeDanger; appearanceBeAccent; label: 'Accent'; yourself).
	outputElement appendChild: (WaButton new variantBeDanger; appearanceBeFilledOutlined; label: 'Filled + Outlined'; yourself).
	outputElement appendChild: (WaButton new variantBeDanger; appearanceBeFilled; label: 'Filled'; yourself).
	outputElement appendChild: (WaButton new variantBeDanger; appearanceBeOutlined; label: 'Outlined'; yourself).
	outputElement appendChild: (WaButton new variantBeDanger; appearanceBePlain; label: 'Plain'; yourself).

	self subheading: 'Sizes' on: outputElement.
	outputElement appendChild: (WaButton new sizeBeSmall; label: 'Small'; yourself).
	outputElement appendChild: (WaButton new sizeBeMedium; label: 'Medium'; yourself).
	outputElement appendChild: (WaButton new sizeBeLarge; label: 'Large'; yourself).

	self subheading: 'Pill Buttons' on: outputElement.
	outputElement appendChild: (WaButton new pill: true; sizeBeSmall; label: 'Small'; yourself).
	outputElement appendChild: (WaButton new pill: true; sizeBeMedium; label: 'Medium'; yourself).
	outputElement appendChild: (WaButton new pill: true; sizeBeLarge; label: 'Large'; yourself).

	self subheading: 'Link Buttons' on: outputElement.
	self todoOn: outputElement.

	self subheading: 'Icon Buttons' on: outputElement.
	outputElement appendChild: (
		#div asHtmlTag
			addClass: #'wa-cluster';
			appendChild: (WaButton new variantBeNeutral; appearanceBeAccent; label: (WaIcon name: 'house' label: 'Home'); yourself);
			appendChild: (WaButton new variantBeNeutral; appearanceBeOutlined; label: (WaIcon name: 'house' label: 'Home'); yourself);
			appendChild: (WaButton new variantBeNeutral; appearanceBeFilled; label: (WaIcon name: 'house' label: 'Home'); yourself);
			appendChild: (WaButton new variantBeNeutral; appearanceBePlain; label: (WaIcon name: 'house' label: 'Home'); yourself);
			yourself).

	self subheading: 'Setting a Custom Width' on: outputElement.
	outputElement appendChild: (WaButton new sizeBeSmall ; label: 'Small'; styleAt: 'width' put: '100%'; styleAt: 'margin-bottom' put: '1rem'; yourself).
	outputElement appendChild: (WaButton new sizeBeMedium ; label: 'Medium'; styleAt: 'width' put: '100%'; styleAt: 'margin-bottom' put: '1rem'; yourself).
	outputElement appendChild: (WaButton new sizeBeLarge ; label: 'Large'; styleAt: 'width' put: '100%'; yourself).

	self subheading: 'Start & End Decorations' on: outputElement.
	outputElement appendChild: (WaButton new sizeBeSmall; label: 'Settings'; start: (WaIcon name: 'gear'); yourself).
	outputElement appendChild: (WaButton new sizeBeSmall; label: 'Refresh'; end: (WaIcon name: 'undo'); yourself).
	outputElement appendChild: (WaButton new sizeBeSmall; label: 'Open'; start: (WaIcon name: 'link'); end: (WaIcon name: 'arrow-up-right-from-square'); yourself).
	outputElement appendChild: #br asHtmlTag.
	outputElement appendChild: (WaButton new label: 'Settings'; start: (WaIcon name: 'gear'); yourself).
	outputElement appendChild: (WaButton new label: 'Refresh'; end: (WaIcon name: 'undo'); yourself).
	outputElement appendChild: (WaButton new label: 'Open'; start: (WaIcon name: 'link'); end: (WaIcon name: 'arrow-up-right-from-square'); yourself).
	outputElement appendChild: #br asHtmlTag.
	outputElement appendChild: (WaButton new sizeBeLarge; label: 'Settings'; start: (WaIcon name: 'gear'); yourself).
	outputElement appendChild: (WaButton new sizeBeLarge; label: 'Refresh'; end: (WaIcon name: 'undo'); yourself).
	outputElement appendChild: (WaButton new sizeBeLarge; label: 'Open'; start: (WaIcon name: 'link'); end: (WaIcon name: 'arrow-up-right-from-square'); yourself).

	self subheading: 'Caret' on: outputElement.
	outputElement appendChild: (WaButton new withCaretBeOn; sizeBeSmall; label: (WaIcon name: 'gear' label: 'Settings'); yourself).
	outputElement appendChild: (WaButton new withCaretBeOn; sizeBeSmall; label: 'Small'; yourself).
	outputElement appendChild: (WaButton new withCaretBeOn; sizeBeMedium; label: 'Medium'; yourself).
	outputElement appendChild: (WaButton new withCaretBeOn; sizeBeLarge; label: 'Large'; yourself).

	self subheading: 'Loading' on: outputElement.
	outputElement appendChild: (WaButton new loadingBeOn; variantBeBrand; label: 'Brand'; yourself).
	outputElement appendChild: (WaButton new loadingBeOn; variantBeSuccess; label: 'Success'; yourself).
	outputElement appendChild: (WaButton new loadingBeOn; variantBeNeutral; label: 'Neutral'; yourself).
	outputElement appendChild: (WaButton new loadingBeOn; variantBeWarning; label: 'Warning'; yourself).
	outputElement appendChild: (WaButton new loadingBeOn; variantBeDanger; label: 'Danger'; yourself).

	self subheading: 'Disabled' on: outputElement.
	outputElement appendChild: (WaButton new disabledBeOn; variantBeBrand; label: 'Brand'; yourself).
	outputElement appendChild: (WaButton new disabledBeOn; variantBeSuccess; label: 'Success'; yourself).
	outputElement appendChild: (WaButton new disabledBeOn; variantBeNeutral; label: 'Neutral'; yourself).
	outputElement appendChild: (WaButton new disabledBeOn; variantBeWarning; label: 'Warning'; yourself).
	outputElement appendChild: (WaButton new disabledBeOn; variantBeDanger; label: 'Danger'; yourself).

	self subheading: 'Styling Buttons' on: outputElement.
	self todoOn: outputElement.

	self subheading: 'Misc' on: outputElement.
	button := outputElement appendChild: (WaButton label: 'Hello world').
	button variantBeBrand.
	outputElement appendChild: (disabledState := WaCheckbox label: 'Disabled').
	outputElement appendChild: (loadingState := WaCheckbox label: 'Loading').
	outputElement appendChild: (pillState := WaCheckbox label: 'Pill').
	outputElement appendChild: (outlineState := WaCheckbox label: 'Outline').
	disabledState when: WaChangeEvent do: [ disabledState checkedIsOn ifTrue: [ button disabled: true ] ifFalse: [ button disabled: false ] ] for: self.
	loadingState when: WaChangeEvent do: [ loadingState checkedIsOn ifTrue: [ button loading: true ] ifFalse: [ button loading: false ] ] for: self.
	pillState when: WaChangeEvent do: [ pillState checkedIsOn ifTrue: [ button pill: true ] ifFalse: [ button pill: false ] ] for: self.
	outlineState when: WaChangeEvent do: [ outlineState checkedIsOn ifTrue: [ button appearanceBeOutlined ] ifFalse: [ button appearanceBePlain ] ] for: self.

]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleButtonGroup [

	<example: 'ButtonGroup' order: 100>

	| outputElement |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement appendChild: (WaButtonGroup new
		label: 'Alignment';
		appendChild: (WaButton new label: 'Left'; yourself);
		appendChild: (WaButton new label: 'Center'; yourself);
		appendChild: (WaButton new label: 'Right'; yourself);
		yourself).

	self subheading: 'Vertical Button Groups' on: outputElement.
	outputElement appendChild: (WaButtonGroup new
		label: 'Options';
		appendChild: (WaButton new start: (WaIcon name: 'plus'); label: 'New'; yourself);
		appendChild: (WaButton new start: (WaIcon name: 'folder-open'); label: 'Open'; yourself);
		appendChild: (WaButton new start: (WaIcon name: 'save'); label: 'Save'; yourself);
		appendChild: (WaButton new start: (WaIcon name: 'print'); label: 'Print'; yourself);
		yourself).

	self subheading: 'Theme Buttons' on: outputElement.
	outputElement appendChild: (WaButtonGroup new
		variantBeBrand;
		label: 'Alignment';
		appendChild: (WaButton new label: 'Left'; yourself);
		appendChild: (WaButton new label: 'Center'; yourself);
		appendChild: (WaButton new label: 'Right'; yourself);
		yourself).
	outputElement appendChild: #br asHtmlTag.
	outputElement appendChild: (WaButtonGroup new
		variantBeSuccess;
		label: 'Alignment';
		appendChild: (WaButton new label: 'Left'; yourself);
		appendChild: (WaButton new label: 'Center'; yourself);
		appendChild: (WaButton new label: 'Right'; yourself);
		yourself).
	outputElement appendChild: #br asHtmlTag.
	outputElement appendChild: (WaButtonGroup new
		label: 'Alignment';
		appendChild: (WaButton new label: 'Left'; yourself);
		appendChild: (WaButton new label: 'Center'; yourself);
		appendChild: (WaButton new label: 'Right'; yourself);
		yourself).
	outputElement appendChild: #br asHtmlTag.
	outputElement appendChild: (WaButtonGroup new
		variantBeWarning;
		label: 'Alignment';
		appendChild: (WaButton new label: 'Left'; yourself);
		appendChild: (WaButton new label: 'Center'; yourself);
		appendChild: (WaButton new label: 'Right'; yourself);
		yourself).
	outputElement appendChild: #br asHtmlTag.
	outputElement appendChild: (WaButtonGroup new
		variantBeDanger;
		label: 'Alignment';
		appendChild: (WaButton new label: 'Left'; yourself);
		appendChild: (WaButton new label: 'Center'; yourself);
		appendChild: (WaButton new label: 'Right'; yourself);
		yourself).
	outputElement appendChild: #br asHtmlTag.
	outputElement appendChild: #br asHtmlTag.
	outputElement appendChild: (WaButtonGroup new
		variantBeBrand;
		label: 'Alignment';
		appendChild: (WaButton new label: 'Left'; yourself);
		appendChild: (WaButton new label: 'Center'; yourself);
		appendChild: (WaButton new variantBeWarning; label: 'Right'; yourself);
		yourself).
	outputElement appendChild: #br asHtmlTag.

	self subheading: 'Pill Buttons' on: outputElement.
	outputElement appendChild: (WaButtonGroup new
		label: 'Alignment';
		appendChild: (WaButton new pillBeOn; sizeBeSmall; label: 'Left'; yourself);
		appendChild: (WaButton new pillBeOn; sizeBeSmall; label: 'Center'; yourself);
		appendChild: (WaButton new pillBeOn; sizeBeSmall; label: 'Right'; yourself);
		yourself).
	outputElement appendChild: #br asHtmlTag.
	outputElement appendChild: (WaButtonGroup new
		label: 'Alignment';
		appendChild: (WaButton new pillBeOn; sizeBeMedium; label: 'Left'; yourself);
		appendChild: (WaButton new pillBeOn; sizeBeMedium; label: 'Center'; yourself);
		appendChild: (WaButton new pillBeOn; sizeBeMedium; label: 'Right'; yourself);
		yourself).
	outputElement appendChild: #br asHtmlTag.
	outputElement appendChild: (WaButtonGroup new
		label: 'Alignment';
		appendChild: (WaButton new pillBeOn; sizeBeLarge; label: 'Left'; yourself);
		appendChild: (WaButton new pillBeOn; sizeBeLarge; label: 'Center'; yourself);
		appendChild: (WaButton new pillBeOn; sizeBeLarge; label: 'Right'; yourself);
		yourself).

	self subheading: 'Dropdowns in Button Groups' on: outputElement.
	self todoOn: outputElement.

	self subheading: 'Split Buttons' on: outputElement.
	self todoOn: outputElement.

	self subheading: 'Tooltips in Button Groups' on: outputElement.
	self todoOn: outputElement.

]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleCheckbox [

	<example: 'Checkbox' order: 100>

	| outputElement |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement
		appendChild: ((CpHtmlElement newWithTag: #div)
			appendChild: (WaCheckbox label: 'Works') ;
			yourself) ;
		appendChild: ((CpHtmlElement newWithTag: #div)
			appendChild: ((WaCheckbox label: 'Amazing') indeterminateBeOn ; yourself) ;
			yourself) ;
		appendChild: ((CpHtmlElement newWithTag: #div)
			appendChild: ((WaCheckbox label: 'Not me') disabledBeOn ; yourself) ;
			yourself)
]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleDialog [

	<example: 'Dialog' order: 200>

	| outputElement regularDialog modalDialog mixedDialog modalCheckbox focusDialog focusCheckbox |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	"Create a simple dialog with a paragraph of text"
	regularDialog := WaDialog new
		lightDismissBeOn;
		label: 'First dialog' ;
		appendChild: ('Hello world' inHtmlTag: #p) ;
		yourself.

	"Add a close button in the dialog footer"
	regularDialog footer: ((WaButton label: 'Close')
		when: CpClickEvent basicPrimary send: #openBeOff to: regularDialog ;
		yourself).

	"Create a simple dialog with a paragraph of text"
	modalDialog := WaDialog new
		lightDismissBeOff;
		label: 'Modal dialog' ;
		appendChild: ('You have to click the close button to close this dialog. Clicking outside the dialog will not close it (in contrast to regular dialog).' inHtmlTag: #p) ;
		yourself.

	"Add a close button in the dialog footer"
	modalDialog footer: ((WaButton label: 'Close please!')
		when: CpClickEvent basicPrimary send: #openBeOff to: modalDialog ;
		yourself).

	"Create a mixed dialog with a paragraph of text"
	mixedDialog := WaDialog new
		lightDismissBeOff;
		label: 'Mixed dialog' ;
		appendChild: ('This is a mixed dialog. It can either be opened modal or regular. This allows for the same dialog to be reused for different purposes or different levels of ''requiredness''. Have fun!' inHtmlTag: #p) ;
		yourself.

	"Add a close button in the dialog footer"
	mixedDialog footer: ((WaButton label: 'Bye!')
		when: CpClickEvent basicPrimary send: #openBeOff to: mixedDialog ;
		yourself).

	"Create a focus dialog with a paragraph of text and 3 input fields"
	focusDialog := WaDialog new
		label: 'Focus dialog' ;
		appendChild: ('This is a focus dialog. It is used to show the focus can be set on a specific element inside the dialog when showing it. Have fun!' inHtmlTag: #p) ;
		appendChild: ((WaInput label: 'First') id: #first ; autofocusBeOn ; hintText: 'I am default but that can be overriden' ; yourself) ;
		appendChild: ((WaInput label: 'Second') id: #second ; yourself) ;
		appendChild: ((WaInput label: 'Third') id: #third ; yourself) ;
		yourself.

	"Add a close button in the dialog footer"
	focusDialog footer: ((WaButton label: 'Ciao!')
		when: CpClickEvent basicPrimary send: #openBeOff to: focusDialog ;
		yourself).

	"Add buttons to the example, these open the dialog in different ways"
	outputElement
		appendChild: ((WaButton label: 'Open regular')
			when: CpClickEvent basicPrimary send: #openBeOn to: regularDialog ;
			yourself) ;
		appendChild: ((WaButton label: 'Open modal')
			when: CpClickEvent basicPrimary send: #openBeOn to: modalDialog ;
			yourself) ;
		appendChild: ('' inHtmlTag: #p) ;
		appendChild: (modalCheckbox := WaCheckbox label: 'modal') ;
		appendChild: (' ' inHtmlTag: #span) ;
		appendChild: ((WaButton label: 'Mixed dialog')
			when: CpClickEvent basicPrimary do: [
				modalCheckbox checkedIsOn ifTrue: [ mixedDialog lightDismissBeOff ] ifFalse: [ mixedDialog lightDismissBeOn ].
				mixedDialog openBeOn ] for: self ;
			yourself) ;
		appendChild: ('' inHtmlTag: #p) ;
		appendChild: (focusCheckbox := WaCheckbox label: 'focus 3rd input field') ;
		appendChild: (' ' inHtmlTag: #span) ;
		appendChild: ((WaButton label: 'Focus dialog')
			when: CpClickEvent basicPrimary do: [
				focusCheckbox checkedIsOn
					ifTrue: [
						(focusDialog firstDescendantMatching: '#first') autofocusBeOff.
						(focusDialog firstDescendantMatching: '#third') autofocusBeOn ]
					ifFalse: [
						(focusDialog firstDescendantMatching: '#first') autofocusBeOn.
						(focusDialog firstDescendantMatching: '#third') autofocusBeOff ].
					focusDialog openBeOn ] for: self ;
			yourself) ;
		appendChild: regularDialog ;
		appendChild: modalDialog ;
		appendChild: mixedDialog ;
		appendChild: focusDialog

]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleDrawer [

	<example: 'Drawer' order: 200>

	| outputElement drawer1 drawer2 |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	"Create some simple drawers with a paragraph of text"
	drawer1 := (WaDrawer label: 'First drawer')
		lightDismissBeOn;
		placementBeStart ;
		appendChild: ('Hello y''all. This is a paragraph in a regular drawer. It became visible because you pushed the blue button. The drawer can be closed by clicking outside the drawer.' inHtmlTag: #p) ;
		yourself.
	drawer2 := (WaDrawer label: 'First drwaer')
		lightDismissBeOn;
		placementBeEnd ;
		appendChild: ('Hello there. This is a paragraph in a modal drawer. It became visible because you pushed the red button. The drawer must be closed by the button inside the drawer.' inHtmlTag: #p) ;
		yourself.

	"Add a close button in the drawer footer"
	drawer1 footer: ((WaButton label: 'Close')
		when: CpClickEvent basicPrimary send: #openBeOff to: drawer1 ;
		yourself).

	"Add a close button in the drawer footer"
	drawer2 footer: ((WaButton label: 'Close')
		when: CpClickEvent basicPrimary send: #openBeOff to: drawer2 ;
		yourself).

	"Add buttons to the example, these open the dialog in different ways"
	outputElement
		appendChild: ((WaButton label: 'Open left')
			variantBeBrand ;
			when: CpClickEvent basicPrimary send: #openBeOn to: drawer1 ;
			yourself) ;
		appendChild: ((WaButton label: 'Open right')
			variantBeWarning ;
			when: CpClickEvent basicPrimary do: [ drawer2 withoutHeaderBeOn; lightDismissBeOff; openBeOn ] for: self ;
			yourself) ;
		appendChild: drawer1 ;
		appendChild: drawer2

]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleIcon [
	"FontAwesome Free"

	<example: 'Icon FA Free' order: 100>

	| outputElement stack flank cluster div |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement appendChild: ((WaIcon name: 'font-awesome') "variant: 'light';" label: 'Awesome'; styleAt: 'font-size' put: '2em'; yourself).

	self subheading: 'Families & Variants' on: outputElement.
	stack := #div asHtmlElement addClass: 'wa-stack'; addClass: 'wa-gap-xl'; yourself.

	flank := #div asHtmlElement addClass: 'wa-flank'; styleAt: 'flank-size' put: '12ch'; yourself.
	cluster := #div asHtmlElement addClass: 'wa-cluster'; styleAt: 'font-size' put: '1.5em'; yourself.
	cluster
		appendChild: (WaIcon name: 'house');
		appendChild: ((WaIcon name: 'house') variant: 'regular'; yourself);
		"appendChild: ((WaIcon name: 'house') variant: 'light'; yourself);"
		"appendChild: ((WaIcon name: 'house') variant: 'dark'; yourself);"
		yourself.
	stack appendChild: (flank appendChild: 'Classic' asHtmlElement; appendChild: cluster; yourself).

	flank := #div asHtmlElement addClass: 'wa-flank'; styleAt: 'flank-size' put: '12ch'; yourself.
	cluster := #div asHtmlElement addClass: 'wa-cluster'; styleAt: 'font-size' put: '1.5em'; yourself.
	cluster
		appendChild: ((WaIcon name: 'font-awesome') family: 'brands'; yourself);
		appendChild: ((WaIcon name: 'web-awesome') family: 'brands'; yourself);
		appendChild: ((WaIcon name: 'github') family: 'brands'; yourself);
		appendChild: ((WaIcon name: 'discord') family: 'brands'; yourself);
		yourself.
	stack appendChild: (flank appendChild: 'Brands' asHtmlElement; appendChild: cluster; yourself).

	outputElement appendChild: stack.

	self subheading: 'Sizing' on: outputElement.
	cluster := #div asHtmlElement addClass: 'wa-cluster'; styleAt: 'font-size' put: '44px'; yourself.
	cluster
		appendChild: (WaIcon name: 'bell');
		appendChild: (WaIcon name: 'heart');
		appendChild: (WaIcon name: 'image');
		appendChild: (WaIcon name: 'microphone');
		appendChild: (WaIcon name: 'search');
		appendChild: (WaIcon name: 'star');
		yourself.
	outputElement appendChild: cluster.

	self subheading: 'Auto Width' on: outputElement.
	div := #div asHtmlElement styleAt: 'font-size' put: '1.5em'; styleAt: 'color' put: '#193154'; yourself.
	#('exclamation' 'circle-check' 'ruler-vertical' 'ruler-horizontal')
		do: [ :each | | icon |
			icon := (WaIcon name: each) family: 'solid'; styleAt: 'background' put: 'lightsalmon'; yourself.
			div appendChild: icon ].
	outputElement appendChild: 'With auto-width' asHtmlElement; appendChild: #br asHtmlTag; appendChild: div.
	div := #div asHtmlElement styleAt: 'font-size' put: '1.5em'; styleAt: 'color' put: '#193154'; yourself.
	#('exclamation' 'circle-check' 'ruler-vertical' 'ruler-horizontal')
		do: [ :each | | icon |
			icon := (WaIcon name: each) autoWidthBeOn; family: 'solid'; styleAt: 'background' put: 'lightsalmon'; yourself.
			div appendChild: icon ].
	outputElement appendChild: #br asHtmlTag.
	outputElement appendChild: 'Without auto-width' asHtmlElement; appendChild: #br asHtmlTag; appendChild: div.

	self subheading: 'Colors' on: outputElement.
	cluster := #div asHtmlElement addClass: 'wa-cluster'; styleAt: 'font-size' put: '1.5em'; yourself.
	cluster
		"appendChild: ((WaIcon name: 'strawberry') styleAt: 'color' put: 'salmon'; yourself);
		appendChild: ((WaIcon name: 'crab') styleAt: 'color' put: 'coral'; yourself);"
		appendChild: ((WaIcon name: 'sun') styleAt: 'color' put: 'gold'; yourself);
		appendChild: ((WaIcon name: 'leaf') styleAt: 'color' put: 'mediumseagreen'; yourself);
		appendChild: ((WaIcon name: 'cloud-showers-heavy') styleAt: 'color' put: 'steelblue'; yourself);
		"appendChild: ((WaIcon name: 'cat-space') styleAt: 'color' put: 'mediumpurple'; yourself);"
		yourself.
	outputElement appendChild: cluster.

]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleIconBootstrap [

	<example: 'Icon Bootstrap' order: 100>

	| outputElement |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement
		appendChild: (WaIcon fullyNamed: 'bootstrap:emoji-smile') ;
		appendChild: (WaIcon fullyNamed: 'bootstrap:heart') ;
		appendChild: (WaIcon fullyNamed: 'bootstrap:hand-thumbs-up-fill') ;
		appendChild: (WaIcon fullyNamed: 'bootstrap:star-fill')

]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleInput [

	<example: 'Input' order: 100>

	| outputElement input disabledState pillState clearableState |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement appendChild: (WaInput new label: 'Need your input' ; yourself).

	outputElement appendChild: (CpHtmlElement newWithTag: #p).

	outputElement appendChild: (WaInput new placeholder: 'Your first name' ; yourself).

	outputElement appendChild: (CpHtmlElement newWithTag: #p).

	outputElement appendChild: (WaInput new typeBePassword ; passwordToggleBeOn ; label: 'Your password' ; yourself).

	outputElement appendChild: (CpHtmlElement newWithTag: #p).

	outputElement appendChild: (WaInput new hintText: 'I''m here to help you' ; label: 'Input with help text' ; placeholder: 'Anything you want to share?' ; yourself).

	outputElement appendChild: (CpHtmlElement newWithTag: #p).

	outputElement appendChild: (WaInput new
		hint: ((CpHtmlElement newWithTag: #span) appendChild: ('Happy help ' inHtmlTag: #span) ; appendChild: (WaIcon fullyNamed: 'bootstrap:emoji-smile') ; yourself) ;
		label: 'Happy input (with help HTML and icons)' ;
		placeholder: 'Anything you want to share?' ;
		start: (WaIcon fullyNamed: 'bootstrap:emoji-smile') ;
		end: (WaIcon fullyNamed: 'bootstrap:emoji-smile') ;
		yourself).

	outputElement appendChild: (CpHtmlElement newWithTag: #p).

	input := outputElement appendChild: (WaInput new label: 'Need more input').
	outputElement appendChild: (disabledState := WaCheckbox label: 'Readonly').
	outputElement appendChild: (pillState := WaCheckbox label: 'Pill').
	outputElement appendChild: (clearableState := WaCheckbox label: 'Clearable').
	disabledState when: WaChangeEvent do: [ disabledState checkedIsOn ifTrue: [ input readonlyBeOn ] ifFalse: [ input readonlyBeOff ] ] for: self.
	pillState when: WaChangeEvent do: [ pillState checkedIsOn ifTrue: [ input pillBeOn ] ifFalse: [ input pillBeOff ] ] for: self.
	clearableState when: WaChangeEvent do: [ clearableState checkedIsOn ifTrue: [ input withClearBeOn ] ifFalse: [ input withClearBeOff ] ] for: self.

]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> examplePopover [

	<example: 'Popover' order: 100>

	| outputElement popover button |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	popover := WaPopover new
		for: 'popover__overview';
		markupContent: '
  <div style="display: flex; flex-direction: column; gap: 1rem;">
    <p>This popover contains interactive content that users can engage with directly.</p>
    <wa-button variant="primary" size="small">Take Action</wa-button>
  </div>';
		yourself.
	button := WaButton new
		id: 'popover__overview';
		textContent: 'Show popover'.
	outputElement
		appendChild: popover;
		appendChild: button.

]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> examplePopup [

	<example: 'Popup' order: 100>

	| outputElement div popup switch |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement markupContent: '
<style>
  .popup-active span[slot=''anchor''] {
    display: inline-block;
    width: 150px;
    height: 150px;
    border: dashed 2px var(--wa-color-neutral-fill-loud);
    margin: 50px;
  }

  .popup-active .box {
    width: 100px;
    height: 50px;
    background: var(--wa-color-brand-fill-loud);
    border-radius: var(--wa-border-radius-m);
  }
</style>
'.
	div := #div asHtmlTag
		addClass: 'popup-active';
		appendChild: (popup := WaPopup new
			placementBeTop; activeBeOn;
			appendChild: (#span asHtmlTag attributeAt: 'slot' put: 'anchor'; yourself);
			appendChild: (#div asHtmlTag addClass: 'box'; yourself);
			yourself);
		appendChild: #br asHtmlTag;
		appendChild: (WaSwitch new checkedBeOn; yourself);
		yourself.
	"Using markupContent: replaces all child elements, so append the div afterwards"
	outputElement appendChild: div.
	switch := outputElement firstDescendantMatching: WaSwitch asCssSelector.
	switch when: CpChangeEvent do: [ popup active: switch checkedIsOn ] for: self.

]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleRadioGroup [

	<example: 'RadioGroup' order: 100>

	| outputElement |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement appendChild: (WaRadioGroup new
		label: 'Select an option';
		name: 'a';
		value: '1';
		appendChild: (WaRadio new label: 'Option 1'; value: '1'; yourself);
		appendChild: (WaRadio new label: 'Option 2'; value: '2'; yourself);
		appendChild: (WaRadio new label: 'Option 3'; value: '3'; yourself);
		yourself).

]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleSelect [

	<example: 'Select' order: 100>

	| outputElement |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement
		appendChild: ('Regular select' inHtmlTag: #p) ;
		appendChild: (WaSelect new
			appendChild: (WaOption value: #first labelText: 'First' ) ;
			appendChild: (WaOption value: #second labelText: 'Second' ) ;
			appendChild: (WaOption value: #third labelText: 'Third' ) ;
			yourself) ;
		appendChild: ('Multiple select' inHtmlTag: #p) ;
		appendChild: (WaSelect new
			multipleBeOn ;
			appendChild: (WaOption value: #first labelText: 'First' ) ;
			appendChild: (WaOption value: #second labelText: 'Second' ) ;
			appendChild: (WaOption value: #third labelText: 'Third' ) ;
			yourself) ;
		appendChild: ('Disabled select' inHtmlTag: #p) ;
		appendChild: (WaSelect new
			disabledBeOn ;
			appendChild: (WaOption value: #first labelText: 'First' ) ;
			appendChild: (WaOption value: #second labelText: 'Second' ) ;
			appendChild: (WaOption value: #third labelText: 'Third' ) ;
			yourself) ;
		appendChild: ('Pilled select' inHtmlTag: #p) ;
		appendChild: (WaSelect new
			pillBeOn ;
			appendChild: (WaOption value: #first labelText: 'First' ) ;
			appendChild: (WaOption value: #second labelText: 'Second' ) ;
			appendChild: (WaOption value: #third labelText: 'Third' ) ;
			yourself)
]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleSplitPanel [

	<example: 'SplitPanel' order: 100>

	| outputElement splitPanelElement |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	splitPanelElement := WaSplitPanel new.
	splitPanelElement
		start: (#div asHtmlTag
			styleAt: 'height' put: '200px';
			styleAt: 'background' put: 'var(--wa-color-surface-lowered)';
			styleAt: 'display' put: 'flex';
			styleAt: 'align-items' put: 'center';
			styleAt: 'justify-content' put: 'center';
			styleAt: 'overflow' put: 'hidden';
			yourself);
		end: (#div asHtmlTag
			styleAt: 'height' put: '200px';
			styleAt: 'background' put: 'var(--wa-color-surface-lowered)';
			styleAt: 'display' put: 'flex';
			styleAt: 'align-items' put: 'center';
			styleAt: 'justify-content' put: 'center';
			styleAt: 'overflow' put: 'hidden';
			yourself);
		yourself.
	outputElement appendChild: splitPanelElement
]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleSwitch [

	<example: 'Switch' order: 100>

	| outputElement |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement
		appendChild: ('Some switches' inHtmlTag: #p) ;
		appendChild: WaSwitch new ;
		appendChild: (WaSwitch new checkedBeOn ; yourself) ;
		appendChild: (WaSwitch new disabledBeOn ; yourself) ;
		appendChild: (WaSwitch new disabledBeOn ; checkedBeOn ; yourself)
]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleTabGroup [

	<example: 'Tab Group' order: 100>

	| outputElement tabGroup |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	tabGroup := WaTabGroup new.
	tabGroup
		appendChild: (WaTab new panel: 'general'; textContent: 'General'; yourself);
		appendChild: (WaTab new panel: 'custom'; textContent: 'Custom'; yourself);
		appendChild: (WaTab new panel: 'advanced'; textContent: 'Advanced'; yourself);
		appendChild: (WaTab new panel: 'disabled'; disabledBeOn; textContent: 'Disabled'; yourself);
		yourself.
	tabGroup
		appendChild: (WaTabPanel new name: 'general'; textContent: 'This is the general tab panel.'; yourself);
		appendChild: (WaTabPanel new name: 'custom'; textContent: 'This is the custom tab panel.'; yourself);
		appendChild: (WaTabPanel new name: 'advanced'; textContent: 'This is the advanced tab panel.'; yourself);
		appendChild: (WaTabPanel new name: 'disabled'; textContent: 'This is a disabled tab panel.'; yourself);
		yourself.

	outputElement appendChild: tabGroup.

]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> exampleTextarea [

	<example: 'Textarea' order: 100>

	| outputElement input disabledState resizeableState |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement appendChild: (WaTextarea new label: 'Need your input' ; yourself).

	outputElement appendChild: (CpHtmlElement newWithTag: #p).

	outputElement appendChild: (WaTextarea new placeholder: 'Your first name' ; yourself).

	outputElement appendChild: (CpHtmlElement newWithTag: #p).

	outputElement appendChild: (WaTextarea new hintText: 'I''m here to help you' ; label: 'Textarea with help text' ; placeholder: 'Anything you want to share?' ; yourself).

	outputElement appendChild: (CpHtmlElement newWithTag: #p).

	outputElement appendChild: (WaTextarea new
		hint: ((CpHtmlElement newWithTag: #span) appendChild: ('Happy help ' inHtmlTag: #span) ; appendChild: (WaIcon fullyNamed: 'bootstrap:emoji-smile') ; yourself) ;
		label: 'Happy textarea (with help HTML and icons)' ;
		placeholder: 'Anything you want to share?' ;
		yourself).

	outputElement appendChild: (CpHtmlElement newWithTag: #p).

	input := outputElement appendChild: (WaTextarea new label: 'Need more input').
	outputElement appendChild: (disabledState := WaCheckbox label: 'Disabled').
	outputElement appendChild: (resizeableState := WaCheckbox label: 'Resizeable').
	disabledState when: WaChangeEvent do: [ disabledState checkedIsOn ifTrue: [ input disabledBeOn ] ifFalse: [ input disabledBeOff ] ] for: self.
	resizeableState when: WaChangeEvent do: [ resizeableState checkedIsOn ifTrue: [ input resizeBeVertical ] ifFalse: [ input resizeBeNone ] ] for: self.

]

{ #category : 'initialization' }
CpWebAwesomeExamplesWebClientBehavior >> initialize [

	super initialize.

	WaElement registerBootstrapIcons.

	self showIndex
]

{ #category : 'accessing' }
CpWebAwesomeExamplesWebClientBehavior >> outputElement [

	^ CpHtmlElement documentBody firstDescendantMatching: '#output'
]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> registerBootstrapIcons [

	CpHtmlElement documentAddModuleScript: '
  import { registerIconLibrary } from ''/dist/webawesome.js'';

  registerIconLibrary(''bootstrap'', {
    resolver: (name, family) => {
      const suffix = family === ''filled'' ? ''-fill'' : '''';
      return `https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/icons/${name}${suffix}.svg`;
    },
  });
'
]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> showIndex [

	"Beware: this method is NOT to be taken as exemplar for creating a UI.
	This class is just a collection of examples of UI possibilities."

	| body list items |

	CpHtmlElement documentAddStyle: '
		#menu {
			display: inline-block;
			width: 20em;
			height: calc(100vh - 6em);
			border-right: 1px solid #999;
		}
		#menu ul {
			list-style: none;
		}
		#menu li { 
			cursor: pointer;
			margin-bottom: .6em;
		}
		#result {
			position: absolute;
			display: inline-block;
			width: calc(100% - 24em);
			height: calc(100vh - 10em);
			padding: 2em;
		}
		#output {
			position: relative;
			width: 100%;
			height: 100%;
		}
		#output div {
			padding-top: 1em;
		}
		div.separator {
			height: 1em;
		}'.
	body := CpHtmlElement documentBody.
	body markupContent: '<h1>Web Awesome Examples</h1>
		<div style="width: 100%; margin: 0; padding: 0;">
			<div id="menu"><ul id="list"></ul></div><div id="result"><div id="output"></div></div>
		</div>
	'.

	list := body firstDescendantMatching: '#list'.

	"Collect items from example methods"

	items := 	OrderedCollection new.
	(self class selectors select: [ :each | each beginsWith: #example ]) do: [ :selector |
		(self class >> selector) properties ifNotNil: [ :properties |
			(properties at: #example:order:) ifNotNil: [ :pragma |
				items add: selector -> pragma arguments ] ] ].

	"Sort items (a and b are associations where the value contains the pragma arguments #title and #order)"
	items sort: [ :a :b |
		"Either the order of a is lower than order of b"
		(a value second < b value second) or: [
			"or the have the same order and a comes before b alphabetically" 
			(a value second = b value second) and: [ a value first < b value first ] ] ].

	"Render items onto DOM"
	items do: [ :item |
		| example |

		example := WaButton
			label: item value first		"ie title"
			end: (WaIcon fullyNamed: 'bootstrap:arrow-right').

		list appendChild: ((CpHtmlElement newWithTag: #li)
			appendChild: example ;
			yourself).

		"Register interest in events on the list item"
		example when: CpClickEvent basicPrimary send: item key to: self ]
]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> subheading: aString on: outputElement [

	outputElement
		appendChild: #p asHtmlTag;
		appendChild: (#h2 asHtmlTag textContent: aString; yourself).
]

{ #category : 'examples' }
CpWebAwesomeExamplesWebClientBehavior >> todoOn: outputElement [

	outputElement appendChild: (#p asHtmlTag textContent: 'TODO'; yourself).
]
