Class {
	#name : 'SlmdActionItem',
	#superclass : 'SlmdUserAction',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'accessing' }
SlmdActionItem class >> userActionType [

	^ #action
]

{ #category : 'converting' }
SlmdActionItem >> asDictionary [

	^ Dictionary new
		at: #itemName put: itemName;
		at: #userActionType put: self class userActionType;
		at: #groupTag put: groupTag;
		at: #iconName put: iconName;
		at: #iconLabel put: iconLabel;
		yourself
]
