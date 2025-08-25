Class {
	#name : 'SlmdLoginView',
	#superclass : 'SlmdView',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'rendering' }
SlmdLoginView >> hello [

	self appendChild: ('HelloWorld') asHtmlElement.

]

{ #category : 'accessing' }
SlmdLoginView >> layoutViewLazy [

	self shouldNotImplement
]
