Class {
	#name : 'SlmdNavAbstractView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-Nav',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Nav'
}

{ #category : 'web resources' }
SlmdNavAbstractView class >> globalStyle [
	<webResource: #css>

	^ '
.smd-nav-font {
  line-height: var(--wa-line-height-normal);
  font-size: var(--wa-font-size-medium);
  font-weight: var(--wa-font-weight-bold);
}

.smd-navrail-item {
  display: flex;
  flex-flow: column;
  height: 56px;
  width: 96px;
  background: var(--wa-color-brand-70);
}

.smd-navrail-icon {
  font-size: 24px;
  line-height: 28px;
  padding-left: 33px;
  padding-top: 4px;
}

.smd-navrail-labelText {
  height: 24px;
  line-height: 18px;
  font-size: 14px;
  text-align: center;
  overflow-x: clip;
}

.smd-navsubmenu-item {
  display: flex;
  height: 56px;
  width: 220px;
  background: var(--wa-color-brand-70);
  align-items: center;
}

.smd-navsubmenu-icon {
  padding-left: 8px;
  font-size: 24px;
}

.smd-navsubmenu-labelText {
  padding-left: 16px;
  font-size: 16px;
}
'
]

{ #category : 'rendering' }
SlmdNavAbstractView >> divExpanded: aNavAction [

	^ #div asHtmlTag
		addClass: 'smd-navrailx-item'; addClass: 'smd-nav-font';
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrailx-icon';
				appendChild: ((WaIcon fullyNamed: (aNavAction at: #iconName)) label: (aNavAction at: #iconLabel); yourself);
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrailx-labelText';
				textContent: (aNavAction at: #iconLabel);
				yourself);
		yourself
]

{ #category : 'rendering' }
SlmdNavAbstractView >> divNarrow: aNavAction [

	^ #div asHtmlTag
		addClass: 'smd-navrail-item';
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-icon';
				appendChild: ((WaIcon fullyNamed: (aNavAction at: #iconName)) label: (aNavAction at: #iconLabel); yourself);
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-labelText';
				textContent: (aNavAction at: #iconLabel);
				yourself);
		yourself.

]

{ #category : 'actions' }
SlmdNavAbstractView >> triggerNavEvent: aNavAction [

	super triggerNavEvent: aNavAction.

	self layoutViewLazy hideNavModal.
]
