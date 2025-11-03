Class {
	#name : 'SlmdNavActionView',
	#superclass : 'SlmdNavAbstractView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'web resources' }
SlmdNavActionView class >> template [

	<webResource: #html>

	^ '<slot name="content"></slot>'
]

{ #category : 'rendering' }
SlmdNavActionView >> renderNavExpanded: anItem [
	| element |

	element := self divExpanded: anItem.
	element when: CpClickEvent basicPrimary do: [ self handleNavAction: anItem ] for: self.
	self replaceAllChildrenWith: element atSlotNamed: #content.

]

{ #category : 'rendering' }
SlmdNavActionView >> renderNavNarrow: anItem [
	| element |

	element := self divNarrow: anItem.
	element when: CpClickEvent basicPrimary do: [ self handleNavAction: anItem ] for: self.
	self replaceAllChildrenWith: element atSlotNamed: #content.

]
