Class {
	#name : 'WamAppBarView',
	#superclass : 'WamToolbarView',
	#instVars : [
		'primary'
	],
	#category : 'CodeParadise-MaterialDesign-Toolbar',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Toolbar'
}

{ #category : 'web resources' }
WamAppBarView class >> style [

	<webResource: #css>

	^ '
.wam-appBar {
  display: flex;
  flex-flow: row nowrap;
  height: 64px;
  padding: 0 4px;
  background: var(--wa-color-brand-fill-normal);
}

.wam-appBar-leadingAction {
  height: 48px;
  width: 48px;
}

.wam-appBar-headline {
  overflow: clip;
  white-space: nowrap;
  padding-left: 8px;
  height: 48px;
  line-height: 64px;
  font-size: 24px;
}

.wam-one-pane .headline-width {
  max-width: 66%;
}

.wam-two-pane .headline-width {
  max-width: calc(50vw - 180px);
}

.wam-appBar-trailingActions {
  margin-left: auto;
  display: flex;
  flex-flow: row nowrap;
  gap: 4px;
  height: 48px;
}
'
]

{ #category : 'web resources' }
WamAppBarView class >> template [

	<webResource: #html>

	^ '
<div class="wam-appBar">
  <div class="wam-appBar-leadingAction">
    <slot name="leadingAction"></slot>
  </div>
  <div class="wam-appBar-headline headline-width">
    <slot name="headline"></slot>
  </div>
  <div class="wam-appBar-trailingActions">
    <slot name="trailingActions"></slot>
  </div>
</div>
'
]

{ #category : 'rendering' }
WamAppBarView >> appBarDisplay: aBoolean [

	"self element: self show: aBoolean"
	
	aBoolean
		ifTrue: [ self removeStyleAt: 'display' ]
		ifFalse: [ self styleAt: 'display' put: 'none' ]
]

{ #category : 'rendering' }
WamAppBarView >> appBarFind [

	^ self shadowedFirstDescendantMatching: '.wam-appBar'
]

{ #category : 'rendering' }
WamAppBarView >> appBarLeadingButtonDisplay: aBoolean [
	| element |

	element := self appBarMenuFind.
	element ifNil: [ self systemLog logError: '**** appBarMenuFind answered nil' ].
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]

{ #category : 'rendering' }
WamAppBarView >> appBarMenuFind [

	^ self shadowedFirstDescendantMatching: '.wam-appBar-leadingAction'
]

{ #category : 'rendering' }
WamAppBarView >> appBarSetWidth [

	self layoutViewLazy ifNotNil: [ :value |
		value useTwoPaneBody
			ifTrue: [ self appBarFind removeClass: 'wam-one-pane'; addClass: 'wam-two-pane' ]
			ifFalse: [ self appBarFind removeClass: 'wam-two-pane'; addClass: 'wam-one-pane' ] ]

]

{ #category : 'accessing' }
WamAppBarView >> bePrimary [

	self primary: true
]

{ #category : 'accessing' }
WamAppBarView >> beSecondary [

	self primary: false
]

{ #category : 'initialization' }
WamAppBarView >> initialize [

	super initialize.

	primary := true.

]

{ #category : 'rendering' }
WamAppBarView >> isDisplayed [
	
	^ (self styleAt: 'display')
		ifNil: [ true ]
		ifNotNil: [ :value | value ~= 'none' ]
]

{ #category : 'testing' }
WamAppBarView >> isPrimary [

	^ self primary = true
]

{ #category : 'testing' }
WamAppBarView >> isSecondary [

	^ self isPrimary not
]

{ #category : 'accessing' }
WamAppBarView >> primary [

	^ primary
]

{ #category : 'accessing' }
WamAppBarView >> primary: anObject [

	primary := anObject
]

{ #category : 'rendering' }
WamAppBarView >> renderHeadline: aString [

	self
		replaceAllChildrenWith: (aString ifNil: [ '' ] ifNotNil: [ :value | value ]) asHtmlElement
		atSlotNamed: 'headline'.

]

{ #category : 'rendering' }
WamAppBarView >> renderLeadingAction: leadingAction [
	| actionItem |

	self removeChildrenAtSlotNamed: 'leadingAction'.
	leadingAction ifNil: [ ^ self ].

	actionItem := self iconButtonForAction: leadingAction css: 'wam-toolbar-item'.
	self appendChild: actionItem atSlotNamed: 'leadingAction'.

]

{ #category : 'rendering' }
WamAppBarView >> renderTrailingActions: buttons [
	| overflowThreshold actionItem actionList overflowList |

	self removeChildrenAtSlotNamed: 'trailingActions'.
	overflowThreshold := 2.

	buttons size <= overflowThreshold ifTrue: [
		buttons do: [ :each |
			actionItem := self iconButtonForAction: each css: 'wam-toolbar-item'.
			self appendChild: actionItem atSlotNamed: 'trailingActions' ].
		^ self ].

	actionList := buttons copyFrom: 1 to: overflowThreshold - 1.
	actionList do: [ :each |
		actionItem := self iconButtonForAction: each css: 'wam-toolbar-item'.
		self appendChild: actionItem atSlotNamed: 'trailingActions' ].

	overflowList := buttons copyFrom: overflowThreshold to: buttons size.
	self appendChild: (self dropdownAppbar: overflowList) atSlotNamed: 'trailingActions'.

]

{ #category : 'actions' }
WamAppBarView >> triggerNavEvent: aNavAction [
	| eventId data event |

	eventId := aNavAction at: #eventId.
	data := aNavAction at: #data.
	event := WamNavActionEvent id: eventId parameter: data.

	eventId = #modalNav ifTrue: [
		^ self layoutViewLazy modalNavOpen ].

	eventId = 'save' ifTrue: [ | changes paneContentView |
		paneContentView := self layoutViewLazy pane2View paneContentView.
		paneContentView ifNil: [ ^ self ].
		changes := paneContentView "wrappedView" changeMap.
		event parameters at: #changes put: changes ].

	self serverAnnounce: event
]
