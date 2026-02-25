Class {
	#name : 'WamDemoSoilCheckpointRepository',
	#superclass : 'WamDemoSoilRepository',
	#instVars : [
		'txn'
	],
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'api' }
WamDemoSoilCheckpointRepository >> close [

	(txn notNil and: [ txn isAborted not ]) ifTrue: [
		txn abort.
		txn := nil ].

	super close
]

{ #category : 'private' }
WamDemoSoilCheckpointRepository >> list: aClass [
	| tx list |

	tx := self txnLazy.

	list := self list: aClass transaction: tx.

	^ list
]

{ #category : 'persistence' }
WamDemoSoilCheckpointRepository >> save: anObject [
	| tx |

	tx := self txnLazy.
	self save: anObject transaction: tx.
	tx commitAndContinue
]

{ #category : 'accessing' }
WamDemoSoilCheckpointRepository >> txn [

	^ txn
]

{ #category : 'accessing' }
WamDemoSoilCheckpointRepository >> txn: anObject [

	txn := anObject
]

{ #category : 'accessing' }
WamDemoSoilCheckpointRepository >> txnLazy [

	txn ifNil: [ txn := soil newTransaction ].
	^ txn
]

{ #category : 'persistence' }
WamDemoSoilCheckpointRepository >> updateData: data class: aClass [
	| tx |

	tx := self txnLazy.
	self updateData: data class: aClass transaction: tx.
	tx commitAndContinue
]
