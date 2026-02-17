Class {
	#name : 'SlmdDemoMovieListingApp',
	#superclass : 'SlmdWebApplication',
	#instVars : [
		'repository',
		'modelClass',
		'model',
		'modelView'
	],
	#category : 'CodeParadise-Examples-MD3-Movies',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Movies'
}

{ #category : 'accessing' }
SlmdDemoMovieListingApp class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { WaElement package. SlmdView package }
]

{ #category : 'class initialization' }
SlmdDemoMovieListingApp class >> app [

	^ 'movies'
]

{ #category : 'class initialization' }
SlmdDemoMovieListingApp class >> appName [

	^ 'Movies'
]

{ #category : 'demo data' }
SlmdDemoMovieListingApp class >> createData [
	"
	self createData
	"
	| repo |

	self repositoryClass mapReset.
	self repositoryClass mapCreateAt: self soilPath.

	repo := self movieRepository.
	self createDemoMovieIn: repo.
	self createDemoTheatreIn: repo.
	self createDemoShowTimeIn: repo
]

{ #category : 'demo data' }
SlmdDemoMovieListingApp class >> createDemoMovieIn: aRepository [
	| modelClass |

	modelClass := SlmdDemoMoviesMovie.
	aRepository removeAll: modelClass.

	#(
	(1 'Aquaman and the Lost Kingdom' 'PG' 6 115 'Action, Adventure, Fantasy')
	(2 'Migration' 'G' 6 91 'Adventure, Animation, Comedy')
	(3 'Rewind' 'PG' 10 112 'Drama, Romance')
	(4 'Wonka' 'PG' 8 116 'Adventure, Fantasy, Comedy')
	) do: [ :data | | newObject |
		newObject := modelClass new
			id: (data at: 1);
			name: (data at: 2);
			classification: (data at: 3);
			rating: (data at: 4);
			duration: (data at: 5);
			tags: (data at: 6);
			yourself.
		aRepository save: newObject ]
]

{ #category : 'demo data' }
SlmdDemoMovieListingApp class >> createDemoShowTimeIn: aRepository [
	| modelClass |

	modelClass := SlmdDemoMoviesShowTime.
	aRepository removeAll: modelClass.

	#(
	(110 1 1 0 '1:40pm')
	(111 1 1 0 '3:40pm')
	(120 1 2 0 '1:30pm')
	(121 1 2 0 '4:20pm')
	(140 1 4 0 '1:40pm')
	(141 1 4 0 '3:50pm')
	(142 1 4 0 '6:30pm')
	(143 1 4 0 '9:20pm')

	(210 2 1 0 '12:00pm')
	(211 2 1 0 '3:00pm')
	(230 2 3 0 '11:20am')
	(231 2 3 0 '2:00pm')
	(232 2 3 0 '4:40pm')
	(233 2 3 0 '7:20pm')
	(234 2 3 0 '10:00pm')
	(240 2 4 0 '11:30am')
	(241 2 4 0 '2:10pm')
	(242 2 4 0 '4:50pm')
	(243 2 4 0 '7:30pm')
	(244 2 4 0 '10:10pm')
	) do: [ :data | | newObject |
		newObject := modelClass new
			id: (data at: 1);
			theatreId: (data at: 2);
			movieId: (data at: 3);
			showDate: (Date today addDays: (data at: 4));
			showStartTime: (Time fromString: '11:20am');
			yourself.
		aRepository save: newObject ]
]

{ #category : 'demo data' }
SlmdDemoMovieListingApp class >> createDemoTheatreIn: aRepository [
	| modelClass |

	modelClass := SlmdDemoMoviesTheatre.
	aRepository removeAll: modelClass.

	#(
	(1 'Cinemas Fairview Mall' '1800 Sheppard Ave. E, Toronto, ON M2J 5A7' '416-888-7746')
	(2 'Cinemas Vaughan' '3555 Hwy. 7 W, Vaughan, ON L4L 6B1' '905-888-1001')
	) do: [ :data | | newObject |
		newObject := modelClass new
			id: (data at: 1);
			name: (data at: 2);
			address: (data at: 3);
			phone: (data at: 4);
			yourself.
		aRepository save: newObject ]
]

{ #category : 'demo data' }
SlmdDemoMovieListingApp class >> movieRepository [

	^ self repositoryClass
		mapAt: self soilPath
		ifAbsent: [ (self repositoryClass onPath: self soilPath) open; yourself ]
]

{ #category : 'demo data' }
SlmdDemoMovieListingApp class >> movieRepositoryCreate [

	^ self repositoryClass mapCreateAt: self soilPath
]

{ #category : 'demo data' }
SlmdDemoMovieListingApp class >> repositoryClass [
	"
	self createData
	"

	^ SlmdDemoSoilRepository
]

{ #category : 'demo data' }
SlmdDemoMovieListingApp class >> soilPath [

	^ 'demo-movies'
]

{ #category : 'model' }
SlmdDemoMovieListingApp >> allModels [

	^ self repository selectAll: self modelClass

]

{ #category : 'presenter' }
SlmdDemoMovieListingApp >> applicationPresenterClass [

	^ SlmdDemoMovieListingAppPresenter
]

{ #category : 'accessing' }
SlmdDemoMovieListingApp >> applicationTitle [

	^ 'Movies'
]

{ #category : 'initialization' }
SlmdDemoMovieListingApp >> initialize [
	| pane1Model pane2Model pane1Content |

	super initialize.

	self repositorySetup.

	modelClass := SlmdDemoMoviesMovie.
	pane1Content := SlmdListModel new.
	pane1Content listSet: self allModels.
	pane1Model := SlmdPaneModel on: pane1Content.
	pane2Model := SlmdPaneModel new.
	pane2Model appBarModel beSecondary; actionGroupToUse: #toolbar.
	"layout := SlmdResponsiveLayoutModel new."
	layout paneLayout pane1: pane1Model.
	layout paneLayout pane2: pane2Model.
	layout layoutSettings colorThemeName: #cyan; fontFamily: #'serif'.
	self setUpAppBar2.

]

{ #category : 'accessing' }
SlmdDemoMovieListingApp >> model [

	^ model
]

{ #category : 'accessing' }
SlmdDemoMovieListingApp >> model: anObject [

	model := anObject
]

{ #category : 'model' }
SlmdDemoMovieListingApp >> modelAdd: aModel [
	"Not implemented"
]

{ #category : 'accessing' }
SlmdDemoMovieListingApp >> modelClass [

	^ modelClass
]

{ #category : 'accessing' }
SlmdDemoMovieListingApp >> modelClass: anObject [

	modelClass := anObject
]

{ #category : 'model' }
SlmdDemoMovieListingApp >> modelRemove: aModel [
	"Not implemented"
]

{ #category : 'accessing' }
SlmdDemoMovieListingApp >> modelSet: anObject [

	self model: anObject.
	anObject
		ifNil: [ self modelView: nil ]
		ifNotNil: [ self modelView: (anObject viewClass on: anObject) ]
]

{ #category : 'accessing' }
SlmdDemoMovieListingApp >> modelView [

	^ modelView
]

{ #category : 'accessing' }
SlmdDemoMovieListingApp >> modelView: anObject [

	modelView := anObject
]

{ #category : 'accessing' }
SlmdDemoMovieListingApp >> navItemsToUse [

	^ OrderedCollection new
		add: (self nativeEventSpecAt: #settingsOpen);
		addAll: super navItemsToUse;
		yourself.
]

{ #category : 'events' }
SlmdDemoMovieListingApp >> navTo: aNavActionEvent [
	| data |

	data := aNavActionEvent data.

	data = #movie ifTrue: [
		modelClass := SlmdDemoMoviesMovie ].
	data = #theatre ifTrue: [
		modelClass := SlmdDemoMoviesTheatre ].
	data = #showtime ifTrue: [
		modelClass := SlmdDemoMoviesShowTime ].

	self layout pane1 paneContent listSet: self allModels.
	self listDetailReset.

]

{ #category : 'accessing' }
SlmdDemoMovieListingApp >> repository [

	^ repository
]

{ #category : 'accessing' }
SlmdDemoMovieListingApp >> repository: anObject [

	repository := anObject
]

{ #category : 'initialization' }
SlmdDemoMovieListingApp >> repositorySetup [

	self repository: self class movieRepository
]

{ #category : 'initialization' }
SlmdDemoMovieListingApp >> setUpAppBar2 [

	"self layout pane2 appBarModel
		actionItemsAdd: (self nativeEventSpecAt: #delete);
		actionItemsAdd: (self nativeEventSpecAt: #update);
		yourself."

]

{ #category : 'events' }
SlmdDemoMovieListingApp >> setUpCustomEvents [

	super setUpCustomEvents.

	self
		addNavSubtype: #navTo groupTag: #primary iconName: 'suit-club' iconLabel: 'Movies' data: #movie;
		addNavSubtype: #navTo groupTag: #primary iconName: 'suit-club' iconLabel: 'Theatres' data: #theatre;
		addNavSubtype: #navTo groupTag: #primary iconName: 'suit-club' iconLabel: 'Show Times' data: #showtime;
		yourself.

]

{ #category : 'accessing' }
SlmdDemoMovieListingApp >> userEventSpecFAB [
	"Subclasses may override"

	^ nil
]
