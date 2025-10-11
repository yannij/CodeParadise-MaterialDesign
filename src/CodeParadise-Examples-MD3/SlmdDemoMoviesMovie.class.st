Class {
	#name : 'SlmdDemoMoviesMovie',
	#superclass : 'SlmdDemoObject',
	#instVars : [
		'id',
		'name',
		'classification',
		'rating',
		'duration',
		'tags'
	],
	#category : 'CodeParadise-Examples-MD3-Movies',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Movies'
}

{ #category : 'printing' }
SlmdDemoMoviesMovie class >> attributeNames [

	^ #(id name classification rating duration tags)
]

{ #category : 'printing' }
SlmdDemoMoviesMovie class >> modelName [

	^ 'Movie'
]

{ #category : 'accessing' }
SlmdDemoMoviesMovie >> classification [

	^ classification
]

{ #category : 'accessing' }
SlmdDemoMoviesMovie >> classification: anObject [

	classification := anObject
]

{ #category : 'accessing' }
SlmdDemoMoviesMovie >> duration [

	^ duration
]

{ #category : 'accessing' }
SlmdDemoMoviesMovie >> duration: anObject [

	duration := anObject
]

{ #category : 'accessing' }
SlmdDemoMoviesMovie >> id [

	^ id
]

{ #category : 'accessing' }
SlmdDemoMoviesMovie >> id: anObject [

	id := anObject
]

{ #category : 'printing' }
SlmdDemoMoviesMovie >> mdPrimaryString [

	^ self name
]

{ #category : 'accessing' }
SlmdDemoMoviesMovie >> name [

	^ name
]

{ #category : 'accessing' }
SlmdDemoMoviesMovie >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
SlmdDemoMoviesMovie >> rating [

	^ rating
]

{ #category : 'accessing' }
SlmdDemoMoviesMovie >> rating: anObject [

	rating := anObject
]

{ #category : 'accessing' }
SlmdDemoMoviesMovie >> tags [

	^ tags
]

{ #category : 'accessing' }
SlmdDemoMoviesMovie >> tags: anObject [

	tags := anObject
]
