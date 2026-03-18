Class {
	#name : 'WamItemWrapperModel',
	#superclass : 'WamModel',
	#instVars : [
		'wrappedModel',
		'crudState'
	],
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'instance creation' }
WamItemWrapperModel class >> on: aModel [

	^ self new
		wrappedModel: aModel;
		yourself
]

{ #category : 'instance creation' }
WamItemWrapperModel class >> onNewModel: aModel [

	^ (self on: aModel)
		beCreating;
		yourself
]

{ #category : 'states' }
WamItemWrapperModel >> beCreating [

	self crudState: #creating
]

{ #category : 'states' }
WamItemWrapperModel >> beDeleting [

	self crudState: #deleting
]

{ #category : 'states' }
WamItemWrapperModel >> beReading [

	self crudState: #reading
]

{ #category : 'states' }
WamItemWrapperModel >> beUpdating [

	self crudState: #updating
]

{ #category : 'accessing' }
WamItemWrapperModel >> crudState [

	^ crudState
]

{ #category : 'accessing' }
WamItemWrapperModel >> crudState: anObject [

	crudState := anObject
]

{ #category : 'initialization' }
WamItemWrapperModel >> initialize [

	super initialize.

	crudState := #reading.

]

{ #category : 'testing' }
WamItemWrapperModel >> isCreating [

	^ self crudState = #creating
]

{ #category : 'testing' }
WamItemWrapperModel >> isDeleting [

	^ self crudState = #deleting
]

{ #category : 'testing' }
WamItemWrapperModel >> isReading [

	^ self crudState = #reading
]

{ #category : 'testing' }
WamItemWrapperModel >> isUpdating [

	^ self crudState = #updating
]

{ #category : 'accessing' }
WamItemWrapperModel >> wrappedModel [

	^ wrappedModel
]

{ #category : 'accessing' }
WamItemWrapperModel >> wrappedModel: anObject [

	wrappedModel := anObject
]
