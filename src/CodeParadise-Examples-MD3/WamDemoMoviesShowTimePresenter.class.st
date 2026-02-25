Class {
	#name : 'WamDemoMoviesShowTimePresenter',
	#superclass : 'WamDemoObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-Movies',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Movies'
}

{ #category : 'rendering' }
WamDemoMoviesShowTimePresenter >> renderDetails [
	| theatres movies |

	self view renderModelTableClear.

	theatres := self model theatresIn: self repositoryToUse.
	self renderDetail: theatres modelClass: WamDemoMoviesTheatre label: 'Theatres'.

	movies := self model moviesIn: self repositoryToUse.
	self renderDetail: movies modelClass: WamDemoMoviesMovie label: 'Movies'.

]
