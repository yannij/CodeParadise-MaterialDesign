Class {
	#name : 'SlmdWebApplication',
	#superclass : 'CpMvpWebApplication',
	#instVars : [
		'layout',
		'navItems',
		'actionItems',
		'editItems'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'initialization' }
SlmdWebApplication >> actionItemName: itemName actionGroup: groupTag iconName: iconName iconLabel: itemLabel [

	^ SlmdActionItem itemName: itemName groupTag: groupTag iconName: iconName iconLabel: itemLabel
]

{ #category : 'accessing' }
SlmdWebApplication >> actionItems [

	^ actionItems
]

{ #category : 'accessing' }
SlmdWebApplication >> actionItems: anObject [

	actionItems := anObject
]

{ #category : 'accessing' }
SlmdWebApplication >> applicationModel [

	"Answer the Model for the receiver, which is the receiver itself"

	^ self
]

{ #category : 'accessing' }
SlmdWebApplication >> editItemNamed: aKey [

	^ self editItems at: aKey
]

{ #category : 'accessing' }
SlmdWebApplication >> editItems [

	^ editItems
]

{ #category : 'accessing' }
SlmdWebApplication >> editItems: anObject [

	editItems := anObject
]

{ #category : 'initialization' }
SlmdWebApplication >> initialize [

	super initialize.

	self setUpEditItems.

	navItems := OrderedCollection new.
	actionItems := OrderedCollection new.
	self setUpNavItems.
	self setUpActionItems.

	layout := SlmdResponsiveLayoutModel new.

]

{ #category : 'accessing' }
SlmdWebApplication >> layout [

	^ layout
]

{ #category : 'accessing' }
SlmdWebApplication >> layout: anObject [

	layout := anObject
]

{ #category : 'initialization' }
SlmdWebApplication >> navItemName: itemName actionGroup: groupTag iconName: iconName iconLabel: itemLabel [

	^ SlmdNavItem itemName: itemName groupTag: groupTag iconName: iconName iconLabel: itemLabel
]

{ #category : 'initialization' }
SlmdWebApplication >> navItemName: itemName iconName: iconName iconLabel: itemLabel [

	^ SlmdNavItem itemName: itemName groupTag: #primary iconName: iconName iconLabel: itemLabel
]

{ #category : 'accessing' }
SlmdWebApplication >> navItems [

	^ navItems
]

{ #category : 'accessing' }
SlmdWebApplication >> navItems: anObject [

	navItems := anObject
]

{ #category : 'initialization' }
SlmdWebApplication >> setUpActionItems [
	"Subclasses may enhance"

]

{ #category : 'initialization' }
SlmdWebApplication >> setUpEditItems [

	editItems := IdentityDictionary new
		at: #read put: (SlmdActionItem itemName: 'read' groupTag: #toolbar iconName: 'file-ruled' iconLabel: 'View');
		at: #update put: (SlmdActionItem itemName: 'update' groupTag: #toolbar iconName: 'pencil' iconLabel: 'Edit');
		at: #delete put: (SlmdActionItem itemName: 'delete' groupTag: #toolbar iconName: 'trash' iconLabel: 'Delete');
		at: #save put: (SlmdActionItem itemName: 'save' groupTag: #toolbar iconName: 'check' iconLabel: 'Save');
		at: #cancel put: (SlmdActionItem itemName: 'cancel' groupTag: #toolbar iconName: 'x' iconLabel: 'Cancel');
		yourself.

]

{ #category : 'initialization' }
SlmdWebApplication >> setUpNavItems [
	"Subclasses may enhance"

]
