Class {
	#name : 'WamListItemCardView',
	#superclass : 'WamListItemView',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'rendering' }
WamListItemCardView >> renderListItemAsCard: aMap [
	| contentsElement card |


	(contentsElement := self contentElement: aMap) ifNil: [
		^ self removeChildrenAtSlotNamed: nil ].

	card := WaCard new "orientation: 'horizontal'; yourself".
	card replaceAllChildrenWith: contentsElement atSlotNamed: nil.

	(self leadingElement: aMap)
		ifNil: [ card removeChildrenAtSlotNamed: #media ]
		ifNotNil: [ :value | card replaceAllChildrenWith: value atSlotNamed: #media ].

	(self trailingElement: aMap)
		ifNil: [ card removeChildrenAtSlotNamed: #actions ]
		ifNotNil: [ :value | card replaceAllChildrenWith: value atSlotNamed: #actions ].

	self replaceAllChildrenWith: card atSlotNamed: nil.

]
