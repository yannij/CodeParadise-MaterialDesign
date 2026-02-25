Class {
	#name : 'WamDemoMoviesShowTime',
	#superclass : 'WamDemoObject',
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
WamDemoMoviesShowTime class >> attributeNames [

	^ #(id movieId theatreId showDate showStartTime)
]

{ #category : 'printing' }
WamDemoMoviesShowTime class >> modelName [

	^ 'Show Time'
]

{ #category : 'accessing' }
WamDemoMoviesShowTime >> id [

	^ id
]

{ #category : 'accessing' }
WamDemoMoviesShowTime >> id: anObject [

	id := anObject
]

{ #category : 'printing' }
WamDemoMoviesShowTime >> mdPrimaryString [

	^ self summaryString
]

{ #category : 'accessing' }
WamDemoMoviesShowTime >> movieId [

	^ movieId
]

{ #category : 'accessing' }
WamDemoMoviesShowTime >> movieId: anObject [

	movieId := anObject
]

{ #category : 'accessing' }
WamDemoMoviesShowTime >> moviesIn: aRepo [

	^ aRepo
		selectMany: WamDemoMoviesMovie
		where: [ :each | each id = self movieId ]
]

{ #category : 'accessing' }
WamDemoMoviesShowTime >> name [

	^ ''
]

{ #category : 'accessing' }
WamDemoMoviesShowTime >> showDate [

	^ showDate
]

{ #category : 'accessing' }
WamDemoMoviesShowTime >> showDate: anObject [

	showDate := anObject
]

{ #category : 'accessing' }
WamDemoMoviesShowTime >> showStartTime [

	^ showStartTime
]

{ #category : 'accessing' }
WamDemoMoviesShowTime >> showStartTime: anObject [

	showStartTime := anObject
]

{ #category : 'accessing' }
WamDemoMoviesShowTime >> theatreId [

	^ theatreId
]

{ #category : 'accessing' }
WamDemoMoviesShowTime >> theatreId: anObject [

	theatreId := anObject
]

{ #category : 'accessing' }
WamDemoMoviesShowTime >> theatresIn: aRepo [

	^ aRepo
		selectMany: WamDemoMoviesTheatre
		where: [ :each | each id = self theatreId ]
]
