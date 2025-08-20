Class {
	#name : 'SlmdDemoAccountingUser',
	#superclass : 'SlmdDemoObject',
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
SlmdDemoAccountingUser class >> attributeData [

	^ #(id name email locale)
]

{ #category : 'printing' }
SlmdDemoAccountingUser class >> modelName [

	^ 'User'
]

{ #category : 'accessing' }
SlmdDemoAccountingUser >> companiesIn: aRepo [
	| userCompanyList companyIdList |

	userCompanyList := aRepo
		selectMany: SlmdDemoAccountingUserCompany
		where: [ :each | each userId = self id ].

	companyIdList := (userCompanyList collect: [ :each | each companyId ]) asSet.

	^ aRepo
		selectMany: SlmdDemoAccountingCompany
		where: [ :each | companyIdList includes: each id ]
]

{ #category : 'accessing' }
SlmdDemoAccountingUser >> email [

	^ email
]

{ #category : 'accessing' }
SlmdDemoAccountingUser >> email: anObject [

	email := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingUser >> id [

	^ id
]

{ #category : 'accessing' }
SlmdDemoAccountingUser >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingUser >> locale [

	^ locale
]

{ #category : 'accessing' }
SlmdDemoAccountingUser >> locale: anObject [

	locale := anObject
]

{ #category : 'accessing' }
SlmdDemoAccountingUser >> name [

	^ name
]

{ #category : 'accessing' }
SlmdDemoAccountingUser >> name: anObject [

	name := anObject
]

{ #category : 'printing' }
SlmdDemoAccountingUser >> slmdShortSummary [

	^ self name
]
