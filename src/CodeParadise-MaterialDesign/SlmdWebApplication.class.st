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

{ #category : 'initialization' }
SlmdWebApplication >> itemName: itemName groupTag: groupTag iconName: iconName iconLabel: itemLabel [

	^ SlmdUserAction itemName: itemName groupTag: groupTag iconName: iconName iconLabel: itemLabel
]

{ #category : 'initialization' }
SlmdWebApplication >> itemName: itemName groupTag: groupTag iconName: iconName iconLabel: itemLabel navTo: navTo [

	^ SlmdUserAction itemName: itemName groupTag: groupTag iconName: iconName iconLabel: itemLabel navTo: navTo
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
		at: #read put: (self itemName: 'read' groupTag: #toolbar iconName: 'file-ruled' iconLabel: 'View');
		at: #update put: (self itemName: 'update' groupTag: #toolbar iconName: 'pencil' iconLabel: 'Edit');
		at: #delete put: (self itemName: 'delete' groupTag: #toolbar iconName: 'trash' iconLabel: 'Delete');
		at: #save put: (self itemName: 'save' groupTag: #toolbar iconName: 'check' iconLabel: 'Save');
		at: #cancel put: (self itemName: 'cancel' groupTag: #toolbar iconName: 'x' iconLabel: 'Cancel');
		at: #modalNav put: (self itemName: 'modalNav' groupTag: #primary iconName: 'list' iconLabel: 'Menu');
		at: #back put: (self itemName: #nav groupTag: #primary iconName: 'arrow-left' iconLabel: 'Back' navTo: 'back');
		yourself.

]

{ #category : 'initialization' }
SlmdWebApplication >> setUpNavItems [
	"Subclasses may enhance"

]
