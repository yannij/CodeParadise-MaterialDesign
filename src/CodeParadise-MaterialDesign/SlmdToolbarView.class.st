Class {
	#name : 'SlmdToolbarView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
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

	self removeChildrenAtSlotNamed: 'toolbar'.

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

	self removeChildrenAtSlotNamed: 'fab'.
	div := '' inHtmlTag: #div.
	div addClass: self fabCssClass.
	iconButton := self iconButtonForAction: fab css: nil.
	div appendChild: iconButton.
	self appendChild: div atSlotNamed: 'fab'.

]
