Class {
	#name : 'WamToolbarView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'web resources' }
WamToolbarView class >> globalStyle [

	<webResource: #css>

	^ '
.smd-toolbar-item {
  display: flex;
  padding: 8px 0;
  height: 48px;
  width: 48px;
  align-items: center;
  justify-content: center;
}

.smd-toolbar-floating-item {
  display: flex;
  padding: 8px 0;
  height: 48px;
  width: 48px;
  align-items: center;
  justify-content: center;
}

.smd-toolbar-icon {
  font-size: 24px;
}
'
]

{ #category : 'nav' }
WamToolbarView >> buttonCssClass [

	^ 'smd-toolbar-buttons'
]

{ #category : 'nav' }
WamToolbarView >> fabCssClass [

	^ 'smd-toolbar-fab'
]

{ #category : 'nav' }
WamToolbarView >> renderButtons: buttons [
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
WamToolbarView >> renderFab: fab [
	| iconButton |

	iconButton := self iconButtonForAction: fab css: self fabCssClass.
	self appendChild: iconButton atSlotNamed: 'fab'.

]
