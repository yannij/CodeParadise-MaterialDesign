Class {
	#name : 'SlmdNavActionExpandedView',
	#superclass : 'SlmdNavAbstractView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'web resources' }
SlmdNavActionExpandedView class >> template [

	<webResource: #html>

	^ '<slot name="content"></slot>'
]

{ #category : 'rendering' }
SlmdNavActionExpandedView >> renderNavExpanded: anItem [
	| element |

	element := self divExpanded: anItem.
	element when: CpClickEvent basicPrimary do: [ self triggerNavEvent: anItem ] for: self.
	self replaceAllChildrenWith: element atSlotNamed: #content.

]

{ #category : 'rendering' }
SlmdNavActionExpandedView >> renderNavNarrow: anItem [
	| element |

	element := self divNarrow: anItem.
	element when: CpClickEvent basicPrimary do: [ self triggerNavEvent: anItem ] for: self.
	self replaceAllChildrenWith: element atSlotNamed: #content.

]
