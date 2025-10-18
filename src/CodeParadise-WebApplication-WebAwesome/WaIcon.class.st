Class {
	#name : 'WaIcon',
	#superclass : 'WaElement',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing' }
WaIcon class >> fullyNamed: aString [

	^ self new
		fullName: aString ;
		yourself
]

{ #category : 'accessing' }
WaIcon class >> named: aString [

	^ self new
		name: aString ;
		yourself
]

{ #category : 'class initialization' }
WaIcon class >> registerBootstrapIcons [

	"Register Bootstrap as icon library to load icons from CDN"

	CpHtmlElement documentAddModuleScript: self registerBootstrapIconsCode
]

{ #category : 'class initialization' }
WaIcon class >> registerBootstrapIconsCode [

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

{ #category : 'copying' }
WaIcon >> clone [

	"Deep clone the receiver.

	Implementation:
	Set the (non reflecting properties explicitly)."

	^ super clone
		name: self name ;
		library: self library ;
		yourself

]

{ #category : 'accessing' }
WaIcon >> fullName: aString [

	"Set the name and optionally the library for the receiver specified on the given full name.
	The full name should take the form: <library>:<name>
	If no colon ($:) is specified, only the name is assumed."

	| separatorIndex |

	separatorIndex := aString indexOf: $:.
	separatorIndex = 0
		ifTrue: [ self name: aString ]
		ifFalse: [
			self
				library: (aString first: separatorIndex - 1) ;
				name: (aString allButFirst: separatorIndex) ]
]

{ #category : 'accessing' }
WaIcon >> library [

	^ self propertyAt: #library
]

{ #category : 'accessing' }
WaIcon >> library: aString [

	self propertyAt: #library put: aString
]

{ #category : 'accessing' }
WaIcon >> name [

	^ self propertyAt: #name
]

{ #category : 'accessing' }
WaIcon >> name: aString [

	self propertyAt: #name put: aString
]

{ #category : 'accessing' }
WaIcon >> src [

	^ self propertyAt: #src
]

{ #category : 'accessing' }
WaIcon >> src: aString [

	self propertyAt: #src put: aString
]
