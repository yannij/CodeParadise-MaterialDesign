Class {
	#name : 'SlmdWebApplication',
	#superclass : 'CpMvpWebApplication',
	#instVars : [
		'layout',
		'userEventSpecs'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'accessing' }
SlmdWebApplication >> actionItems [

	^ self userEventSpecs select: [ :each | each isActionType ]
]

{ #category : 'initialization' }
SlmdWebApplication >> addActionSubtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel [

	self userEventSpecs at: subtype put: (SlmdUserEventSpec type: #action subtype: subtype groupTag: groupTag iconName: iconName iconLabel: itemLabel).

]

{ #category : 'initialization' }
SlmdWebApplication >> addNativeSubtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel [

	self userEventSpecs at: subtype put: (SlmdUserEventSpec type: #native subtype: subtype groupTag: groupTag iconName: iconName iconLabel: itemLabel).

]

{ #category : 'initialization' }
SlmdWebApplication >> addNavSubtype: subtype  groupTag: groupTag iconName: iconName iconLabel: itemLabel data: data [

	self userEventSpecs at: subtype put: (SlmdUserEventSpec type: #nav subtype: subtype groupTag: groupTag iconName: iconName iconLabel: itemLabel data: data)
]

{ #category : 'accessing' }
SlmdWebApplication >> applicationModel [

	"Answer the Model for the receiver, which is the receiver itself"

	^ self
]

{ #category : 'initialization' }
SlmdWebApplication >> initialize [

	super initialize.

	userEventSpecs := OrderedIdentityDictionary new.
	self setUpNativeEvents.
	self setUpCustomEvents.

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

	^ OrderedCollection new
]

{ #category : 'accessing' }
SlmdWebApplication >> navItemsSpecs [

	^ self userEventSpecs select: [ :each | each isNavType ]
]

{ #category : 'initialization' }
SlmdWebApplication >> setUpCustomEvents [
	"Subclasses may enhance"

]

{ #category : 'initialization' }
SlmdWebApplication >> setUpNativeEvents [

	self
		addNativeSubtype: #create groupTag: #fab iconName: 'plus' iconLabel: 'Add';
		addNativeSubtype: #read groupTag: #toolbar iconName: 'file-ruled' iconLabel: 'View';
		addNativeSubtype: #update groupTag: #toolbar iconName: 'pencil' iconLabel: 'Edit';
		addNativeSubtype: #delete groupTag: #toolbar iconName: 'trash' iconLabel: 'Delete';
		addNativeSubtype: #save groupTag: #toolbar iconName: 'check' iconLabel: 'Save';
		addNativeSubtype: #cancel groupTag: #toolbar iconName: 'x' iconLabel: 'Cancel';
		addNativeSubtype: #refresh groupTag: #primary iconName: 'arrow-clockwise' iconLabel: 'Refresh';
		addNativeSubtype: #modalNav groupTag: #primary iconName: 'list' iconLabel: 'Menu';
		addNativeSubtype: #settingsOpen groupTag: #primary iconName: 'gear' iconLabel: 'Settings';
		addNativeSubtype: #home groupTag: #primary iconName: 'house' iconLabel: 'Home';
		addNativeSubtype: #back groupTag: #primary iconName: 'arrow-left' iconLabel: 'Back';
		yourself.

]

{ #category : 'accessing' }
SlmdWebApplication >> userEventSpecAt: aKey [

	^ self userEventSpecs at: aKey ifAbsent: []
]

{ #category : 'accessing' }
SlmdWebApplication >> userEventSpecFAB [
	"Subclasses may override"

	^ nil
]

{ #category : 'accessing' }
SlmdWebApplication >> userEventSpecs [

	^ userEventSpecs
]

{ #category : 'accessing' }
SlmdWebApplication >> userEventSpecs: anObject [

	userEventSpecs := anObject
]

{ #category : 'accessing' }
SlmdWebApplication >> userEventSpecsNative [

	^ self userEventSpecs select: [ :each | each isNativeType ]
]
