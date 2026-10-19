Class {
	#name : 'WamListDetailLayoutView',
	#superclass : 'WamPaneLayoutView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
WamListDetailLayoutView class >> template [

	<webResource: #html>

	^ WamView linkUtilitiesCss, '
<div class="wam-pane-layout">
  <div id="wamSinglePaneLayout" class="wam-one-pane">
    <div id="wamSinglePaneLayoutP1" class="wam-pane">
      <slot name="singlePaneLayoutP1"></slot>
    </div>
    <div id="wamSinglePaneLayoutP2" class="wam-pane">
      <slot name="singlePaneLayoutP2"></slot>
    </div>
  </div>
  <div id="wamTwoPaneLayout" class="wam-two-pane">
    <wa-split-panel id="wamBodySplitPanel" class="wam-body-split-panel">
      <wa-icon slot="divider" name="grip-vertical"></wa-icon>
      <div slot="start">
        <div id="wamTwoPaneLayoutP1" class="wam-pane">
          <slot name="twoPaneLayoutP1"></slot>
        </div>
      </div>
      <div slot="end">
        <div id="wamTwoPaneLayoutP2" class="wam-pane">
          <slot name="twoPaneLayoutP2"></slot>
        </div>
      </div>
    </wa-split-panel>
  </div>
</div>
<slot name="sidesheet"></slot>
'
]
