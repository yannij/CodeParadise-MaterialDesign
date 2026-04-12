Class {
	#name : 'WamInformDialogView',
	#superclass : 'WamDialogContentView',
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'rendering' }
WamInformDialogView >> answerParameters: answer [

	^ { #yesOrNo -> answer } asDictionary

]
