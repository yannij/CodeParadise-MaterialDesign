Class {
	#name : 'WamLoginView',
	#superclass : 'WamDialogContentView',
	#instVars : [
		'loginUsername',
		'loginPassword'
	],
	#category : 'CodeParadise-MaterialDesign-Dialog',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Dialog'
}

{ #category : 'rendering' }
WamLoginView >> answerParameters: answer [

	^ {
		#yesOrNo -> answer.
		#loginUsername -> loginUsername value.
		#loginPassword -> loginPassword value.
	} asDictionary

]

{ #category : 'rendering' }
WamLoginView >> fieldAt: key label: aLabel input: aText [

	^ WaInput new
		name: key;
		addClass: 'wam-input';
		labelText: aLabel;
		value: aText;
		"hint: 'Help text...', aLabel;"
		disabled: false;
		attributeAdd: #filled;
		yourself.

]

{ #category : 'rendering' }
WamLoginView >> mainContent [
	| fields |

	fields := 'div' asHtmlTag
		addClass: 'wam-fields';
		appendChild: (loginUsername := self fieldAt: #loginUsername label: 'Username' input: '');
		appendChild: (loginPassword := self fieldAt: #loginPassword label: 'Password' input: '');
		yourself.

	^ fields

]

{ #category : 'rendering' }
WamLoginView >> renderMainContent [

	self removeChildrenAtSlotNamed: nil.
	self appendChild: self mainContent atSlotNamed: nil.

]
