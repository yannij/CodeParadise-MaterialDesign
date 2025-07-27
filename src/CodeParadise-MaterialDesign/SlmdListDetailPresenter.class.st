Class {
	#name : 'SlmdListDetailPresenter',
	#superclass : 'SlmdPresenter',
	#category : 'CodeParadise-MaterialDesign-ShoelaceListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceListDetail'
}

{ #category : 'rendering' }
SlmdListDetailPresenter >> renderView [

	"self logTrace: self printString aspect: 'renderView' level: 3."

	self
		renderAllChildViewsForModels: self model list
		usingPresenter: SlmdListDetailListPresenter
		atSlotNamed: #posts
]
