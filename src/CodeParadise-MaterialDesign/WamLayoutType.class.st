Class {
	#name : 'WamLayoutType',
	#superclass : 'Object',
	#category : 'CodeParadise-MaterialDesign-WAM',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'WAM'
}

{ #category : 'accessing' }
WamLayoutType class >> layoutTypeCompact [

	^ #compact
]

{ #category : 'accessing' }
WamLayoutType class >> layoutTypeExpanded [

	^ #expanded
]

{ #category : 'accessing' }
WamLayoutType class >> layoutTypeExtraLarge [

	^ #'extra-large'
]

{ #category : 'accessing' }
WamLayoutType class >> layoutTypeLarge [

	^ #large
]

{ #category : 'accessing' }
WamLayoutType class >> layoutTypeList [

	^ {
	self layoutTypeCompact -> 'Compact'.
	self layoutTypeMedium -> 'Medium'.
	self layoutTypeExpanded -> 'Expanded'.
	self layoutTypeLarge -> 'Large'.
	self layoutTypeExtraLarge -> 'Extra-large'.
	}
]

{ #category : 'accessing' }
WamLayoutType class >> layoutTypeMedium [

	^ #medium
]
