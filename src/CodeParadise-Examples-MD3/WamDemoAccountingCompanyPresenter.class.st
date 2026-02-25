Class {
	#name : 'WamDemoAccountingCompanyPresenter',
	#superclass : 'WamDemoObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'rendering' }
WamDemoAccountingCompanyPresenter >> renderDetails [
	| accounts users |

	self view renderModelTableClear.

	accounts := self model accountsIn: self repositoryToUse.
	self renderDetail: accounts modelClass: WamDemoAccountingAccount label: 'Accounts'.

	users := self model usersIn: self repositoryToUse.
	self renderDetail: users modelClass: WamDemoAccountingUser label: 'Users'.

]
