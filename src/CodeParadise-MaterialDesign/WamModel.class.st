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

{ #category : 'view style' }
WamModel >> viewMode [
	"Subclasses may specialize.
	
	Any model that is set as the paneContent of WamPaneModel
	must support this method.
	"
]

{ #category : 'view style' }
WamModel >> viewMode: aViewMode [
	"Subclasses may specialize"
]
