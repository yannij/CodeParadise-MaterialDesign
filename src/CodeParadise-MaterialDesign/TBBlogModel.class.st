Class {
	#name : 'TBBlogModel',
	#superclass : 'SlmdObjectModel',
	#instVars : [
		'posts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'CodeParadise-MaterialDesign-TinyBlogApp',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'TinyBlogApp'
}

{ #category : 'initialization' }
TBBlogModel class >> createDemoPosts [
   "TBBlog createDemoPosts"
   self current 
      writeBlogPost: ((TBPostModel title: 'Welcome in TinyBlog' text: 'TinyBlog is a small blog engine made with Pharo.' category: 'TinyBlog') visible: true);
      writeBlogPost: ((TBPostModel title: 'Report Pharo Sprint' text: 'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a nice event with more than 15 motivated sprinters. With the help of candies, cakes and chocolate, huge work has been done' category: 'Pharo') visible: true);
      writeBlogPost: ((TBPostModel title: 'Brick on top of Bloc - Preview' text: 'We are happy to announce the first preview version of Brick, a new widget set created from scratch on top of Bloc. Brick is being developed primarily by Alex Syrel (together with Alain Plantec, Andrei Chis and myself), and the work is sponsored by ESUG. 
      Brick is part of the Glamorous Toolkit effort and will provide the basis for the new versions of the development tools.' category: 'Pharo') visible: true);
      writeBlogPost: ((TBPostModel title: 'The sad story of unclassified blog posts' text: 'So sad that I can read this.') visible: true);
      writeBlogPost: ((TBPostModel title: 'Working with Pharo on the Raspberry Pi' text: 'Hardware is getting cheaper and many new small devices like the famous Raspberry Pi provide new computation power that was one once only available on regular desktop computers.' category: 'Pharo') visible: true)
]

{ #category : 'accessing' }
TBBlogModel class >> current [
   "answer the instance of the TBRepository"
   ^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : 'initialization' }
TBBlogModel class >> initialize [
   self reset
]

{ #category : 'initialization' }
TBBlogModel class >> reset [
   uniqueInstance := nil
]

{ #category : 'queries' }
TBBlogModel >> allBlogPosts [
   ^ posts
]

{ #category : 'queries' }
TBBlogModel >> allBlogPostsFromCategory: aCategory [
   ^ posts select: [ :p | p category = aCategory ]
]

{ #category : 'queries' }
TBBlogModel >> allVisibleBlogPosts [
   ^ posts select: [ :p | p isVisible ]
]

{ #category : 'queries' }
TBBlogModel >> allVisibleBlogPostsFromCategory: aCategory [
	^ posts select: [ :p |
		p category = aCategory and: [ p isVisible ] ]
]

{ #category : 'initialization' }
TBBlogModel >> initialize [
   super initialize.
   posts := OrderedCollection new
]

{ #category : 'actions' }
TBBlogModel >> removeAllPosts [
   posts := OrderedCollection new
]

{ #category : 'actions' }
TBBlogModel >> removeBlogPost: aPost [

   posts remove: aPost ifAbsent: []
]

{ #category : 'actions' }
TBBlogModel >> size [
   ^ posts size
]

{ #category : 'actions' }
TBBlogModel >> writeBlogPost: aPost [
   "Add the blog post to the list of posts."
   posts add: aPost
]
