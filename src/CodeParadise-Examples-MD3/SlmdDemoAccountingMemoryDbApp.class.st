Class {
	#name : 'SlmdDemoAccountingMemoryDbApp',
	#superclass : 'SlmdDemoAccountingApp',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'initialization' }
SlmdDemoAccountingMemoryDbApp class >> app [

	^ 'accounting'
]

{ #category : 'initialization' }
SlmdDemoAccountingMemoryDbApp class >> appName [

	^ 'Accounting'
]

{ #category : 'initialization' }
SlmdDemoAccountingMemoryDbApp class >> repositoryClass [
	"
	self createData
	"

	^ SlmdDemoMemoryRepository
]
