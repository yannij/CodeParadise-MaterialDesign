Class {
	#name : 'SlmdDemoAccountingCompany',
	#superclass : 'SlmdDemoObject',
	#instVars : [
		'id',
		'name',
		'website',
		'email',
		'taxNumber',
		'country',
		'currency'
	],
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'printing' }
SlmdDemoAccountingCompany class >> attributeNames [

	^ #(id name website email taxNumber country currency)
]

{ #category : 'printing' }
SlmdDemoAccountingCompany class >> modelName [

	^ 'Company'
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> accountsIn: aRepo [

	^ aRepo
		selectMany: SlmdDemoAccountingAccount
		where: [ :each | each companyId = self id ]
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> country [

	^ country
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> country: anObject [

	country := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> currency [

	^ currency
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> currency: anObject [

	currency := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> email [

	^ email
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> email: anObject [

	email := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> id [

	^ id
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> name [

	^ name
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> slmdShortSummary [

	^ self name
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> taxNumber [

	^ taxNumber
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> taxNumber: anObject [

	taxNumber := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> usersIn: aRepo [
	| userCompanyList userIdList |

	userCompanyList := aRepo 
		selectMany: SlmdDemoAccountingUserCompany
		where: [ :each | each companyId = self id ].

	userIdList := (userCompanyList collect: [ :each | each userId ]) asSet.

	^ aRepo
		selectMany: SlmdDemoAccountingUser
		where: [ :each | userIdList includes: each id ]
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> website [

	^ website
]

{ #category : 'accessing' }
SlmdDemoAccountingCompany >> website: anObject [

	website := anObject
]
