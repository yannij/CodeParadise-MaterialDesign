Class {
	#name : 'WamBasicListView',
	#superclass : 'WamLayoutComponentView',
	#category : 'CodeParadise-MaterialDesign-ListDetail',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ListDetail'
}

{ #category : 'web resources' }
WamBasicListView class >> style [

	<webResource: #css>

	^'
.wam-container {
  box-sizing: border-box;
}

.wam-list {
  margin-block-end: 0;
  margin-block-start: 0;
  padding-inline-start: 0;
  gap: var(--wa-gap-0);
}

.wam-pagination {
  padding: 8px;
}'
]

{ #category : 'web resources' }
WamBasicListView class >> template [

	<webResource: #html>

	^ WamView linkUtilitiesCss, '
<div id="container" class="wam-container">
  <div class="wam-pagination">
    <slot name="pagination"></slot>
  </div>
  <ol class="wa-stack wam-list">
    <slot name="list"></slot>
  </ol>
</div>'
]

{ #category : 'rendering' }
WamBasicListView >> renderPaginationTotal: total pageSize: pageSize page: page [
	| element |

	element := WaPagination new
		beWithSummary;
		total: total;
		pageSize: pageSize;
		page: page;
		yourself.
	self replaceAllChildrenWith: element atSlotNamed: #pagination.

]
