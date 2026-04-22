Extension { #name : 'CpView' }

{ #category : '*CodeParadise-MaterialDesign' }
CpView >> viewProxyLogTrace: aString [
	"Emit aString to log.
	Used only by Presenter to request View proxy to emit to client side log"

	true ifTrue: [
		WamLog log: aString level: 3 ]
]
