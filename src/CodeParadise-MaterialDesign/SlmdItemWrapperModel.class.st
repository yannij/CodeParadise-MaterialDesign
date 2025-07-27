Class {
	#name : 'SlmdItemWrapperModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'index',
		'wrappedModel',
		'crudState'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceListDetail'
}

{ #category : 'instance creation' }
SlmdItemWrapperModel class >> on: aModel atIndex: anIndex [

	^ self new
		wrappedModel: aModel;
		index: anIndex;
		yourself
]

{ #category : 'instance creation' }
SlmdItemWrapperModel class >> onNewModel: aModel [

	^ self on: aModel atIndex: nil
]

{ #category : 'states' }
SlmdItemWrapperModel >> beCreating [

	self crudState: #creating
]

{ #category : 'states' }
SlmdItemWrapperModel >> beDeleting [

	self crudState: #deleting
]

{ #category : 'states' }
SlmdItemWrapperModel >> beReading [

	self crudState: #reading
]

{ #category : 'states' }
SlmdItemWrapperModel >> beUpdating [

	self crudState: #updating
]

{ #category : 'accessing' }
SlmdItemWrapperModel >> crudState [

	^ crudState
]

{ #category : 'accessing' }
SlmdItemWrapperModel >> crudState: anObject [

	crudState := anObject
]

{ #category : 'accessing' }
SlmdItemWrapperModel >> index [

	^ index
]

{ #category : 'accessing' }
SlmdItemWrapperModel >> index: anObject [

	index := anObject
]

{ #category : 'initialization' }
SlmdItemWrapperModel >> initialize [

	super initialize.

	crudState := #reading.

]

{ #category : 'testing' }
SlmdItemWrapperModel >> isCreating [

	^ self crudState = #creating
]

{ #category : 'testing' }
SlmdItemWrapperModel >> isDeleting [

	^ self crudState = #deleting
]

{ #category : 'testing' }
SlmdItemWrapperModel >> isNew [

	^ self index isNil
]

{ #category : 'testing' }
SlmdItemWrapperModel >> isReading [

	^ self crudState = #reading
]

{ #category : 'testing' }
SlmdItemWrapperModel >> isUpdating [

	^ self crudState = #updating
]

{ #category : 'accessing' }
SlmdItemWrapperModel >> wrappedModel [

	^ wrappedModel
]

{ #category : 'accessing' }
SlmdItemWrapperModel >> wrappedModel: anObject [

	wrappedModel := anObject
]
