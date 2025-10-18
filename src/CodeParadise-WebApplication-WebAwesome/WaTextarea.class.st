Class {
	#name : 'WaTextarea',
	#superclass : 'WaTextControl',
	#category : 'CodeParadise-WebApplication-WebAwesome-Elements',
	#package : 'CodeParadise-WebApplication-WebAwesome',
	#tag : 'Elements'
}

{ #category : 'accessing' }
WaTextarea >> resize [

	^ self propertyAt: #resize
]

{ #category : 'accessing' }
WaTextarea >> resize: aString [

	self propertyAt: #resize put: aString
]

{ #category : 'accessing style' }
WaTextarea >> resizeAuto [

	self resize: #auto
]

{ #category : 'accessing style' }
WaTextarea >> resizeNone [

	self resize: #none
]

{ #category : 'accessing style' }
WaTextarea >> resizeVertical [

	self resize: #vertical
]

{ #category : 'accessing' }
WaTextarea >> rows [

	^ self propertyAt: #rows
]

{ #category : 'accessing' }
WaTextarea >> rows: anInteger [

	self propertyAt: #rows put: anInteger
]

{ #category : 'accessing style' }
WaTextarea >> scrollPosition [

	"Gets the textarea's scroll position.
	Answer will be a dictionaty with keys 'top' and 'left', both being Numbers."

	^ self apply: #scrollPosition withArguments: #()
]

{ #category : 'accessing style' }
WaTextarea >> scrollPositionTop: topNumber left: leftNumber [

	"Sets the textarea's scroll position"

	^ self apply: #scrollPosition withArguments: { topNumber . leftNumber }
]
