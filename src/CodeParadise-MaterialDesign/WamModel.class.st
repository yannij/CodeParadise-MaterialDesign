Class {
	#name : 'WamModel',
	#superclass : 'CpModel',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'events' }
WamModel >> navActionAtId: anObject [

	^ nil
]

{ #category : 'actions' }
WamModel >> processNavActionEvent: aBasicEvent [
	"Hook to receive UI events for handling"
]

{ #category : 'accessing' }
WamModel >> systemLog [

	^ WamLog
]
