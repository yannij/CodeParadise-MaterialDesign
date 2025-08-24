Class {
	#name : 'SlmdDemoAccountingTransactionPresenter',
	#superclass : 'SlmdDemoObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'rendering' }
SlmdDemoAccountingTransactionPresenter >> renderDetails [
	| account company |

	self view renderModelTableClear.

	account := self model accountIn: self repositoryToUse.
	self renderDetail: (Array with: account) modelClass: SlmdDemoAccountingAccount label: 'Account'.

	company := self model companyIn: self repositoryToUse.
	self renderDetail: (Array with: company) modelClass: SlmdDemoAccountingCompany label: 'Company'.

]
