Class {
	#name : 'SlmdDemoSoilCheckpointRepository',
	#superclass : 'SlmdDemoSoilRepository',
	#instVars : [
		'txn'
	],
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'api' }
SlmdDemoSoilCheckpointRepository >> close [

	(txn notNil and: [ txn isAborted not ]) ifTrue: [
		txn abort.
		txn := nil ].

	super close
]

{ #category : 'private' }
SlmdDemoSoilCheckpointRepository >> list: aClass [
	| tx list |

	tx := self txnLazy.

	list := self list: aClass transaction: tx.

	^ list
]

{ #category : 'persistence' }
SlmdDemoSoilCheckpointRepository >> save: anObject [
	| tx |

	tx := self txnLazy.
	self save: anObject transaction: tx.
	tx commitAndContinue
]

{ #category : 'accessing' }
SlmdDemoSoilCheckpointRepository >> txn [

	^ txn
]

{ #category : 'accessing' }
SlmdDemoSoilCheckpointRepository >> txn: anObject [

	txn := anObject
]

{ #category : 'accessing' }
SlmdDemoSoilCheckpointRepository >> txnLazy [

	txn ifNil: [ txn := soil newTransaction ].
	^ txn
]

{ #category : 'persistence' }
SlmdDemoSoilCheckpointRepository >> updateData: data class: aClass [
	| tx |

	tx := self txnLazy.
	self updateData: data class: aClass transaction: tx.
	tx commitAndContinue
]
