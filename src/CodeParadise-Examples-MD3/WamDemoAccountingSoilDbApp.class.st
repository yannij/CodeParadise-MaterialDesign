Class {
	#name : 'WamDemoAccountingSoilDbApp',
	#superclass : 'WamDemoAccountingApp',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'initialization' }
WamDemoAccountingSoilDbApp class >> app [

	^ 'accounting-soil'
]

{ #category : 'initialization' }
WamDemoAccountingSoilDbApp class >> appName [

	^ 'Accounting-soil'
]

{ #category : 'initialization' }
WamDemoAccountingSoilDbApp class >> repositoryClass [
	"
	self createData
	"

	"^ SlmdDemoSoilCheckpointRepository"
	^ WamDemoSoilRepository
]
