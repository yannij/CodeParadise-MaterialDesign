Class {
	#name : 'SlmdDialogView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
SlmdDialogView class >> template [

	<webResource: #html>

	^ '<wa-dialog id="sharedDialog" light-dismiss>
	<slot name="content"></slot>
</wa-dialog>'
]

{ #category : 'rendering' }
SlmdDialogView >> closeDialog [

	self dialogComponent openBeOff

]

{ #category : 'rendering' }
SlmdDialogView >> dialogComponent [

	^ self shadowRoot elementWithId: #sharedDialog
]

{ #category : 'rendering' }
SlmdDialogView >> openDialog [

	self dialogComponent openBeOn

]

{ #category : 'rendering' }
SlmdDialogView >> renderLabel: aString [

	self dialogComponent label: aString.

]
