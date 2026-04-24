Class {
	#name : 'WamWebClientBehavior',
	#superclass : 'CpMvpWebClientBehavior',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'operations' }
WamWebClientBehavior >> announceSessionParameters [
	"Gather session parameters from URL,
	and announce those values to server"

	| location searchParams code state data |

	location := CpBrowserDocument current location.
	searchParams := CpBrowserURLSearchParams newInstanceWithArguments: { location search }.

	code := (searchParams hasKey: #code) ifTrue: [ searchParams getKey: #code ] ifFalse: [].
	code ifNil: [ ^ self ].
	state := (searchParams hasKey: #state) ifTrue: [ searchParams getKey: #state ] ifFalse: [].
	state ifNil: [ ^ self ].

	data := { #code-> code . #state -> state } asDictionary.
	self clientEnvironment serverAnnounce: (WamSessionEvent id: #redirectUrl parameters: data).

	"Update browser URL to not have the code and state paramters"
	location := CpBrowserURL newUrl: location hrefWithoutSearch.
	searchParams deleteKey: #code; deleteKey: #state.
	location search: searchParams toString.
	CpBrowserHistory current replaceState: nil url: location href.

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

{ #category : 'actions' }
WamWebClientBehavior >> finishSetUp: props [

	self announceSessionParameters.
	self layoutViewElement layoutInitialSetUp: props.

]

{ #category : 'accessing' }
WamWebClientBehavior >> layoutViewElement [

	^ CpHtmlElement documentBody firstDescendantMatching: WamResponsiveLayoutView asCssSelector
]
