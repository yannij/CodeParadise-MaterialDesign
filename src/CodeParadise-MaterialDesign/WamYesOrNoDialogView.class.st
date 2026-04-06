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
