Class {
	#name : 'WamDemoObjectPresenter',
	#superclass : 'WamObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'rendering' }
WamDemoObjectPresenter >> renderDetail: aList modelClass: aClass label: aLabel [

	self view
		renderModelTable: (aList collect: [ :e | e asMap ]) asArray
		columns: aClass attributeNames
		title: aLabel.

]

{ #category : 'rendering' }
WamDemoObjectPresenter >> renderDetails [

]

{ #category : 'rendering' }
WamDemoObjectPresenter >> renderFields [
	| props |

	props := self model asMap.
	self view fieldsInExpansion: self model fieldsData map: props summary: 'Fields' open: true slot: #fields.

]

{ #category : 'rendering' }
WamDemoObjectPresenter >> renderView [

	self renderFields.
	self renderDetails.

]

{ #category : 'accessing' }
WamDemoObjectPresenter >> repositoryToUse [

	^ self application repository
]
