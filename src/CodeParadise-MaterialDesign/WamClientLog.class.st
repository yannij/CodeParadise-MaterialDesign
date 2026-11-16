Class {
	#name : 'WamClientLog',
	#superclass : 'WamLog',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'accessing' }
WamClientLog class >> application [
	"Answer the nil, client side code avoids using a dynamic variables,
	which it does not support."

	^ nil

]
