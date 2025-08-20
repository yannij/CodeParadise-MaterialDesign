Class {
	#name : 'SlmdDemoMoviesTheatre',
	#superclass : 'SlmdDemoObject',
	#instVars : [
		'id',
		'name',
		'address',
		'phone'
	],
	#category : 'CodeParadise-Examples-MD3-Movies',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Movies'
}

{ #category : 'printing' }
SlmdDemoMoviesTheatre class >> attributeData [

	^ #(id name address phone)
]

{ #category : 'printing' }
SlmdDemoMoviesTheatre class >> modelName [

	^ 'Theatre'
]

{ #category : 'accessing' }
SlmdDemoMoviesTheatre >> address [

	^ address
]

{ #category : 'accessing' }
SlmdDemoMoviesTheatre >> address: anObject [

	address := anObject
]

{ #category : 'accessing' }
SlmdDemoMoviesTheatre >> id [

	^ id
]

{ #category : 'accessing' }
SlmdDemoMoviesTheatre >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
SlmdDemoMoviesTheatre >> name [

	^ name
]

{ #category : 'accessing' }
SlmdDemoMoviesTheatre >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
SlmdDemoMoviesTheatre >> phone [

	^ phone
]

{ #category : 'accessing' }
SlmdDemoMoviesTheatre >> phone: anObject [

	phone := anObject
]

{ #category : 'printing' }
SlmdDemoMoviesTheatre >> slmdShortSummary [

	^ self name
]
