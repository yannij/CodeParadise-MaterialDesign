Class {
	#name : 'WamSupportingPaneLayoutView',
	#superclass : 'WamPaneLayoutView',
	#category : 'CodeParadise-MaterialDesign-Layout',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Layout'
}

{ #category : 'web resources' }
WamSupportingPaneLayoutView class >> template [

	<webResource: #html>

	^ WamView linkUtilitiesCss, '
<div class="wam-pane-layout">
  <div id="wamSupportingPaneLayout" class="wam-supporting-pane">
    <div id="wamFocusPane" class="wam-pane">
      <slot name="focusPane"></slot>
    </div>
    <div id="wamSupportingPane" class="wam-pane">
      <slot name="supportingPane"></slot>
    </div>
  </div>
</div>
<slot name="sidesheet"></slot>
'
]

{ #category : 'panes' }
WamSupportingPaneLayoutView >> pane1WidthComputeWith: aScaffoldView [
	| lwc w |

	lwc := aScaffoldView layoutWidthCached.
	self isUsingSinglePaneLayout ifTrue: [ | reduceByWidth |
		reduceByWidth := aScaffoldView bodyWidthReduction.
		^ reduceByWidth > 0
			ifTrue: [ lwc - aScaffoldView bodyWidthReduction ]
			ifFalse: [ lwc ] ].

	w :=  (lwc / 2) asInteger.
	aScaffoldView useModalNav ifFalse: [  w := w - aScaffoldView navRailWidth ].
	w := w max: self pane1WidthMin.

	^ w

]
