Class {
	#name : 'SlmdDemoAccountingApp',
	#superclass : 'SlmdWebApplication',
	#instVars : [
		'repository',
		'modelClass',
		'username'
	],
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'demo data' }
SlmdDemoAccountingApp class >> accountingRepository [

	^ self repositoryClass
		mapAt: self databasePath
		ifAbsent: [ (self repositoryClass onPath: self databasePath) open; yourself ]
]

{ #category : 'accessing' }
SlmdDemoAccountingApp class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { WaElement package. SlmdView package }
]

{ #category : 'demo data' }
SlmdDemoAccountingApp class >> createData [
	"Run this code only in a concrete subclass. See #repositoryClass implementors"
	| repo |

	self repositoryClass mapReset.
	self repositoryClass mapCreateAt: self databasePath.

	repo := self accountingRepository.
	self createDemoUsersIn: repo.
	self createDemoCompaniesIn: repo.
	self createDemoAccountsIn: repo.
	self createDemoUserCompaniesIn: repo.
	self createDemoTransactionsIn: repo
]

{ #category : 'demo data' }
SlmdDemoAccountingApp class >> createDemoAccountsIn: aRepository [
	| modelClass |

	modelClass := SlmdDemoAccountingAccount.
	aRepository removeAll: modelClass.

	#(
	(1 1 'regular' 'Test Account-1-1' '22C-001' 'CDN' 1000.00 'TD Bank')
	(2 1 'regular' 'Test Account-1-2' '22C-002' 'CDN' 1100.00 'TD Bank')
	(3 1 'regular' 'Test Account-1-3' '22U-001' 'USD' 1200.00 'TD Bank')
	(4 1 'regular' 'CB-1' '7777-001' 'CDN' 1000.00 'CIBC')
	(5 1 'regular' 'CB-1' '7777-002' 'CDN' 1000.00 'CIBC')
	(6 1 'regular' 'CB-1' '7777-003' 'CDN' 1000.00 'CIBC')
	(7 1 'regular' 'CB-1' '7777-004' 'CDN' 1000.00 'CIBC')
	(8 1 'regular' 'CB-1' '7777-005' 'CDN' 1000.00 'CIBC')
	(9 1 'regular' 'CB-1' '7777-006' 'CDN' 1000.00 'CIBC')
	(10 1 'regular' 'CB-1' '7777-007' 'CDN' 1000.00 'CIBC')
	(11 2 'regular' 'Test Account-2' '5555-001' 'USD' 2000.00 'CIBC')
	(12 3 'non-profit' 'Test Account-3' 'RB-1234-001' 'CDN' 3000.00 'Royal Bank')
	) do: [ :data | | newObject |
		newObject := modelClass new
			id: (data at: 1);
			companyId: (data at: 2);
			type: (data at: 3);
			name: (data at: 4);
			number: (data at: 5);
			currencyCode: (data at: 6);
			openingBalance: (data at: 7);
			bankName: (data at: 8);
			yourself.
		aRepository save: newObject ]
]

{ #category : 'demo data' }
SlmdDemoAccountingApp class >> createDemoCompaniesIn: aRepository [
	| modelClass |

	modelClass := SlmdDemoAccountingCompany.
	aRepository removeAll: modelClass.

	#(
	(1 'Test Company-1' 'www.company1.biz' '' 'BIZ-0001' 'CA' 'CAD')
	(2 'Test Company-2' 'www.company2.biz' '' 'BIZ-0002' 'CA' 'USD')
	(3 'Test Company-3' 'www.company3.org' '' 'ORG-0001' 'CA' 'CAD')
	(4 'Test Company-4' 'www.company4.org' '' 'ORG-0002' 'CA' 'CAD')
	) do: [ :data | | newObject |
		newObject := modelClass new
			id: (data at: 1);
			name: (data at: 2);
			website: (data at: 3);
			email: (data at: 4);
			taxNumber: (data at: 5);
			country: (data at: 6);
			currency: (data at: 7);
			yourself.
		aRepository save: newObject ]
]

{ #category : 'demo data' }
SlmdDemoAccountingApp class >> createDemoTransactionsIn: aRepository [
	| modelClass all account |

	modelClass := SlmdDemoAccountingTransaction.
	aRepository removeAll: modelClass.

	all := aRepository selectMany: SlmdDemoAccountingAccount where: [ :each | each name = 'Test Account-1-1' ].
	account := all asOrderedCollection first.
	3 timesRepeat: [ | newObject |
		newObject := modelClass randomOnAccount: account in: aRepository.
		aRepository save: newObject ]
]

{ #category : 'demo data' }
SlmdDemoAccountingApp class >> createDemoUserCompaniesIn: aRepository [
	| modelClass |

	modelClass := SlmdDemoAccountingUserCompany.
	aRepository removeAll: modelClass.

	#(
	(1 1)
	(1 2)
	(1 3)
	(1 4)
	(2 2)
	) do: [ :data | | newObject |
		newObject := modelClass new
			id: UUID versionSafeNew;
			userId: (data at: 1);
			companyId: (data at: 2);
			yourself.
		aRepository save: newObject ]
]

{ #category : 'demo data' }
SlmdDemoAccountingApp class >> createDemoUsersIn: aRepository [
	| modelClass |

	modelClass := SlmdDemoAccountingUser.
	aRepository removeAll: modelClass.

	#(
	(1 'Test User1' 'tu1@test.co' 'en_ca')
	(2 'Test User2' 'tu2@test.co' 'en_ca')
	(3 'Test User3' 'tu3@test.co' 'en_ca')
	(4 'Test User4' 'tu4@test.co' 'en_ca')
	(5 'Test User5' 'tu5@test.co' 'en_ca')
	(6 'Test User6' 'tu6@test.co' 'en_ca')
	(7 'Test User7' 'tu7@test.co' 'en_ca')
	(8 'Test User8' 'tu8@test.co' 'en_ca')
	) do: [ :data | | newObject |
		newObject := modelClass new
			"id name email locale"
			id: data first;
			name: data second;
			email: data third;
			locale: data fourth;
			yourself.
		aRepository save: newObject ]
]

{ #category : 'demo data' }
SlmdDemoAccountingApp class >> databasePath [

	^ 'demo-acct'
]

{ #category : 'demo data' }
SlmdDemoAccountingApp class >> repositoryClass [

	self subclassResponsibility
]

{ #category : 'model' }
SlmdDemoAccountingApp >> allModels [

	^ self repository selectAll: self modelClass

]

{ #category : 'presenter' }
SlmdDemoAccountingApp >> applicationPresenterClass [

	^ SlmdDemoAccountingAppPresenter
]

{ #category : 'accessing' }
SlmdDemoAccountingApp >> applicationTitle [

	^ 'Accounting'
]

{ #category : 'accessing' }
SlmdDemoAccountingApp >> clientBehaviorClass [

	^ SlmdDemoAccountingAppClientBehavior
]

{ #category : 'actions - toolbar' }
SlmdDemoAccountingApp >> doLogout [

	self traceCr: 'doLogout'.
	self username: nil.

]

{ #category : 'events' }
SlmdDemoAccountingApp >> handleLoginRequested: anObject [

	self traceCr: 'handleLoginRequested:'.
	self username: 'foobar'.

]

{ #category : 'initialization' }
SlmdDemoAccountingApp >> initialize [
	| pane1Model pane2Model pane1Content |

	super initialize.

	self repositorySetup.

	modelClass := SlmdDemoAccountingCompany.
	pane1Content := SlmdListDetailModel new.
	pane1Content listSet: self allModels.
	pane1Model := SlmdPaneModel on: pane1Content.
	pane2Model := SlmdPaneModel new.
	pane2Model appBarModel beSecondary; actionGroupToUse: #toolbar.
	"layout := SlmdResponsiveLayoutModel new."
	layout paneLayout pane1: pane1Model.
	layout paneLayout pane2: pane2Model.
	layout layoutSettings colorThemeName: #green; fontFamily: #'serif'.
	self setUpAppBar2.
	self setDetailWithIndex: 1.

]

{ #category : 'model' }
SlmdDemoAccountingApp >> modelAdd: aModel [

	self repository save: aModel
]

{ #category : 'accessing' }
SlmdDemoAccountingApp >> modelClass [

	^ modelClass
]

{ #category : 'accessing' }
SlmdDemoAccountingApp >> modelClass: anObject [

	modelClass := anObject
]

{ #category : 'model' }
SlmdDemoAccountingApp >> modelRemove: aModel [

	self repository remove: aModel
]

{ #category : 'model' }
SlmdDemoAccountingApp >> modelUpdate: aModel [

	self repository save: aModel
]

{ #category : 'accessing' }
SlmdDemoAccountingApp >> navItemsToUse [ 

	^ OrderedCollection new
		add: (self nativeEventSpecAt: #settingsOpen);
		add: (self nativeEventSpecAt: #login);
		add: (self nativeEventSpecAt: #logout);
		addAll: super navItemsToUse;
		yourself.
]

{ #category : 'events' }
SlmdDemoAccountingApp >> navTo: data [

	data = #company ifTrue: [
		modelClass := SlmdDemoAccountingCompany ].
	data = #account ifTrue: [
		modelClass := SlmdDemoAccountingAccount ].
	data = #transactions ifTrue: [
		modelClass := SlmdDemoAccountingTransaction ].
	data = #user ifTrue: [
		modelClass := SlmdDemoAccountingUser ].

	self layout pane1 paneContent listSet: self allModels.
	self setDetailWithIndex: 1.

]

{ #category : 'accessing' }
SlmdDemoAccountingApp >> repository [

	^ repository
]

{ #category : 'accessing' }
SlmdDemoAccountingApp >> repository: anObject [

	repository := anObject
]

{ #category : 'initialization' }
SlmdDemoAccountingApp >> repositorySetup [

	self repository: self class accountingRepository
]

{ #category : 'initialization' }
SlmdDemoAccountingApp >> setUpAppBar2 [

	self layout pane2 appBarModel
		actionItemsAdd: (self nativeEventSpecAt: #delete);
		actionItemsAdd: (self nativeEventSpecAt: #update);
		yourself.

]

{ #category : 'events' }
SlmdDemoAccountingApp >> setUpCustomEvents [

	super setUpCustomEvents.

	self
		addNavSubtype: #navTo groupTag: #primary iconName: 'suit-club' iconLabel: 'Users' data: #user;
		addNavSubtype: #navTo groupTag: #primary iconName: 'suit-club' iconLabel: 'Companies' data: #company;
		addNavSubtype: #navTo groupTag: #primary iconName: 'suit-club' iconLabel: 'Accounts' data: #account;
		addNavSubtype: #navTo groupTag: #primary iconName: 'suit-club' iconLabel: 'Transactions' data: #transactions;
		yourself.

]

{ #category : 'accessing' }
SlmdDemoAccountingApp >> username [

	^ username
]

{ #category : 'accessing' }
SlmdDemoAccountingApp >> username: anObject [

	username := anObject
]
