Class {
	#name : 'WamListDetailLayoutView',
	#superclass : 'WamResponsiveLayoutView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
WamListDetailLayoutView class >> template [

	<webResource: #html>

	^ WamView linkUtilitiesCss, '
<wa-resize-observer>
  <div class="wa-cloak wa-stack wa-gap-0 wa-align-items-stretch">
    <div class="wa-cluster wa-gap-0 wa-align-items-stretch wa-flex-nowrap">
      <slot name="navRail"></slot>
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
    </div>
    <slot name="navBar"></slot>
    <slot name="dockedToolbar"></slot>
  </div>
</wa-resize-observer>
<slot name="navRailModal"></slot>
<slot name="floatingToolbar"></slot>
<slot name="fab"></slot>
<slot name="dialog"></slot>
<slot name="brandDialog"></slot>
'
]
