Class {
	#name : 'WamDemoAccountingAccount',
	#superclass : 'WamDemoObject',
	#instVars : [
		'id',
		'companyId',
		'type',
		'name',
		'number',
		'currencyCode',
		'openingBalance',
		'bankName',
		'bankPhone',
		'bankAddress'
	],
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'printing' }
WamDemoAccountingAccount class >> attributeNames [

	^ #(id companyId type name number currencyCode openingBalance bankName bankPhone bankAddress)
]

{ #category : 'printing' }
WamDemoAccountingAccount class >> modelName [

	^ 'Account'
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> bankAddress [

	^ bankAddress
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> bankAddress: anObject [

	bankAddress := anObject
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> bankName [

	^ bankName
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> bankName: anObject [

	bankName := anObject
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> bankPhone [

	^ bankPhone
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> bankPhone: anObject [

	bankPhone := anObject
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> companyId [

	^ companyId
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> companyId: anObject [

	companyId := anObject
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> companyIn: aRepo [

	^ aRepo
		selectOne: WamDemoAccountingCompany
		where: [ :each | each id = self companyId ]
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> currencyCode [

	^ currencyCode
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> currencyCode: anObject [

	currencyCode := anObject
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> id [

	^ id
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> id: anObject [

	id := anObject
]

{ #category : 'actions' }
WamDemoAccountingAccount >> makeExampleTransactions: aCount in: aRepo [

	aCount timesRepeat: [
		aRepo save: (WamDemoAccountingTransaction randomOnAccount: self in: aRepo) ]
]

{ #category : 'printing' }
WamDemoAccountingAccount >> mdPrimaryString [

	^ self name, ' ', self number asString
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> name [

	^ name
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> number [

	^ number
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> number: anObject [

	number := anObject
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> openingBalance [

	^ openingBalance
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> openingBalance: anObject [

	openingBalance := anObject
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> transactionsIn: aRepo [

	^ aRepo
		selectMany: WamDemoAccountingTransaction
		where: [ :each | each accountId = self id ]
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> type [

	^ type
]

{ #category : 'accessing' }
WamDemoAccountingAccount >> type: anObject [

	type := anObject
]
