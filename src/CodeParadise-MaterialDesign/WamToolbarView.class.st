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
.wam-toolbar-item {
  display: flex;
  padding: 8px 0;
  height: 48px;
  width: 48px;
  align-items: center;
  justify-content: center;
}

.wam-toolbar-floating-item {
  display: flex;
  padding: 8px 0;
  height: 48px;
  width: 48px;
  align-items: center;
  justify-content: center;
}

.wam-toolbar-icon {
  font-size: 24px;
}
'
]

{ #category : 'nav' }
WamToolbarView >> buttonCssClass [

	^ 'wam-toolbar-buttons'
]

{ #category : 'nav' }
WamToolbarView >> fabCssClass [

	^ 'wam-toolbar-fab'
]

{ #category : 'nav' }
WamToolbarView >> renderButtons: buttons [
	| div |

	buttons ifNotEmpty: [
		div := '' inHtmlTag: #div.
		div addClass: self buttonCssClass.
		buttons withIndexDo: [ :eachItem :index | | actionItem |
			actionItem := self icon: (eachItem at: #iconName) eventDictionary: eachItem.
			actionItem firstChild addClass: 'wam-toolbar-icon'.
			actionItem addClass: 'wam-toolbar-item'.
			div appendChild: actionItem ].
		self appendChild: div atSlotNamed: #toolbar ].

]

{ #category : 'nav' }
WamToolbarView >> renderFab: fab [
	| actionItem |

	actionItem := self icon: (fab at: #iconName) eventDictionary: fab.
	actionItem firstChild addClass: 'wam-toolbar-icon'.
	actionItem addClass: self fabCssClass.
	self appendChild: actionItem atSlotNamed: #fab.

]
