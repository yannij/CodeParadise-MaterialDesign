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
SlmdWebApplication >> actionItemName: itemName groupTag: groupTag iconName: iconName iconLabel: itemLabel [

	^ SlmdUserAction actionItemName: itemName groupTag: groupTag iconName: iconName iconLabel: itemLabel
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

	self setUpCommonUserActions.

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
SlmdWebApplication >> navItemName: itemName groupTag: groupTag iconName: iconName iconLabel: itemLabel [

	^ SlmdUserAction navItemName: itemName groupTag: groupTag iconName: iconName iconLabel: itemLabel
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
SlmdWebApplication >> setUpCommonUserActions [

	editItems := IdentityDictionary new
		at: #read put: (self actionItemName: 'read' groupTag: #toolbar iconName: 'file-ruled' iconLabel: 'View');
		at: #update put: (self actionItemName: 'update' groupTag: #toolbar iconName: 'pencil' iconLabel: 'Edit');
		at: #delete put: (self actionItemName: 'delete' groupTag: #toolbar iconName: 'trash' iconLabel: 'Delete');
		at: #save put: (self actionItemName: 'save' groupTag: #toolbar iconName: 'check' iconLabel: 'Save');
		at: #cancel put: (self actionItemName: 'cancel' groupTag: #toolbar iconName: 'x' iconLabel: 'Cancel');
		at: #modalNav put: (self actionItemName: 'modalNav' groupTag: #primary iconName: 'list' iconLabel: 'Menu');
		at: #back put: (self navItemName: 'back' groupTag: #primary iconName: 'arrow-left' iconLabel: 'Back');
		yourself.

]

{ #category : 'initialization' }
SlmdWebApplication >> setUpNavItems [
	"Subclasses may enhance"

]
