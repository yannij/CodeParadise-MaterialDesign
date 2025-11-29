Class {
	#name : 'SlmdModel',
	#superclass : 'CpModel',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'events' }
SlmdModel >> navActionFind: anObject [

	^ nil
]

{ #category : 'actions' }
SlmdModel >> processNavActionEvent: aBasicEvent [
	"Hook to receive UI events for handling"
]

{ #category : 'accessing' }
SlmdModel >> systemLog [

	^ SlmdLog
]
