Class {
	#name : 'SlmdDemoAccountingCompanyPresenter',
	#superclass : 'SlmdDemoObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'rendering' }
SlmdDemoAccountingCompanyPresenter >> renderDetails [
	| accounts users |

	self view renderModelTableClear.

	accounts := self model accountsIn: self repositoryToUse.
	self renderDetail: accounts modelClass: SlmdDemoAccountingAccount label: 'Accounts'.

	users := self model usersIn: self repositoryToUse.
	self renderDetail: users modelClass: SlmdDemoAccountingUser label: 'Users'.

]
