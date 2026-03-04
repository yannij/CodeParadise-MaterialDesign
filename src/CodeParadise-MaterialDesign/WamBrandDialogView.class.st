Class {
	#name : 'WamBrandDialogView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Preferences',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Preferences'
}

{ #category : 'web resources' }
WamBrandDialogView class >> template [

	<webResource: #html>

	^ '<wa-dialog id="brandDialog" light-dismiss>
	<slot></slot>
</wa-dialog>'
]

{ #category : 'rendering' }
WamBrandDialogView >> closeDialog [

	self dialogComponent openBeOff

]

{ #category : 'rendering' }
WamBrandDialogView >> dialogComponent [

	^ self shadowRoot elementWithId: #brandDialog
]

{ #category : 'rendering' }
WamBrandDialogView >> openDialog [

	self dialogComponent openBeOn

]

{ #category : 'rendering' }
WamBrandDialogView >> renderLabel: aString [

	self dialogComponent label: aString.

]
