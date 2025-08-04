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

{ #category : 'accessing' }
SlmdWebApplication >> actionItems [

	^ actionItems
]

{ #category : 'accessing' }
SlmdWebApplication >> actionItems: anObject [

	actionItems := anObject
]

{ #category : 'initialization' }
SlmdWebApplication >> addActionSubtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel [

	self actionItems add: (SlmdUserEventSpec type: #action subtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel)
]

{ #category : 'initialization' }
SlmdWebApplication >> addNavSubtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel navTo: navTo [

	self navItems add: (SlmdUserEventSpec type: #nav subtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel data: navTo)
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
		at: #read put: (SlmdUserEventSpec type: #action subtype: 'read' groupTag: #toolbar iconName: 'file-ruled' iconLabel: 'View');
		at: #update put: (SlmdUserEventSpec type: #action subtype: 'update' groupTag: #toolbar iconName: 'pencil' iconLabel: 'Edit');
		at: #delete put: (SlmdUserEventSpec type: #action subtype: 'delete' groupTag: #toolbar iconName: 'trash' iconLabel: 'Delete');
		at: #save put: (SlmdUserEventSpec type: #action subtype: 'save' groupTag: #toolbar iconName: 'check' iconLabel: 'Save');
		at: #cancel put: (SlmdUserEventSpec type: #action subtype: 'cancel' groupTag: #toolbar iconName: 'x' iconLabel: 'Cancel');
		at: #modalNav put: (SlmdUserEventSpec type: #action subtype: 'modalNav' groupTag: #primary iconName: 'list' iconLabel: 'Menu');
		at: #back put: (SlmdUserEventSpec type: #nav subtype: #back groupTag: #primary iconName: 'arrow-left' iconLabel: 'Back' data: 'back');
		yourself.

]

{ #category : 'initialization' }
SlmdWebApplication >> setUpNavItems [
	"Subclasses may enhance"

]
