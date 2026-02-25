Class {
	#name : 'WamDemoAccountingTransaction',
	#superclass : 'WamDemoObject',
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
WamDemoAccountingTransaction class >> attributeNames [

	^ #(number amount id companyId accountId)
]

{ #category : 'printing' }
WamDemoAccountingTransaction class >> modelName [

	^ 'Transaction'
]

{ #category : 'instance creation' }
WamDemoAccountingTransaction class >> randomOnAccount: anAccount in: aRepo [
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
WamDemoAccountingTransaction >> accountId [

	^ accountId
]

{ #category : 'accessing' }
WamDemoAccountingTransaction >> accountId: anObject [

	accountId := anObject
]

{ #category : 'accessing' }
WamDemoAccountingTransaction >> accountIn: aRepo [

	^ aRepo
		selectOne: WamDemoAccountingAccount
		where: [ :each | each id = self accountId ]
]

{ #category : 'accessing' }
WamDemoAccountingTransaction >> amount [

	^ amount
]

{ #category : 'accessing' }
WamDemoAccountingTransaction >> amount: anObject [

	amount := anObject
]

{ #category : 'accessing' }
WamDemoAccountingTransaction >> companyId [

	^ companyId
]

{ #category : 'accessing' }
WamDemoAccountingTransaction >> companyId: anObject [

	companyId := anObject
]

{ #category : 'accessing' }
WamDemoAccountingTransaction >> companyIn: aRepo [

	^ aRepo
		selectOne: WamDemoAccountingCompany
		where: [ :each | each id = self companyId ]
]

{ #category : 'accessing' }
WamDemoAccountingTransaction >> id [

	^ id
]

{ #category : 'accessing' }
WamDemoAccountingTransaction >> id: anObject [

	id := anObject
]

{ #category : 'printing' }
WamDemoAccountingTransaction >> mdPrimaryString [

	^ self summaryString
]

{ #category : 'accessing' }
WamDemoAccountingTransaction >> number [

	^ number
]

{ #category : 'accessing' }
WamDemoAccountingTransaction >> number: anObject [

	number := anObject
]
