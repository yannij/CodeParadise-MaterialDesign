Class {
	#name : 'SlmdDemoAccountingAccount',
	#superclass : 'SlmdDemoObject',
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
SlmdDemoAccountingAccount class >> attributeNames [

	^ #(id companyId type name number currencyCode openingBalance bankName bankPhone bankAddress)
]

{ #category : 'printing' }
SlmdDemoAccountingAccount class >> modelName [

	^ 'Account'
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> bankAddress [

	^ bankAddress
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> bankAddress: anObject [

	bankAddress := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> bankName [

	^ bankName
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> bankName: anObject [

	bankName := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> bankPhone [

	^ bankPhone
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> bankPhone: anObject [

	bankPhone := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> companyId [

	^ companyId
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> companyId: anObject [

	companyId := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> companyIn: aRepo [

	^ aRepo
		selectOne: SlmdDemoAccountingCompany
		where: [ :each | each id = self companyId ]
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> currencyCode [

	^ currencyCode
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> currencyCode: anObject [

	currencyCode := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> id [

	^ id
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> id: anObject [

	id := anObject
]

{ #category : 'actions' }
SlmdDemoAccountingAccount >> makeExampleTransactions: aCount in: aRepo [

	aCount timesRepeat: [
		aRepo save: (SlmdDemoAccountingTransaction randomOnAccount: self in: aRepo) ]
]

{ #category : 'printing' }
SlmdDemoAccountingAccount >> mdPrimaryString [

	^ self name, ' ', self number asString
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> name [

	^ name
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> number [

	^ number
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> number: anObject [

	number := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> openingBalance [

	^ openingBalance
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> openingBalance: anObject [

	openingBalance := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> transactionsIn: aRepo [

	^ aRepo
		selectMany: SlmdDemoAccountingTransaction
		where: [ :each | each accountId = self id ]
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> type [

	^ type
]

{ #category : 'accessing' }
SlmdDemoAccountingAccount >> type: anObject [

	type := anObject
]
