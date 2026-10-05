Extension { #name : 'WaFormControl' }

{ #category : '*CodeParadise-MaterialDesign' }
WaFormControl >> disabled: aBoolean [
	"See comment in #readonly:"

	self subclassResponsibility
]

{ #category : '*CodeParadise-MaterialDesign' }
WaFormControl >> label [

	^ nil
]

{ #category : '*CodeParadise-MaterialDesign' }
WaFormControl >> label: ignored [

	self subclassResponsibility
]

{ #category : '*CodeParadise-MaterialDesign' }
WaFormControl >> readonly: aBoolean [
	"Set form element to read only.
	
	Some elements define a readonly property, and some do not.
	Use the disabled property, when readonly is not defined by the element,
	so readonly: can be the generic method name.

	Note that an input field has different text colour contrast between
	disabled and readonly."

	self disabled: aBoolean
]
