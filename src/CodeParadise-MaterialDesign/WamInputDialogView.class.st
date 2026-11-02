Class {
	#name : 'WamInputDialogView',
	#superclass : 'WamDialogContentView',
	#instVars : [
		'input'
	],
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'rendering' }
WamInputDialogView >> answerParameters: answer [

	^ {
		#yesOrNo -> answer.
		#input -> input value.
	} asDictionary

]

{ #category : 'rendering' }
WamInputDialogView >> fieldAt: key label: aLabel input: aText [

	^ WaInput new
		name: key;
		addClass: 'wam-input';
		label: aLabel;
		value: aText;
		"hint: 'Help text...', aLabel;"
		disabled: false;
		attributeAdd: #filled;
		yourself.

]

{ #category : 'rendering' }
WamInputDialogView >> mainContent [
	| fields |

	fields := 'div' asHtmlTag
		addClass: 'wam-fields';
		appendChild: (input := self fieldAt: #input label: 'Input' input: '');
		yourself.

	^ fields

]

{ #category : 'rendering' }
WamInputDialogView >> renderMainContent [

	self removeChildrenAtSlotNamed: nil.
	self appendChild: self mainContent atSlotNamed: nil.

]
