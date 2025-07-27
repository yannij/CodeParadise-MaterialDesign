Class {
	#name : 'SlmdSidesheetView',
	#superclass : 'SlmdLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ShoelaceComponents',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceComponents'
}

{ #category : 'web resources' }
SlmdSidesheetView class >> style [

	<webResource: #css>

	^ '
.smd-sidesheet {
  padding: 0;
  margin-left: auto;
  max-width: 400px;
  background: var(--sl-color-primary-100);
}

.smd-sidesheet-container {
  padding: 0;
  margin: 0;
}

.smd-sidesheet-content {
  padding: 8px;
  width: 300px;
  height: 100%;
  background: var(--sl-color-primary-100);
}

.smd-sidesheet-card {
  border-radius: 8px;
  padding: 8px;
  background: var(--sl-color-primary-200);
}
'
]

{ #category : 'web resources' }
SlmdSidesheetView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-sidesheet-container">
  <div class="smd-sidesheet-content">
    <div class="smd-sidesheet-card">
      <slot name="content"></slot>
    </div>
  </div>
</div>
'
]

{ #category : 'rendering' }
SlmdSidesheetView >> renderContent: aString [

	self replaceAllChildrenWith: (aString inHtmlTag: #span) atSlotNamed: 'content'.

]
