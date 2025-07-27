Class {
	#name : 'SlmdToolbarModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'fab',
		'isVisible',
		'iconButtons'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'accessing' }
SlmdToolbarModel >> fab [

	^ fab
]

{ #category : 'accessing' }
SlmdToolbarModel >> fab: anObject [

	fab := anObject
]

{ #category : 'accessing' }
SlmdToolbarModel >> iconButtons [

	^ iconButtons
]

{ #category : 'accessing' }
SlmdToolbarModel >> iconButtons: anObject [

	iconButtons := anObject
]

{ #category : 'accessing' }
SlmdToolbarModel >> isVisible [

	^ isVisible
]

{ #category : 'accessing' }
SlmdToolbarModel >> isVisible: anObject [

	isVisible := anObject
]
