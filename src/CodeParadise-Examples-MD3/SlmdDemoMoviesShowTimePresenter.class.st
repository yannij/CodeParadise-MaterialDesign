Class {
	#name : 'SlmdDemoMoviesShowTimePresenter',
	#superclass : 'SlmdDemoObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-Movies',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Movies'
}

{ #category : 'rendering' }
SlmdDemoMoviesShowTimePresenter >> renderDetails [
	| theatres movies |

	self view renderModelTableClear.

	theatres := self model theatresIn: self repositoryToUse.
	self renderDetail: theatres modelClass: SlmdDemoMoviesTheatre label: 'Theatres'.

	movies := self model moviesIn: self repositoryToUse.
	self renderDetail: movies modelClass: SlmdDemoMoviesMovie label: 'Movies'.

]
