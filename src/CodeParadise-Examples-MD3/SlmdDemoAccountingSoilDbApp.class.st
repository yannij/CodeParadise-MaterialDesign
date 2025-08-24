Class {
	#name : 'SlmdDemoAccountingSoilDbApp',
	#superclass : 'SlmdDemoAccountingApp',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'initialization' }
SlmdDemoAccountingSoilDbApp class >> app [

	^ 'accounting-soil'
]

{ #category : 'initialization' }
SlmdDemoAccountingSoilDbApp class >> appName [

	^ 'Accounting-soil'
]

{ #category : 'initialization' }
SlmdDemoAccountingSoilDbApp class >> repositoryClass [
	"
	self createData
	"

	"^ SlmdDemoSoilCheckpointRepository"
	^ SlmdDemoSoilRepository
]
