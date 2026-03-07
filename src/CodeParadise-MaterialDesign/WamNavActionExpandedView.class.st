Class {
	#name : 'WamNavActionExpandedView',
	#superclass : 'WamNavActionAbstractView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'as yet unclassified' }
WamNavActionExpandedView class >> template [

	<webResource: #html>

	^ '<slot></slot>'
]

{ #category : 'rendering' }
WamNavActionExpandedView >> renderNavExpanded: anItem [
	| element |

	element := self divExpanded: anItem.
	self replaceAllChildrenWith: element atSlotNamed: nil.

]
