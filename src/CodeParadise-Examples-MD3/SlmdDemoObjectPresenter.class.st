Class {
	#name : 'SlmdDemoObjectPresenter',
	#superclass : 'WamObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'rendering' }
SlmdDemoObjectPresenter >> renderDetail: aList modelClass: aClass label: aLabel [

	self view
		renderModelTable: (aList collect: [ :e | e asMap ]) asArray
		columns: aClass attributeNames
		title: aLabel.

]

{ #category : 'rendering' }
SlmdDemoObjectPresenter >> renderDetails [

]

{ #category : 'rendering' }
SlmdDemoObjectPresenter >> renderFields [
	| props |

	props := self model asMap.
	self view fieldsInExpansion: self model fieldsData map: props summary: 'Fields' open: true slot: #fields.

]

{ #category : 'rendering' }
SlmdDemoObjectPresenter >> renderView [

	self renderFields.
	self renderDetails.

]

{ #category : 'accessing' }
SlmdDemoObjectPresenter >> repositoryToUse [

	^ self application repository
]
