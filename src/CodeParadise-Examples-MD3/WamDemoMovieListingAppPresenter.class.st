Class {
	#name : 'WamDemoMovieListingAppPresenter',
	#superclass : 'WamWebPresenter',
	#category : 'CodeParadise-Examples-MD3-Movies',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Movies'
}

{ #category : 'rendering' }
WamDemoMovieListingAppPresenter >> renderView [

	self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout
]
