Class {
	#name : 'SlmdDemoMovieListingAppPresenter',
	#superclass : 'SlmdWebPresenter',
	#category : 'CodeParadise-Examples-MD3-Movies',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Movies'
}

{ #category : 'rendering' }
SlmdDemoMovieListingAppPresenter >> renderView [

	self renderAllChildViewsForModels: {self model layout} atSlotNamed: #layout
]
