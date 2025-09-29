Class {
	#name : 'SlmdPopupsView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'web resources' }
SlmdPopupsView class >> template [

	<webResource: #html>

	^ '<slot name="content"></slot>'
]
