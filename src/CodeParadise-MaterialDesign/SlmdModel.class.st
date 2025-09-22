Class {
	#name : 'SlmdModel',
	#superclass : 'CpModel',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'actions' }
SlmdModel >> handleUserEvent: aBasicEvent [
	"Hook to receive UI events for handling"
]

{ #category : 'accessing' }
SlmdModel >> systemLog [

	^ SlmdLog
]
