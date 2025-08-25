Class {
	#name : 'SlmdDemoAccountingTransaction',
	#superclass : 'SlmdDemoObject',
	#instVars : [
		'id',
		'companyId',
		'number',
		'accountId',
		'amount'
	],
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'printing' }
SlmdDemoAccountingTransaction class >> attributeNames [

	^ #(number amount id companyId accountId)
]

{ #category : 'printing' }
SlmdDemoAccountingTransaction class >> modelName [

	^ 'Transaction'
]

{ #category : 'instance creation' }
SlmdDemoAccountingTransaction class >> randomOnAccount: anAccount in: aRepo [
	| numberOfAccountTxns |

	numberOfAccountTxns := (aRepo
		selectMany: self
		where: [ :each | each accountId = anAccount id ]) size.

	^ self new
		id: UUID versionSafeNew;
		accountId: anAccount id;
		companyId: anAccount companyId;
		amount: 1000 atRandom;
		number: numberOfAccountTxns;
		yourself
]

{ #category : 'accessing' }
SlmdDemoAccountingTransaction >> accountId [

	^ accountId
]

{ #category : 'accessing' }
SlmdDemoAccountingTransaction >> accountId: anObject [

	accountId := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingTransaction >> accountIn: aRepo [

	^ aRepo
		selectOne: SlmdDemoAccountingAccount
		where: [ :each | each id = self accountId ]
]

{ #category : 'accessing' }
SlmdDemoAccountingTransaction >> amount [

	^ amount
]

{ #category : 'accessing' }
SlmdDemoAccountingTransaction >> amount: anObject [

	amount := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingTransaction >> companyId [

	^ companyId
]

{ #category : 'accessing' }
SlmdDemoAccountingTransaction >> companyId: anObject [

	companyId := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingTransaction >> companyIn: aRepo [

	^ aRepo
		selectOne: SlmdDemoAccountingCompany
		where: [ :each | each id = self companyId ]
]

{ #category : 'accessing' }
SlmdDemoAccountingTransaction >> id [

	^ id
]

{ #category : 'accessing' }
SlmdDemoAccountingTransaction >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingTransaction >> number [

	^ number
]

{ #category : 'accessing' }
SlmdDemoAccountingTransaction >> number: anObject [

	number := anObject
]

{ #category : 'printing' }
SlmdDemoAccountingTransaction >> slmdShortSummary [

	^ self summaryString
]
