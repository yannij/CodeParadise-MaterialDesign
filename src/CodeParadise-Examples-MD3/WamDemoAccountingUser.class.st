Class {
	#name : 'WamDemoAccountingUser',
	#superclass : 'WamDemoObject',
	#instVars : [
		'id',
		'name',
		'email',
		'locale'
	],
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'printing' }
WamDemoAccountingUser class >> attributeNames [

	^ #(id name email locale)
]

{ #category : 'printing' }
WamDemoAccountingUser class >> modelName [

	^ 'User'
]

{ #category : 'accessing' }
WamDemoAccountingUser >> companiesIn: aRepo [
	| userCompanyList companyIdList |

	userCompanyList := aRepo
		selectMany: WamDemoAccountingUserCompany
		where: [ :each | each userId = self id ].

	companyIdList := (userCompanyList collect: [ :each | each companyId ]) asSet.

	^ aRepo
		selectMany: WamDemoAccountingCompany
		where: [ :each | companyIdList includes: each id ]
]

{ #category : 'accessing' }
WamDemoAccountingUser >> email [

	^ email
]

{ #category : 'accessing' }
WamDemoAccountingUser >> email: anObject [

	email := anObject
]

{ #category : 'accessing' }
WamDemoAccountingUser >> id [

	^ id
]

{ #category : 'accessing' }
WamDemoAccountingUser >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
WamDemoAccountingUser >> locale [

	^ locale
]

{ #category : 'accessing' }
WamDemoAccountingUser >> locale: anObject [

	locale := anObject
]

{ #category : 'printing' }
WamDemoAccountingUser >> mdPrimaryString [

	^ self name
]

{ #category : 'accessing' }
WamDemoAccountingUser >> name [

	^ name
]

{ #category : 'accessing' }
WamDemoAccountingUser >> name: anObject [

	name := anObject
]
