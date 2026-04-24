Class {
	#name : 'WamDialogView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'web resources' }
WamDialogView class >> template [

	<webResource: #html>

	^ '<wa-dialog id="sharedDialog" light-dismiss>
	<slot name="content"></slot>
</wa-dialog>'
]

{ #category : 'rendering' }
WamDialogView >> dialogComponent [

	^ self shadowRoot elementWithId: #sharedDialog
]

{ #category : 'rendering' }
WamDialogView >> renderLabel: aString [

	self dialogComponent label: aString.

]

{ #category : 'rendering' }
WamDialogView >> sharedDialogClose [

	self dialogComponent openBeOff

]

{ #category : 'rendering' }
WamDialogView >> sharedDialogOpen [

	self dialogComponent openBeOn

]
