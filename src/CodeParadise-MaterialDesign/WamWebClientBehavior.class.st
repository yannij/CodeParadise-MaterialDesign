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
WamWebClientBehavior >> appViewElement [
	"Answer the webcomponent of the app"

	"During loading, the first child is a loading div,
	which is later removed. So search for the component."
	^ CpHtmlElement documentBody children detect: [ :each | each isWebComponent ] ifNone: []
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

	^ self appViewElement firstChildAtSlotNamed: #layout
]

{ #category : 'actions' }
WamWebClientBehavior >> sharedDialogOpen [

	self layoutViewElement sharedDialogOpen
]
