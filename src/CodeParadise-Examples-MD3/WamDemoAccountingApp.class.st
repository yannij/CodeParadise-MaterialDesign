Class {
	#name : 'WamDemoAccountingApp',
	#superclass : 'WamWebApplication',
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
WamDemoAccountingApp class >> accountingRepository [

	^ self repositoryClass
		mapAt: self databasePath
		ifAbsent: [ (self repositoryClass onPath: self databasePath) open; yourself ]
]

{ #category : 'accessing' }
WamDemoAccountingApp class >> allowedPackages [

	"Answer a collection of Packages which are allowed to contain classes to install in the receiver.

	Add package with SlElement class for the Shoelace components.

	See comment in superclass."

	^ super allowedPackages, { WaElement package. WamView package }
]

{ #category : 'demo data' }
WamDemoAccountingApp class >> createData [
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
WamDemoAccountingApp class >> createDemoAccountsIn: aRepository [
	| modelClass |

	modelClass := WamDemoAccountingAccount.
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
WamDemoAccountingApp class >> createDemoCompaniesIn: aRepository [
	| modelClass |

	modelClass := WamDemoAccountingCompany.
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
WamDemoAccountingApp class >> createDemoTransactionsIn: aRepository [
	| modelClass all account |

	modelClass := WamDemoAccountingTransaction.
	aRepository removeAll: modelClass.

	all := aRepository selectMany: WamDemoAccountingAccount where: [ :each | each name = 'Test Account-1-1' ].
	account := all asOrderedCollection first.
	3 timesRepeat: [ | newObject |
		newObject := modelClass randomOnAccount: account in: aRepository.
		aRepository save: newObject ]
]

{ #category : 'demo data' }
WamDemoAccountingApp class >> createDemoUserCompaniesIn: aRepository [
	| modelClass |

	modelClass := WamDemoAccountingUserCompany.
	aRepository removeAll: modelClass.

	#(
	(1 1)
	(1 2)
	(1 3)
	(1 4)
	(2 2)
	) do: [ :data | | newObject |
		newObject := modelClass new
			id: UUID new;
			userId: (data at: 1);
			companyId: (data at: 2);
			yourself.
		aRepository save: newObject ]
]

{ #category : 'demo data' }
WamDemoAccountingApp class >> createDemoUsersIn: aRepository [
	| modelClass |

	modelClass := WamDemoAccountingUser.
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
WamDemoAccountingApp class >> databasePath [

	^ 'demo-acct'
]

{ #category : 'demo data' }
WamDemoAccountingApp class >> repositoryClass [

	self subclassResponsibility
]

{ #category : 'model' }
WamDemoAccountingApp >> allModels [

	^ self repository selectAll: self modelClass

]

{ #category : 'presenter' }
WamDemoAccountingApp >> applicationPresenterClass [

	^ WamDemoAccountingAppPresenter
]

{ #category : 'accessing' }
WamDemoAccountingApp >> applicationTitle [

	^ 'Accounting'
]

{ #category : 'accessing' }
WamDemoAccountingApp >> clientBehaviorClass [

	^ WamDemoAccountingAppClientBehavior
]

{ #category : 'actions - toolbar' }
WamDemoAccountingApp >> doLogout [

	self systemLog logTrace: 'doLogout'.
	self username: nil.

]

{ #category : 'events' }
WamDemoAccountingApp >> handleLoginRequested: anObject [

	self systemLog logTrace: 'handleLoginRequested:'.
	self username: 'foobar'.

]

{ #category : 'initialization' }
WamDemoAccountingApp >> initialize [
	| pane1Model pane2Model pane1Content |

	super initialize.

	self repositorySetup.

	modelClass := WamDemoAccountingCompany.
	pane1Content := WamListModel new.
	pane1Content listSet: self allModels.
	pane1Model := WamPaneModel on: pane1Content.
	pane2Model := WamPaneModel new.
	pane2Model appBarModel beSecondary; actionGroupToUse: #toolbar.
	"layout := WamResponsiveLayoutModel new."
	layout paneLayout pane1: pane1Model.
	layout paneLayout pane2: pane2Model.
	layout layoutSettings colorThemeName: #green; fontFamily: #'serif'.
	self setUpAppBar2.

]

{ #category : 'model' }
WamDemoAccountingApp >> modelAdd: aModel [

	self repository save: aModel.
	^ true
]

{ #category : 'accessing' }
WamDemoAccountingApp >> modelClass [

	^ modelClass
]

{ #category : 'accessing' }
WamDemoAccountingApp >> modelClass: anObject [

	modelClass := anObject
]

{ #category : 'model' }
WamDemoAccountingApp >> modelRemove: aModel [

	self repository remove: aModel
]

{ #category : 'model' }
WamDemoAccountingApp >> modelUpdate: aModel [

	self repository save: aModel
]

{ #category : 'accessing' }
WamDemoAccountingApp >> navItemsToUse [ 

	^ OrderedCollection new
		add: (self nativeEventSpecAt: #login);
		add: (self nativeEventSpecAt: #logout);
		addAll: super navItemsToUse;
		yourself.
]

{ #category : 'events' }
WamDemoAccountingApp >> navTo: aNavActionEvent [
	| data |

	data := aNavActionEvent data.

	data = #company ifTrue: [
		modelClass := WamDemoAccountingCompany ].
	data = #account ifTrue: [
		modelClass := WamDemoAccountingAccount ].
	data = #transactions ifTrue: [
		modelClass := WamDemoAccountingTransaction ].
	data = #user ifTrue: [
		modelClass := WamDemoAccountingUser ].

	self layout pane1 paneContent listSet: self allModels.
	self listDetailReset.

]

{ #category : 'accessing' }
WamDemoAccountingApp >> repository [

	^ repository
]

{ #category : 'accessing' }
WamDemoAccountingApp >> repository: anObject [

	repository := anObject
]

{ #category : 'initialization' }
WamDemoAccountingApp >> repositorySetup [

	self repository: self class accountingRepository
]

{ #category : 'initialization' }
WamDemoAccountingApp >> setUpAppBar2 [

	self layout pane2 appBarModel
		navActionItemsAdd: (self nativeEventSpecAt: #delete);
		navActionItemsAdd: (self nativeEventSpecAt: #update);
		yourself.

]

{ #category : 'events' }
WamDemoAccountingApp >> setUpCustomEvents [

	super setUpCustomEvents.

	self
		addNavActionAt: #navTo groupTag: #primary iconName: 'suit-club' iconLabel: 'Users' data: #user;
		addNavActionAt: #navTo groupTag: #primary iconName: 'suit-club' iconLabel: 'Companies' data: #company;
		addNavActionAt: #navTo groupTag: #primary iconName: 'suit-club' iconLabel: 'Accounts' data: #account;
		addNavActionAt: #navTo groupTag: #primary iconName: 'suit-club' iconLabel: 'Transactions' data: #transactions;
		yourself.

]

{ #category : 'accessing' }
WamDemoAccountingApp >> username [

	^ username
]

{ #category : 'accessing' }
WamDemoAccountingApp >> username: anObject [

	username := anObject
]
