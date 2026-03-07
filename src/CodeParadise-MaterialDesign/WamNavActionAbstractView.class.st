Class {
	#name : 'WamNavActionAbstractView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-NavAction',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'NavAction'
}

{ #category : 'web resources' }
WamNavActionAbstractView class >> globalStyle [
	<webResource: #css>

	^ '
.wam-nav-font {
  line-height: var(--wa-line-height-normal);
  font-size: var(--wa-font-size-medium);
  font-weight: var(--wa-font-weight-bold);
}

.wam-navrail-item {
  display: flex;
  flex-flow: column;
  height: 56px;
  width: 96px;
  background: var(--wa-color-brand-fill-normal);
}

.wam-navrail-item:hover {
  background: var(--wa-color-brand-fill-light);
}

.wam-navrail-icon {
  font-size: 24px;
  line-height: 28px;
  padding-left: 33px;
  padding-top: 4px;
}

.wam-navrail-labelText {
  height: 24px;
  line-height: 18px;
  font-size: 14px;
  text-align: center;
  overflow-x: clip;
}

.wam-navsubmenu-item {
  display: flex;
  height: 56px;
  width: 220px;
  background: var(--wa-color-brand-fill-quiet);
  align-items: center;
}

.wam-navsubmenu-icon {
  padding-left: 8px;
  font-size: 24px;
}

.wam-navsubmenu-labelText {
  padding-left: 16px;
  font-size: 16px;
}
'
]

{ #category : 'rendering' }
WamNavActionAbstractView >> divExpanded: aNavAction [

	^ #div asHtmlTag
		addClass: 'wam-navrailx-item'; addClass: 'wam-nav-font';
		when: CpClickEvent basicPrimary do: [ self triggerNavEvent: aNavAction ] for: self;
		appendChild: (
			#div asHtmlTag
				addClass: 'wam-navrailx-icon';
				appendChild: ((WaIcon fullyNamed: (aNavAction at: #iconName)) label: (aNavAction at: #iconLabel); yourself);
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'wam-navrailx-labelText';
				addClass: 'wa-text-truncate';
				styleAt: 'max-width' put: '170px';
				textContent: (aNavAction at: #iconLabel);
				yourself);
		yourself
]

{ #category : 'rendering' }
WamNavActionAbstractView >> divNarrow: aNavAction [

	^ #div asHtmlTag
		addClass: 'wam-navrail-item';
		when: CpClickEvent basicPrimary do: [ self triggerNavEvent: aNavAction ] for: self;
		appendChild: (
			#div asHtmlTag
				addClass: 'wam-navrail-icon';
				appendChild: ((WaIcon fullyNamed: (aNavAction at: #iconName)) label: (aNavAction at: #iconLabel); yourself);
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'wam-navrail-labelText';
				addClass: 'wa-text-truncate';
				textContent: (aNavAction at: #iconLabel);
				yourself);
		yourself.

]

{ #category : 'actions' }
WamNavActionAbstractView >> triggerNavEvent: aNavAction [

	super triggerNavEvent: aNavAction.

	self layoutViewLazy hideNavModal.
]
