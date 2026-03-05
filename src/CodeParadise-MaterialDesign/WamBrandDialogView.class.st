Class {
	#name : 'WamBrandDialogView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Preferences',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Preferences'
}

{ #category : 'class initialization' }
WamBrandDialogView class >> beLoaded [

	WaDialog beLoaded.
	WaTab beLoaded.
	WaTabPanel beLoaded.
	WaTabGroup beLoaded.

]

{ #category : 'web resources' }
WamBrandDialogView class >> template [

	<webResource: #html>

	^ '<wa-dialog id="brandDialog" light-dismiss>
  <wa-tab-group active="settings">
    <wa-tab panel="settings">Settings</wa-tab>
    <wa-tab-panel name="settings">
      <slot name="layoutSettings"></slot>
    </wa-tab-panel>
    <wa-tab panel="custom">Custom</wa-tab>
    <wa-tab-panel name="custom">
      <slot name="custom"></slot>
    </wa-tab-panel>
  </wa-tab-group>
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

{ #category : 'rendering' }
WamBrandDialogView >> renderOpen: aBoolean [

	self dialogComponent open: aBoolean

]
