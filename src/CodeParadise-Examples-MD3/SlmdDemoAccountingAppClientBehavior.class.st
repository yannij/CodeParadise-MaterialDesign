Class {
	#name : 'SlmdDemoAccountingAppClientBehavior',
	#superclass : 'CpMvpWebClientBehavior',
	#instVars : [
		'outputElement'
	],
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'login' }
SlmdDemoAccountingAppClientBehavior >> addLoginButton [
	| dialog |

	CpHtmlElement documentBody appendChild: (#div asHtmlTag id: 'output'; yourself).
	outputElement := CpHtmlElement documentBody firstDescendantMatching: '#output'.
	outputElement textContent: ''.

	dialog := self findLoginDialog.
	outputElement
		appendChild: ((SlButton label: 'Login')
			when: CpClickEvent basicPrimary send: #show to: dialog;
			yourself).

]

{ #category : 'login' }
SlmdDemoAccountingAppClientBehavior >> addLoginDialog: label [
	| dialog fields |

	fields := #div asHtmlTag
		addClass: 'slmd-fields';
		appendChild: (self fieldAt: #loginUsername label: 'Username' text: '');
		appendChild: (self fieldAt: #loginPassword label: 'Password' text: '');
		yourself.

	dialog := SlDialog new
		id: 'login-dialog';
		label: label;
		appendChild: fields;
		appendChild: (self buttonLabel: 'Login' icon: 'box-arrow-in-left' send: #requestLogin);
		yourself.

	"Do separately, so dialog is not nil"
	dialog appendChild: (self buttonLabel: 'Cancel' icon: 'x' send: #hide receiver: dialog).

	CpHtmlElement documentBody appendChild: dialog.

]

{ #category : 'accessing' }
SlmdDemoAccountingAppClientBehavior >> appName [

	^ 'Accounting'
]

{ #category : 'accessing' }
SlmdDemoAccountingAppClientBehavior >> appTagName [

	^ 'slmd-demo-accounting-app'
]

{ #category : 'accessing' }
SlmdDemoAccountingAppClientBehavior >> appViewElement [

	^ CpDomElement document firstDescendantMatching: self appTagName
]

{ #category : 'accessing' }
SlmdDemoAccountingAppClientBehavior >> appViewId [

	^ self appViewElement id asSymbol
]

{ #category : 'login' }
SlmdDemoAccountingAppClientBehavior >> buttonLabel: label icon: icon send: selector [

	^ self buttonLabel: label icon: icon send: selector receiver: self
]

{ #category : 'login' }
SlmdDemoAccountingAppClientBehavior >> buttonLabel: label icon: icon send: selector receiver: receiver [

	^ SlButton new
		label: label;
		prefix: (SlIcon named: icon);
		when: CpClickEvent basicPrimary send: selector to: receiver;
		styleAt: 'width' put: '100%';
		styleAt: 'padding' put: '0 8px 8px 8px';
		yourself.
]

{ #category : 'login' }
SlmdDemoAccountingAppClientBehavior >> fieldAt: key label: aLabel text: aText [

	^ SlInput new
		name: key;
		addClass: 'slmd-input';
		labelText: aLabel;
		value: aText;
		"helpText: 'Help text...', aLabel;"
		disabled: false;
		attributeAdd: #filled;
		yourself.

]

{ #category : 'login' }
SlmdDemoAccountingAppClientBehavior >> findLoginDialog [

	^ CpHtmlElement documentBody firstDescendantMatching: '#login-dialog'

]

{ #category : 'initialization' }
SlmdDemoAccountingAppClientBehavior >> initialize [

	super initialize.

	self addLoginDialog: self appName.
	"self addLoginButton."

]

{ #category : 'login' }
SlmdDemoAccountingAppClientBehavior >> requestLogin [

	self traceCr: '==== request login'.
	self clientEnvironment serverAnnounce: (CpViewAnnouncement new
		viewId: self appViewId;
		announcement: SlmdLoginRequested new;
		yourself).
	self findLoginDialog hide.

]
