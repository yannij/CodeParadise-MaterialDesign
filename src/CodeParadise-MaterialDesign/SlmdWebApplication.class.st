Class {
	#name : 'SlmdWebApplication',
	#superclass : 'CpMvpWebApplication',
	#instVars : [
		'navActions',
		'actionItems',
		'layout',
		'sidesheetModel'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'accessing' }
SlmdWebApplication >> actionItemNamed: aKey [

	^ self actionItems detect: [ :each | each id = aKey ] ifNone: []
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

{ #category : 'initialization' }
SlmdWebApplication >> initialize [

	super initialize.

	layout := SlmdResponsiveLayoutModel new.
	navActions := OrderedCollection new.
	actionItems := OrderedCollection new.

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
SlmdWebApplication >> navActions [

	^ navActions
]

{ #category : 'accessing' }
SlmdWebApplication >> navActions: anObject [

	navActions := anObject
]

{ #category : 'accessing' }
SlmdWebApplication >> pane1Model [

	^ self layout paneLayout pane1
]

{ #category : 'accessing' }
SlmdWebApplication >> pane2Model [

	^ self layout paneLayout pane2
]

{ #category : 'accessing' }
SlmdWebApplication >> sidesheetModel [

	^ sidesheetModel
]

{ #category : 'accessing' }
SlmdWebApplication >> sidesheetModel: anObject [

	sidesheetModel := anObject
]
