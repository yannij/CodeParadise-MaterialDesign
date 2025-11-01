Class {
	#name : 'SlmdWebClientBehavior',
	#superclass : 'CpMvpWebClientBehavior',
	#instVars : [
		'outputElement'
	],
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'login' }
SlmdWebClientBehavior >> addLoginButton [
	| dialog |

	CpHtmlElement documentBody appendChild: (#div asHtmlTag id: 'output'; yourself).
	outputElement := CpHtmlElement documentBody firstDescendantMatching: '#output'.
	outputElement textContent: ''.

	dialog := self findLoginDialog.
	outputElement
		appendChild: ((WaButton label: 'Login')
			when: CpClickEvent basicPrimary send: #show to: dialog;
			yourself).

]

{ #category : 'login' }
SlmdWebClientBehavior >> addLoginDialog: label [
	| dialog fields |

	fields := 'div' asHtmlTag
		addClass: 'slmd-fields';
		appendChild: (self fieldAt: #loginUsername label: 'Username' text: '');
		appendChild: (self fieldAt: #loginPassword label: 'Password' text: '');
		yourself.

	dialog := WaDialog new
		id: 'login-dialog';
		label: label;
		appendChild: fields;
		appendChild: (self buttonLabel: 'Login' icon: 'right-to-bracket' send: #requestLogin);
		yourself.

	"Do separately, so dialog is not nil"
	dialog appendChild: (self buttonLabel: 'Cancel' icon: 'xmark' send: #openBeOff receiver: dialog).

	CpHtmlElement documentBody appendChild: dialog.

]

{ #category : 'accessing' }
SlmdWebClientBehavior >> appName [
	"Answer name to be shown in Login dialog title"

	self subclassResponsibility
]

{ #category : 'accessing' }
SlmdWebClientBehavior >> appTagName [
	"Answer application web component tag name.

	Note: the #tagName method below involves hueristics in asKebabCase.
	If it fails to yield the correct tag name, thenn use the browser
	element inspector to find the correct tag name of the application
	web component.
	
	Example:
	SlmdDemoAccountingAppView tagName ==> 'slmd-demo-accounting-app'
	"

	self subclassResponsibility
]

{ #category : 'accessing' }
SlmdWebClientBehavior >> appViewElement [

	^ CpDomElement document firstDescendantMatching: self appTagName
]

{ #category : 'accessing' }
SlmdWebClientBehavior >> appViewId [

	^ self appViewElement id asSymbol
]

{ #category : 'login' }
SlmdWebClientBehavior >> buttonLabel: label icon: icon send: selector [

	^ self buttonLabel: label icon: icon send: selector receiver: self
]

{ #category : 'login' }
SlmdWebClientBehavior >> buttonLabel: label icon: icon send: selector receiver: receiver [

	^ WaButton new
		label: label;
		start: (WaIcon fullyNamed: icon);
		when: CpClickEvent basicPrimary send: selector to: receiver;
		styleAt: 'width' put: '100%';
		styleAt: 'padding' put: '0 8px 8px 8px';
		yourself.
]

{ #category : 'login' }
SlmdWebClientBehavior >> fieldAt: key label: aLabel text: aText [

	^ WaInput new
		name: key;
		addClass: 'slmd-input';
		labelText: aLabel;
		value: aText;
		hint: 'Help text...', aLabel;
		disabled: false;
		attributeAdd: #filled;
		yourself.

]

{ #category : 'login' }
SlmdWebClientBehavior >> findLoginDialog [

	^ CpHtmlElement documentBody firstDescendantMatching: '#login-dialog'

]

{ #category : 'initialization' }
SlmdWebClientBehavior >> initialize [

	super initialize.

	self addLoginDialog: self appName.
	"self addLoginButton."

]

{ #category : 'login' }
SlmdWebClientBehavior >> requestLogin [

	self traceCr: '==== request login'.
	self clientEnvironment serverAnnounce: (CpViewAnnouncement new
		viewId: self appViewId;
		announcement: SlmdLoginRequested new;
		yourself).
	self findLoginDialog openBeOff.

]
