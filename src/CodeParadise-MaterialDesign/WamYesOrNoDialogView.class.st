Class {
	#name : 'WamYesOrNoDialogView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'class initialization' }
WamYesOrNoDialogView class >> beLoaded [

	WaDivider beLoaded.

]

{ #category : 'web resources' }
WamYesOrNoDialogView class >> template [

	<webResource: #html>

	^ '<slot></slot>
<wa-divider></wa-divider>
<slot name="buttons"></slot>
'
]

{ #category : 'rendering' }
WamYesOrNoDialogView >> button: label answer: answer [

	^ (WaButton label: label)
		variantBeBrand;
		when: CpClickEvent basicPrimary do: [ self triggerAnswer: answer ] for: self;
		yourself
]

{ #category : 'rendering' }
WamYesOrNoDialogView >> renderConfirm: aString buttons: buttons [
	| buttonsDiv |

	self removeChildrenAtSlotNamed: nil.
	self appendChild: (#div asHtmlTag textContent: aString) atSlotNamed: nil.

	self removeChildrenAtSlotNamed: #buttons.
	buttonsDiv := #div asHtmlTag.
	buttonsDiv addClass: #'wa-stack'; addClass: #'wa-gap-s'.
	buttons do: [ :each |
		buttonsDiv appendChild: (self button: each key answer: each value) ].
	self appendChild: buttonsDiv atSlotNamed: #buttons.

]

{ #category : 'rendering' }
WamYesOrNoDialogView >> triggerAnswer: aBoolean [

	self serverAnnounce: (WamNavActionEvent id: #dialogAnswer parameter: { aBoolean })

]
