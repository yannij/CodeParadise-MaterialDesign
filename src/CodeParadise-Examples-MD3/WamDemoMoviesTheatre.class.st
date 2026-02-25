Class {
	#name : 'WamDemoMoviesTheatre',
	#superclass : 'WamDemoObject',
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
WamDemoMoviesTheatre class >> attributeNames [

	^ #(id name address phone)
]

{ #category : 'printing' }
WamDemoMoviesTheatre class >> modelName [

	^ 'Theatre'
]

{ #category : 'accessing' }
WamDemoMoviesTheatre >> address [

	^ address
]

{ #category : 'accessing' }
WamDemoMoviesTheatre >> address: anObject [

	address := anObject
]

{ #category : 'accessing' }
WamDemoMoviesTheatre >> id [

	^ id
]

{ #category : 'accessing' }
WamDemoMoviesTheatre >> id: anObject [

	id := anObject
]

{ #category : 'printing' }
WamDemoMoviesTheatre >> mdPrimaryString [

	^ self name
]

{ #category : 'accessing' }
WamDemoMoviesTheatre >> name [

	^ name
]

{ #category : 'accessing' }
WamDemoMoviesTheatre >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
WamDemoMoviesTheatre >> phone [

	^ phone
]

{ #category : 'accessing' }
WamDemoMoviesTheatre >> phone: anObject [

	phone := anObject
]
