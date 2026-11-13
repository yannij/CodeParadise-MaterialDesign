Class {
	#name : 'WamListItemView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'web resources' }
WamListItemView class >> globalStyle [
	<webResource: #css>

	^ '
.wam-item {
  min-height: 40px;
  padding: 8px 0 8px 16px;
  background: var(--wa-color-brand-fill-normal);
}

.wam-item-leadingIcon {
  padding-right: 16px;
  font-size: 24px;
}

.wam-item-trailingIcon {
  padding-right: 16px;
  font-size: 24px;
}

.wam-item-label-text {
  padding-right: 16px;
  font-size: 16px;
  text-align: left;
  text-overflow: ellipsis;
}
'
]
