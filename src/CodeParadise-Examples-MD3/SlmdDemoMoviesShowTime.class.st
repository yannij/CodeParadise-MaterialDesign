Class {
	#name : 'SlmdDemoMoviesShowTime',
	#superclass : 'SlmdDemoObject',
	#instVars : [
		'id',
		'movieId',
		'theatreId',
		'showDate',
		'showStartTime'
	],
	#category : 'CodeParadise-Examples-MD3-Movies',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Movies'
}

{ #category : 'printing' }
SlmdDemoMoviesShowTime class >> attributeNames [

	^ #(id movieId theatreId showDate showStartTime)
]

{ #category : 'printing' }
SlmdDemoMoviesShowTime class >> modelName [

	^ 'Show Time'
]

{ #category : 'accessing' }
SlmdDemoMoviesShowTime >> id [

	^ id
]

{ #category : 'accessing' }
SlmdDemoMoviesShowTime >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
SlmdDemoMoviesShowTime >> movieId [

	^ movieId
]

{ #category : 'accessing' }
SlmdDemoMoviesShowTime >> movieId: anObject [

	movieId := anObject
]

{ #category : 'accessing' }
SlmdDemoMoviesShowTime >> moviesIn: aRepo [

	^ aRepo
		selectMany: SlmdDemoMoviesMovie
		where: [ :each | each id = self movieId ]
]

{ #category : 'accessing' }
SlmdDemoMoviesShowTime >> name [

	^ ''
]

{ #category : 'accessing' }
SlmdDemoMoviesShowTime >> showDate [

	^ showDate
]

{ #category : 'accessing' }
SlmdDemoMoviesShowTime >> showDate: anObject [

	showDate := anObject
]

{ #category : 'accessing' }
SlmdDemoMoviesShowTime >> showStartTime [

	^ showStartTime
]

{ #category : 'accessing' }
SlmdDemoMoviesShowTime >> showStartTime: anObject [

	showStartTime := anObject
]

{ #category : 'printing' }
SlmdDemoMoviesShowTime >> slmdShortSummary [

	^ self summaryString
]

{ #category : 'accessing' }
SlmdDemoMoviesShowTime >> theatreId [

	^ theatreId
]

{ #category : 'accessing' }
SlmdDemoMoviesShowTime >> theatreId: anObject [

	theatreId := anObject
]

{ #category : 'accessing' }
SlmdDemoMoviesShowTime >> theatresIn: aRepo [

	^ aRepo
		selectMany: SlmdDemoMoviesTheatre
		where: [ :each | each id = self theatreId ]
]
