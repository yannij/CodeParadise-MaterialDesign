Class {
	#name : 'WamDemoAccountingCompany',
	#superclass : 'WamDemoObject',
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
WamDemoAccountingCompany class >> attributeNames [

	^ #(id name website email taxNumber country currency)
]

{ #category : 'printing' }
WamDemoAccountingCompany class >> modelName [

	^ 'Company'
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> accountsIn: aRepo [

	^ aRepo
		selectMany: WamDemoAccountingAccount
		where: [ :each | each companyId = self id ]
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> country [

	^ country
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> country: anObject [

	country := anObject
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> currency [

	^ currency
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> currency: anObject [

	currency := anObject
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> email [

	^ email
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> email: anObject [

	email := anObject
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> id [

	^ id
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> mdPrimaryString [

	^ self name
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> name [

	^ name
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> taxNumber [

	^ taxNumber
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> taxNumber: anObject [

	taxNumber := anObject
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> usersIn: aRepo [
	| userCompanyList userIdList |

	userCompanyList := aRepo 
		selectMany: WamDemoAccountingUserCompany
		where: [ :each | each companyId = self id ].

	userIdList := (userCompanyList collect: [ :each | each userId ]) asSet.

	^ aRepo
		selectMany: WamDemoAccountingUser
		where: [ :each | userIdList includes: each id ]
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> website [

	^ website
]

{ #category : 'accessing' }
WamDemoAccountingCompany >> website: anObject [

	website := anObject
]
