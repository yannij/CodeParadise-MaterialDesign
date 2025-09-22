Class {
	#name : 'SlmdToolbarView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'web resources' }
SlmdToolbarView class >> globalStyle [

	<webResource: #css>

	^ '
.smd-toolbar-item {
  padding: 8px 0;
  height: 48px;
  width: 48px;
}

.smd-toolbar-icon {
  font-size: 32px;
}
'
]

{ #category : 'nav' }
SlmdToolbarView >> buttonCssClass [

	^ 'smd-toolbar-buttons'
]

{ #category : 'nav' }
SlmdToolbarView >> fabCssClass [

	^ 'smd-toolbar-fab'
]

{ #category : 'nav' }
SlmdToolbarView >> renderButtons: buttons [
	| div iconButton |

	buttons ifNotEmpty: [
		div := '' inHtmlTag: #div.
		div addClass: self buttonCssClass.
		buttons withIndexDo: [ :eachItem :index |
			iconButton := self iconButtonForAction: eachItem css: 'smd-toolbar-item'.
			div appendChild: iconButton ].
		self appendChild: div atSlotNamed: 'toolbar' ].

]

{ #category : 'nav' }
SlmdToolbarView >> renderFab: fab [
	| div iconButton |

	div := '' inHtmlTag: #div.
	div addClass: self fabCssClass.
	iconButton := self iconButtonForAction: fab css: nil.
	div appendChild: iconButton.
	self appendChild: div atSlotNamed: 'fab'.

]
