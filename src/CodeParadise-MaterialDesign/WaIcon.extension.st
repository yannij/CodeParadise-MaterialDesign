Extension { #name : 'WaIcon' }

{ #category : '*CodeParadise-MaterialDesign' }
WaIcon class >> fullyNamed: aString [
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

{ #category : '*CodeParadise-MaterialDesign' }
WaIcon class >> name: object1 label: object2 [

	^ self new 
		name: object1;
		label: object2;
		yourself
]

{ #category : '*CodeParadise-MaterialDesign' }
WaIcon class >> name: object1 label: object2 library: object3 [

	^ self new 
		name: object1;
		label: object2;
		library: object3;
		yourself
]
