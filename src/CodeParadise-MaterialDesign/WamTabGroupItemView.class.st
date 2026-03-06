Class {
	#name : 'WamTabGroupItemView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Preferences',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Preferences'
}

{ #category : 'web resources' }
WamTabGroupItemView class >> template [

	<webResource: #html>

	^ '<slot></slot>'
]
