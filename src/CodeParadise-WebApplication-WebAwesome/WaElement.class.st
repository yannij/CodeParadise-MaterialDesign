"
I am the base class for Shoelace components.
See https://shoelace.style

Shoelace components do not load automagically (i.e. the
auto-loader feature is not in use).
A so called 'auto-loader' function exists in Shoelace. This
does however not work for components used inside a Shadow DOM.
The auto-loader works by setting a MutationObserver on the
Light DOM (document root). This feature therefore also has
some impact on performance. Leaving the auto-loader out
does mean we have to specify which components are used. Use
the #beLoaded method to reference any components you might
use in an HTML string or WebComponent template. See example
below.

Shoelace components can be used programmatically:
	myComponent appendChild: (SlIcon named: 'heart')

Or be used as HTML string or within a WebComponent template:
	<sl-icon name=""heart"">

IF used from HTML string or template, please make sure the
component is loaded by adding a call to #beLoaded to the
component in the code being used. If for example you create
a WebComponent XyzView which has an icon in the template
(i.e. in the Shadow DOM) add the following method to your
WebComponent:
postInstallOnce

	""Make sure SlIcon component is loaded""

	SlIcon beLoaded

"
Class {
	#name : 'WaElement',
	#superclass : 'CpWebComponent',
	#category : 'CodeParadise-WebApplication-WebAwesome-Abstract',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Abstract'
}

{ #category : 'accessing' }
WaElement class >> componentLoaderName [

	^ self name asKebabCase, '.js'
]

{ #category : 'accessing' }
WaElement class >> componentName [

	^ self nameWithoutPrefix asKebabCase
]

{ #category : 'instance creation' }
WaElement class >> fullyNamed: aString [
	"Answer a new icon instance using the given full name string.

	The full name should take the form: <library>:<name>
	If no colon ($:) is specified, only the name is assumed."

	| separatorIndex |

	self name = #WaIcon ifFalse: [
		self error: '#fullyNamed: should only be used for WaIcon' ].

	separatorIndex := aString indexOf: $:.
	^ separatorIndex = 0
		ifTrue: [
			self new
				name: aString;
				yourself ]
		ifFalse: [
			self new
				library: (aString first: separatorIndex - 1) ;
				name: (aString allButFirst: separatorIndex)
				yourself ]

]

{ #category : 'accessing' }
WaElement class >> importBasePath [

	^ 'https://cdn.jsdelivr.net/npm/@awesome.me/webawesome@3.5.0/dist-cdn/'
]

{ #category : 'accessing' }
WaElement class >> importComponentCode [

	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'import "' ;
			nextPutAll: self importComponentPath ;
			nextPutAll: '";' ;
			nextPutAll: 'let script = document.getElementById("' ;
			nextPutAll: self componentLoaderName ;
			nextPutAll: '");' ;
			nextPutAll: 'if(script) script.remove();' ]
]

{ #category : 'accessing' }
WaElement class >> importComponentPath [

	"Answer the component path for the receiver"

	| componentName |

	componentName := self componentName.

	^ String streamContents: [ :stream|
		stream
			nextPutAll: self importBasePath ;
			nextPutAll: 'components/' ;
			nextPutAll: componentName ;
			nextPut: $/ ;
			nextPutAll: componentName ;
			nextPutAll: '.js' ]
]

{ #category : 'accessing' }
WaElement class >> importPalettePath [

	^ self importBasePath, 'styles/color/palettes/default.css'
]

{ #category : 'accessing' }
WaElement class >> importThemesPath [

	"Answer the themes path for the framework"

	^ self importBasePath, 'styles/webawesome.css'
]

{ #category : 'tags' }
WaElement class >> isAbstractTag [

	"The method is present to indicate the receiver is abstract.
	This method will NOT be evaluated to decide if the receiver is abstract."
]

{ #category : 'testing' }
WaElement class >> isThirdPartyElement [

	"Answer the fact that the receiver is a third party WebComponent"

	^ true
]

{ #category : 'accessing' }
WaElement class >> linkUtilitiesCss [

	^ '<link rel="stylesheet" href="', self importBasePath, 'styles/utilities.css"></link>'
]

{ #category : 'class initialization' }
WaElement class >> loadComponent [

	"Load component from CDN"

	CpHtmlElement
		documentAddScript: self importComponentCode
		type: 'module'
		id: self componentLoaderName
]

{ #category : 'class initialization' }
WaElement class >> loadLibrary [

	CpHtmlElement documentAddStylesheet: self importThemesPath.

	(CpHtmlElement documentAddModuleScript: '// Do not remove this script tag, Web Awesome uses the data attribute')
		attributeAt: 'data-webawesome' put: self importBasePath.
]

{ #category : 'class initialization' }
WaElement class >> postInstall [

	"Install Shoelace component into receiver"

	super postInstall.

	self hasAbstractTag
		ifTrue: [ ^ self ].

	self loadComponent
]

{ #category : 'class initialization' }
WaElement class >> postInstallOnce [

	"Install Shoelace library into receiver"

	self loadLibrary
]

{ #category : 'class initialization' }
WaElement class >> registerBootstrapIcons [

	"Register Bootstrap as icon library to load icons from CDN"

	CpHtmlElement documentAddModuleScript: self registerBootstrapIconsCode
]

{ #category : 'class initialization' }
WaElement class >> registerBootstrapIconsCode [

	^ String streamContents: [ :stream |

		stream
			nextPutAll: 'import { registerIconLibrary } from "' ;
			nextPutAll: self importBasePath ;
			nextPutAll: 'webawesome.js";' ;

			nextPutAll: 'registerIconLibrary("bootstrap", {' ;
			nextPutAll: '  resolver: function(name, family) {' ;
			nextPutAll: '    const suffix = family === "filled" ? "-fill" : "";' ;
			nextPutAll: '    return `https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/icons/${name}${suffix}.svg`;' ;
			nextPutAll: '  },' ;
			nextPutAll: '});' ]

]

{ #category : 'support' }
WaElement >> changeEventClass [

	^ WaChangeEvent
]

{ #category : 'text input' }
WaElement >> focus: optionsArray [

	"Sets focus on the receiver with options.

	Only options available (at the moment):
		{ #preventScroll -> true }."

	self apply: #focus withArguments: optionsArray asDictionary
]

{ #category : 'support' }
WaElement >> inputEventClass [

	^ WaInputEvent
]

{ #category : 'performing' }
WaElement >> performMessage: aMessage [

	"Perform the specified message on the receiver"

	aMessage sendTo: self
]
