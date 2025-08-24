Class {
	#name : 'TBPostView',
	#superclass : 'SlmdObjectView',
	#category : 'CodeParadise-MaterialDesign-TinyBlogApp',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'TinyBlogApp'
}

{ #category : 'rendering' }
TBPostView >> fieldsSetUp: props [
	| card |

	fieldElements := OrderedDictionary new.
	card := #div asHtmlTag
		addClass: 'slmd-fields';
		appendChild: (self fieldAt: 'title' label: 'Title' text: (props at: 'title'));
		appendChild: (self fieldAt: 'text' label: 'Text' textarea: (props at: 'text'));
		appendChild: (self fieldAt: 'date' label: 'Date' text: (props at: 'date'));
		appendChild: (self fieldAt: 'category' label: 'Category' text: (props at: 'category'));
		appendChild: (self fieldAt: 'visible' label: 'Visible' switch: (props at: 'visible'));
		yourself.

	self replaceAllChildrenWith: card atSlotNamed: 'card'.

]
