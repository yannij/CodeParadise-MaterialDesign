Class {
	#name : 'SlmdDemoAccountingUserPresenter',
	#superclass : 'SlmdDemoObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'rendering' }
SlmdDemoAccountingUserPresenter >> renderDetails [
	| companies |

	self view renderModelTableClear.

	companies := self model companiesIn: self repositoryToUse.
	self renderDetail: companies modelClass: SlmdDemoAccountingCompany label: 'Companies'.

]
