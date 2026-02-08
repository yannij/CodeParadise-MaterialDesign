Class {
	#name : 'SlmdPaneContentView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
SlmdPaneContentView class >> template [

	<webResource: #html>

	^ '<slot name="content"></slot>'
]

{ #category : 'rendering' }
SlmdPaneContentView >> renderContent: aString [

	self replaceAllChildrenWith: (aString inHtmlTag: #span) atSlotNamed: 'content'.

]
