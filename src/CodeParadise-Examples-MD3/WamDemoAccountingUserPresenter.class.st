Class {
	#name : 'WamDemoAccountingUserPresenter',
	#superclass : 'WamDemoObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'rendering' }
WamDemoAccountingUserPresenter >> renderDetails [
	| companies |

	self view renderModelTableClear.

	companies := self model companiesIn: self repositoryToUse.
	self renderDetail: companies modelClass: WamDemoAccountingCompany label: 'Companies'.

]
