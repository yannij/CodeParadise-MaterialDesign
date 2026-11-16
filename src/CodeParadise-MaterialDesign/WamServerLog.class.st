Class {
	#name : 'WamServerLog',
	#superclass : 'WamLog',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'accessing' }
WamServerLog class >> application [
	"Answer the application in which the receiver is running.

	Implementation:
	Same code as CpModel."

	^ CpCurrentApplicationContext application

]
