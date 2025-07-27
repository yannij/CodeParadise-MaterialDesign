Class {
	#name : 'SlmdLayoutSettingsPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'events' }
SlmdLayoutSettingsPresenter >> handleAction: anObject [

	self handleAspectSettings: anObject
]

{ #category : 'events' }
SlmdLayoutSettingsPresenter >> handleAspectSettings: anObject [
	| aspect aspectValue |

	self logTrace5: anObject printString method: 'handleViewAction:'.
	aspect := anObject parameterAt: #aspect.
	aspectValue := anObject parameterAt: #value.

	aspect = #layoutUpdate ifTrue: [
		self layoutUpdate: aspectValue.
		^ self ].

	self logTrace5: aspect asString, ' BEFORE: ', (self model perform: aspect) printString.
	self model perform: (aspect, ':') asSymbol with: aspectValue.
	self logTrace5: aspect asString, '  AFTER: ', (self model perform: aspect) printString.

]

{ #category : 'events' }
SlmdLayoutSettingsPresenter >> layoutUpdate: props [
	| m |

	self logTrace5: props printString method: 'layoutUpdate:'.

	m := self model.
	props keysAndValuesDo: [ :k :v | | setAccessor |
		setAccessor := (k, ':') asSymbol.
		self logTrace5: k asString, ' BEFORE: ', (m perform: k) printString.
		m perform: setAccessor with: v.
		self logTrace5: k asString, '  AFTER: ', (m perform: k) printString.
		].

]

{ #category : 'view' }
SlmdLayoutSettingsPresenter >> viewCreated [

	super viewCreated.

	self subscribeToActionRequest.

]

{ #category : 'view' }
SlmdLayoutSettingsPresenter >> viewInitialized [
	| props |

	super viewInitialized.

	props := self model asProperties.
	self view
		modalDivSetUp: props;
		layoutInitialSetUp: props.

]
