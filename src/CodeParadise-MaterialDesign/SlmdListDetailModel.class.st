Class {
	#name : 'SlmdListDetailModel',
	#superclass : 'SlmdModel',
	#instVars : [
		'list',
		'detail'
	],
	#category : 'CodeParadise-MaterialDesign-ShoelaceListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceListDetail'
}

{ #category : 'accessing' }
SlmdListDetailModel >> detail [

	^ detail
]

{ #category : 'accessing' }
SlmdListDetailModel >> detail: anObject [

	detail := anObject
]

{ #category : 'accessing' }
SlmdListDetailModel >> list [

	^ list
]

{ #category : 'accessing' }
SlmdListDetailModel >> list: anObject [

	list := anObject
]

{ #category : 'accessing' }
SlmdListDetailModel >> listAdd: aWrappedModel [

	TBBlogModel current writeBlogPost: detail wrappedModel.
	self listSet: TBBlogModel current allBlogPosts.

]

{ #category : 'accessing' }
SlmdListDetailModel >> listRemove: aModel [

	TBBlogModel current removeBlogPost: aModel.
	self listSet: TBBlogModel current allBlogPosts.

]

{ #category : 'accessing' }
SlmdListDetailModel >> listSet: aCollection [

	list := OrderedCollection new.
	aCollection withIndexDo: [ :each :index |
		list add: (SlmdItemWrapperModel on: each atIndex: index) ].
	self valueChanged.

]

{ #category : 'accessing' }
SlmdListDetailModel >> removeDetail [

	self listRemove: detail wrappedModel.

]
