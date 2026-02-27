Class {
	#name : 'WamNavActionNarrowView',
	#superclass : 'WamNavActionAbstractView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'as yet unclassified' }
WamNavActionNarrowView class >> template [

	<webResource: #html>

	^ '<slot></slot>'
]

{ #category : 'as yet unclassified' }
WamNavActionNarrowView >> renderNavNarrow: anItem [
	| element |

	element := self divNarrow: anItem.
	element when: CpClickEvent basicPrimary do: [ self triggerNavEvent: anItem ] for: self.
	self replaceAllChildrenWith: element atSlotNamed: nil.

]
