Class {
	#name : 'WamYesOrNoDialogView',
	#superclass : 'WamDialogContentView',
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'rendering' }
WamYesOrNoDialogView >> answerParameters: answer [

	^ { #yesOrNo -> answer } asDictionary

]

{ #category : 'rendering' }
WamYesOrNoDialogView >> renderMainContent: aString [

	self removeChildrenAtSlotNamed: nil.
	self appendChild: (#div asHtmlTag textContent: aString) atSlotNamed: nil.

]
