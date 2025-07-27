Class {
	#name : 'TBPostModel',
	#superclass : 'SlmdObjectModel',
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : 'CodeParadise-MaterialDesign-TinyBlogApp',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'TinyBlogApp'
}

{ #category : 'instance creation' }
TBPostModel class >> title: aTitle text: aText [
   ^ self new
        title: aTitle;
        text: aText;
        yourself
]

{ #category : 'instance creation' }
TBPostModel class >> title: aTitle text: aText category: aCategory [
   ^ (self title: aTitle text: aText)
            category: aCategory;
            yourself
]

{ #category : 'accessing' }
TBPostModel class >> unclassifiedTag [
   ^ 'Unclassified'
]

{ #category : 'rendering' }
TBPostModel >> applyChanges: changes [
	| post |

	post := self.

	changes at: 'title' ifPresent: [ :value | post title: value ].
	changes at: 'text' ifPresent: [ :value | post text: value ].
	"changes at: 'date' ifPresent: [ :value | post date: value ]."
	changes at: 'category' ifPresent: [ :value | post category: value ].
	changes at: 'visible' ifPresent: [ :value | post visible: value ].
	post valueChanged.
	"self application pane1Model paneContent valueChanged."

]

{ #category : 'converting' }
TBPostModel >> asProperties [

	^ Dictionary new
		at: 'title' put: self title;
		at: 'text' put: self text;
		at: 'date' put: self date asString;
		at: 'category' put: self category;
		at: 'visible' put: self visible;
		yourself
]

{ #category : 'blinking' }
TBPostModel >> beVisible [
   self visible: true
]

{ #category : 'accessing' }
TBPostModel >> category [

	^ category
]

{ #category : 'accessing' }
TBPostModel >> category: anObject [

	category := anObject
]

{ #category : 'accessing' }
TBPostModel >> date [

	^ date
]

{ #category : 'accessing' }
TBPostModel >> date: anObject [

	date := anObject
]

{ #category : 'initialization' }
TBPostModel >> initialize [

	super initialize.

	self category: self class unclassifiedTag.
	self date: Date today.
	self notVisible.

]

{ #category : 'testing' }
TBPostModel >> isUnclassified [
   ^ self category = self class unclassifiedTag
]

{ #category : 'testing' }
TBPostModel >> isVisible [
   ^ self visible
]

{ #category : 'blinking' }
TBPostModel >> notVisible [
   self visible: false
]

{ #category : 'accessing' }
TBPostModel >> text [

	^ text
]

{ #category : 'accessing' }
TBPostModel >> text: anObject [

	text := anObject
]

{ #category : 'accessing' }
TBPostModel >> title [

	^ title
]

{ #category : 'accessing' }
TBPostModel >> title: anObject [

	title := anObject
]

{ #category : 'accessing' }
TBPostModel >> visible [

	^ visible
]

{ #category : 'accessing' }
TBPostModel >> visible: anObject [

	visible := anObject
]
