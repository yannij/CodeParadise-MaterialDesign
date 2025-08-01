Class {
	#name : 'SlmdAppBarView',
	#superclass : 'SlmdToolbarView',
	#instVars : [
		'primary'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'web resources' }
SlmdAppBarView class >> style [

	<webResource: #css>

	^ '
.smd-appBar {
  display: flex;
  flex-flow: row nowrap;
  height: 64px;
  padding: 0 4px;
  background: var(--sl-color-primary-200);
}

.smd-appBar-leadingAction {
  padding: 8px 0;
  height: 48px;
  width: 48px;
}

.smd-appBar-headline {
  overflow: clip;
  white-space: nowrap;
  max-width: 66%;
  padding-left: 8px;
  height: 48px;
  line-height: 64px;
  font-size: 24px;
}

.smd-appBar-trailingActions {
  margin-left: auto;
  display: flex;
  flex-flow: row nowrap;
  gap: 4px;
  height: 48px;
}
'
]

{ #category : 'web resources' }
SlmdAppBarView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div class="smd-appBar">
    <div class="smd-appBar-leadingAction">
      <slot name="leadingAction"></slot>
    </div>
    <div class="smd-appBar-headline">
      <slot name="headline"></slot>
    </div>
    <div class="smd-appBar-trailingActions">
      <slot name="trailingActions"></slot>
    </div>
  </div>
</div>
'
]

{ #category : 'rendering' }
SlmdAppBarView >> appBarDisplay: aBoolean [

	"self element: self show: aBoolean"
	
	aBoolean
		ifTrue: [ self removeStyleAt: 'display' ]
		ifFalse: [ self styleAt: 'display' put: 'none' ]
]

{ #category : 'rendering' }
SlmdAppBarView >> appBarLeadingButtonDisplay: aBoolean [
	| element |

	element := self appBarMenuFind.
	element ifNil: [ self logError: '**** appBarMenuFind answered nil' ].
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]

{ #category : 'rendering' }
SlmdAppBarView >> appBarMenuFind [

	^ self shadowedFirstDescendantMatching: '.smd-appBar-leadingAction'
]

{ #category : 'accessing' }
SlmdAppBarView >> bePrimary [

	self primary: true
]

{ #category : 'accessing' }
SlmdAppBarView >> beSecondary [

	self primary: false
]

{ #category : 'initialization' }
SlmdAppBarView >> initialize [

	super initialize.

	primary := true.

]

{ #category : 'testing' }
SlmdAppBarView >> isPrimary [

	^ self primary = true
]

{ #category : 'testing' }
SlmdAppBarView >> isSecondary [

	^ self isPrimary not
]

{ #category : 'accessing' }
SlmdAppBarView >> primary [

	^ primary
]

{ #category : 'accessing' }
SlmdAppBarView >> primary: anObject [

	primary := anObject
]

{ #category : 'rendering' }
SlmdAppBarView >> renderHeadline: aString [

	self
		replaceAllChildrenWith: (aString inHtmlTag: #span)
		atSlotNamed: 'headline'.

]

{ #category : 'rendering' }
SlmdAppBarView >> renderLeadingAction: leadingAction [
	| actionItem |

	actionItem := self iconButtonForAction: leadingAction css: nil.

	self removeChildrenAtSlotNamed: 'leadingAction'.
	self appendChild: actionItem atSlotNamed: 'leadingAction'.

]

{ #category : 'rendering' }
SlmdAppBarView >> renderTrailingActions: buttons [
	| overflowThreshold actionItem actionList overflowList |

	self removeChildrenAtSlotNamed: 'trailingActions'.
	overflowThreshold := 2.

	buttons size <= overflowThreshold ifTrue: [
		buttons do: [ :each |
			actionItem := self iconButtonForAction: each css: 'smd-toolbar-item'.
			self appendChild: actionItem atSlotNamed: 'trailingActions' ].
		^ self ].

	actionList := buttons copyFrom: 1 to: overflowThreshold - 1.
	actionList do: [ :each |
		actionItem := self iconButtonForAction: each css: 'smd-toolbar-item'.
		self appendChild: actionItem atSlotNamed: 'trailingActions' ].

	overflowList := buttons copyFrom: overflowThreshold to: buttons size.
	self appendChild: (self dropdownMenu: overflowList css: 'smd-toolbar-item') atSlotNamed: 'trailingActions'.

]
