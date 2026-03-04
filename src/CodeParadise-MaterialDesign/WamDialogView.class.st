Class {
	#name : 'WamDialogView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
WamDialogView class >> template [

	<webResource: #html>

	^ '<wa-dialog id="sharedDialog" light-dismiss>
	<slot name="content"></slot>
</wa-dialog>'
]

{ #category : 'rendering' }
WamDialogView >> closeDialog [

	self dialogComponent openBeOff

]

{ #category : 'rendering' }
WamDialogView >> dialogComponent [

	^ self shadowRoot elementWithId: #sharedDialog
]

{ #category : 'rendering' }
WamDialogView >> openDialog [

	self dialogComponent openBeOn

]

{ #category : 'rendering' }
WamDialogView >> renderLabel: aString [

	self dialogComponent label: aString.

]

{ #category : 'rendering' }
WamDialogView >> renderOpen: aBoolean [

	self dialogComponent open: aBoolean

]
