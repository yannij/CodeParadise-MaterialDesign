Class {
	#name : 'SlmdDemoObjectPresenter',
	#superclass : 'SlmdObjectPresenter',
	#category : 'CodeParadise-Examples-MD3-Common',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Common'
}

{ #category : 'rendering' }
SlmdDemoObjectPresenter >> renderDetail: aList modelClass: aClass label: aLabel [

	self view
		renderModelTable: (aList collect: [ :e | e asMap ]) asArray
		columns: aClass attributeData
		title: aLabel.

]

{ #category : 'rendering' }
SlmdDemoObjectPresenter >> renderDetails [

]

{ #category : 'rendering' }
SlmdDemoObjectPresenter >> renderFields [
	| props |

	props := self model asMap.
	self view fields: self model attributeData map: props.

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
