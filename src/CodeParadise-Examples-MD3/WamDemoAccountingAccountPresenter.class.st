Class {
	#name : 'WamDemoAccountingAccountPresenter',
	#superclass : 'WamDemoObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'rendering' }
WamDemoAccountingAccountPresenter >> renderDetails [
	| company transactions |

	self view renderModelTableClear.

	company := self model companyIn: self repositoryToUse.
	self renderDetail: (Array with: company) modelClass: WamDemoAccountingCompany label: 'Company'.

	transactions := self model transactionsIn: self repositoryToUse.
	self renderDetail: transactions modelClass: WamDemoAccountingTransaction label: 'Transactions'.

]
