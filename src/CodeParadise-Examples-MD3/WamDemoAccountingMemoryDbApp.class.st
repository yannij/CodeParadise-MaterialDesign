Class {
	#name : 'WamDemoAccountingMemoryDbApp',
	#superclass : 'WamDemoAccountingApp',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'initialization' }
WamDemoAccountingMemoryDbApp class >> app [

	^ 'accounting'
]

{ #category : 'initialization' }
WamDemoAccountingMemoryDbApp class >> appName [

	^ 'Accounting'
]

{ #category : 'initialization' }
WamDemoAccountingMemoryDbApp class >> repositoryClass [
	"
	self createData
	"

	^ WamDemoMemoryRepository
]
