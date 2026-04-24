Class {
	#name : 'WamNavActionDialogView',
	#superclass : 'WamNavActionAbstractView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'rendering' }
WamNavActionDialogView >> dialogBuildItem: aNavAction [
	| iconName |

	iconName := aNavAction at: #iconName.

	^ #div asHtmlTag
		addClass: 'wam-navbar-item';
		addClass: 'wam-navbar-font';
		when: CpClickEvent basicPrimary do: [ self triggerNavEvent: aNavAction ] for: self;
		appendChild: (#div asHtmlTag
			addClass: 'wam-navbar-icon';
			appendChild: ((WaIcon fullyNamed: iconName) label: iconName; yourself);
			yourself);
		appendChild: (#div asHtmlTag
			addClass: 'wam-navbar-labelText';
			addClass: 'wa-text-truncate';
			textContent: (aNavAction at: #iconLabel);
			yourself);
		yourself

]

{ #category : 'rendering' }
WamNavActionDialogView >> renderDialogItem: aNavAction [
	| element |

	element := self dialogBuildItem: aNavAction.
	self replaceAllChildrenWith: element atSlotNamed: nil.

]

{ #category : 'rendering' }
WamNavActionDialogView >> triggerNavEvent: aNavAction [

	self brandDialogClose.
	super triggerNavEvent: aNavAction.

]
