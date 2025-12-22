Class {
	#name : 'SlmdToolbarView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'web resources' }
SlmdToolbarView class >> globalStyle [

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
	| iconButton |

	iconButton := self iconButtonForAction: fab css: self fabCssClass.
	self appendChild: iconButton atSlotNamed: 'fab'.

]
