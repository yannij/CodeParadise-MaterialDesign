Class {
	#name : 'WamWebClientBehavior',
	#superclass : 'CpMvpWebClientBehavior',
	#instVars : [
		'outputElement'
	],
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'login' }
WamWebClientBehavior >> addLoginDialog: label [
	| dialog fields |

	fields := 'div' asHtmlTag
		addClass: 'wam-fields';
		appendChild: (self fieldAt: #loginUsername label: 'Username' input: '');
		appendChild: (self fieldAt: #loginPassword label: 'Password' input: '');
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
WamWebClientBehavior >> appName [
	"Answer name to be shown in Login dialog title"

	self subclassResponsibility
]

{ #category : 'accessing' }
WamWebClientBehavior >> appTagName [
	"Answer application web component tag name.

	Note: the #tagName method below involves hueristics in asKebabCase.
	If it fails to yield the correct tag name, thenn use the browser
	element inspector to find the correct tag name of the application
	web component.
	
	Example:
	WamDemoAccountingAppView tagName ==> 'wam-demo-accounting-app'
	"

	self subclassResponsibility
]

{ #category : 'accessing' }
WamWebClientBehavior >> appViewElement [

	^ CpBrowserDocument current firstDescendantMatching: self appTagName
]

{ #category : 'accessing' }
WamWebClientBehavior >> appViewId [

	^ self appViewElement id asSymbol
]

{ #category : 'login' }
WamWebClientBehavior >> buttonLabel: label icon: icon send: selector [

	^ self buttonLabel: label icon: icon send: selector receiver: self
]

{ #category : 'login' }
WamWebClientBehavior >> buttonLabel: label icon: icon send: selector receiver: receiver [

	^ WaButton new
		label: label;
		start: (WaIcon fullyNamed: icon);
		when: CpClickEvent basicPrimary send: selector to: receiver;
		styleAt: 'width' put: '100%';
		styleAt: 'padding' put: '0 8px 8px 8px';
		yourself.
]

{ #category : 'login' }
WamWebClientBehavior >> fieldAt: key label: aLabel input: aText [

	^ WaInput new
		name: key;
		addClass: 'wam-input';
		labelText: aLabel;
		value: aText;
		hint: 'Help text...', aLabel;
		disabled: false;
		attributeAdd: #filled;
		yourself.

]

{ #category : 'login' }
WamWebClientBehavior >> findLoginDialog [

	^ CpHtmlElement documentBody firstDescendantMatching: '#login-dialog'

]

{ #category : 'initialization' }
WamWebClientBehavior >> initialize [

	super initialize.

	"self addLoginDialog: self appName."

]

{ #category : 'login' }
WamWebClientBehavior >> requestLogin [

	WamLog logTrace: '==== request login'.
	self clientEnvironment serverAnnounce: (CpViewAnnouncement new
		viewId: self appViewId;
		announcement: WamLoginRequested new;
		yourself).
	self findLoginDialog openBeOff.

]
