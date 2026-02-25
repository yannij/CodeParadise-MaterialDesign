Class {
	#name : 'WamDemoMoviesMovie',
	#superclass : 'WamDemoObject',
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
WamDemoMoviesMovie class >> attributeNames [

	^ #(id name classification rating duration tags)
]

{ #category : 'printing' }
WamDemoMoviesMovie class >> modelName [

	^ 'Movie'
]

{ #category : 'accessing' }
WamDemoMoviesMovie >> classification [

	^ classification
]

{ #category : 'accessing' }
WamDemoMoviesMovie >> classification: anObject [

	classification := anObject
]

{ #category : 'accessing' }
WamDemoMoviesMovie >> duration [

	^ duration
]

{ #category : 'accessing' }
WamDemoMoviesMovie >> duration: anObject [

	duration := anObject
]

{ #category : 'accessing' }
WamDemoMoviesMovie >> id [

	^ id
]

{ #category : 'accessing' }
WamDemoMoviesMovie >> id: anObject [

	id := anObject
]

{ #category : 'printing' }
WamDemoMoviesMovie >> mdPrimaryString [

	^ self name
]

{ #category : 'accessing' }
WamDemoMoviesMovie >> name [

	^ name
]

{ #category : 'accessing' }
WamDemoMoviesMovie >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
WamDemoMoviesMovie >> rating [

	^ rating
]

{ #category : 'accessing' }
WamDemoMoviesMovie >> rating: anObject [

	rating := anObject
]

{ #category : 'accessing' }
WamDemoMoviesMovie >> tags [

	^ tags
]

{ #category : 'accessing' }
WamDemoMoviesMovie >> tags: anObject [

	tags := anObject
]
