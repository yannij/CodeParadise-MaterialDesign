Class {
	#name : 'CpWebAwesomeExamplesWebApplication',
	#superclass : 'CpWebApplication',
	#category : 'CodeParadise-WebApplication-WebAwesome-Examples',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Examples'
}

{ #category : 'accessing' }
CpWebAwesomeExamplesWebApplication class >> app [

	"Answer the unique identifier (a Symbol) for the receiver"

	^ #'WebAwesome-Examples'
]

{ #category : 'installing' }
CpWebAwesomeExamplesWebApplication >> extensionMethodCategories [

	"Answer the collection of extension method categories needed for the receiver"

	^ super extensionMethodCategories,
		#(webApplicationWebAwesomeExtension)
]
