Class {
	#name : 'WamDialogContentView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'class initialization' }
WamDialogContentView class >> beLoaded [

	WaDivider beLoaded.

]

{ #category : 'web resources' }
WamDialogContentView class >> template [

	<webResource: #html>

	^ '<slot></slot>
<wa-divider></wa-divider>
<slot name="buttons"></slot>
'
]

{ #category : 'rendering' }
WamDialogContentView >> answerParameters: answer [

	^ Dictionary new

]

{ #category : 'rendering' }
WamDialogContentView >> button: label answer: answer [

	^ (WaButton label: label)
		variantBeBrand;
		when: CpClickEvent basicPrimary do: [ self triggerAnswer: answer ] for: self;
		yourself
]

{ #category : 'rendering' }
WamDialogContentView >> renderButtons: buttons [
	| buttonsDiv |

	self removeChildrenAtSlotNamed: #buttons.
	buttonsDiv := #div asHtmlTag.
	buttonsDiv addClass: #'wa-stack'; addClass: #'wa-gap-s'.
	buttons do: [ :each |
		buttonsDiv appendChild: (self button: each key answer: each value) ].
	self appendChild: buttonsDiv atSlotNamed: #buttons.

]

{ #category : 'rendering' }
WamDialogContentView >> triggerAnswer: answer [

	self serverAnnounce: (WamNavActionEvent id: #dialogAnswer parameter: (self answerParameters: answer))

]
