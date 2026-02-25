Class {
	#name : 'WamDemoAccountingTransactionPresenter',
	#superclass : 'WamDemoObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'rendering' }
WamDemoAccountingTransactionPresenter >> renderDetails [
	| account company |

	self view renderModelTableClear.

	account := self model accountIn: self repositoryToUse.
	self renderDetail: (Array with: account) modelClass: WamDemoAccountingAccount label: 'Account'.

	company := self model companyIn: self repositoryToUse.
	self renderDetail: (Array with: company) modelClass: WamDemoAccountingCompany label: 'Company'.

]
