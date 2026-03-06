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
  <wa-tab-group id="wamTagGroup" active="p1">
    <wa-tab id="p1" panel="p1"></wa-tab>
    <wa-tab-panel name="p1"><slot name="p1"></slot></wa-tab-panel>
    <wa-tab id="p2" panel="p2"></wa-tab>
    <wa-tab-panel name="p2"><slot name="p2"></slot></wa-tab-panel>
    <wa-tab id="p3" panel="p3"></wa-tab>
    <wa-tab-panel name="p3"><slot name="p3"></slot></wa-tab-panel>
    <wa-tab id="p4" panel="p4"></wa-tab>
    <wa-tab-panel name="p4"><slot name="p4"></slot></wa-tab-panel>
    <wa-tab id="p5" panel="p5"></wa-tab>
    <wa-tab-panel name="p5"><slot name="p5"></slot></wa-tab-panel>
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

{ #category : 'rendering' }
WamBrandDialogView >> renderTab: key label: aString [

	(self shadowRoot elementWithId: key) textContent: aString.

]

{ #category : 'accessing - components' }
WamBrandDialogView >> settingsView [

	^ (self firstChildAtSlotNamed: #p1) firstChildAtSlotNamed: nil
]
