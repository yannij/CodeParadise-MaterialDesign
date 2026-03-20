Class {
	#name : 'WamNavActionNarrowView',
	#superclass : 'WamNavActionAbstractView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
WamNavActionNarrowView >> renderNavNarrow: anItem [
	| element |

	element := self divNarrow: anItem.
	self replaceAllChildrenWith: element atSlotNamed: nil.

]
