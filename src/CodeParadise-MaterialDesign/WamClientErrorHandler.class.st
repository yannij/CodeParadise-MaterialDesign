Class {
	#name : 'WamClientErrorHandler',
	#superclass : 'Object',
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'message handling' }
WamClientErrorHandler class >> handleClientError: aClientError for: aServerEnvironment [

	| application presenter |

	CpServerApplication allSubInstances
		detect: [ :each | each environment == aServerEnvironment ]
		ifFound: [ :serverApplication | application := serverApplication ].

	application ifNotNil: [
		(aClientError class == CpClientMessageSendFailed and: [ application class isMvpWebApplication ])
			ifTrue: [
				aClientError messageSend ifNotNil: [ :messageSend |
					presenter := application presenterWithId: messageSend receiver ifAbsent: [ nil ] ] ] ].

	Smalltalk isHeadless
		ifTrue: [
			"Show relevant information on Transcript"
			self
				traceCr: 'Error in client of application: ', application class app asString ;
				traceCr: aClientError printString.

			presenter ifNotNil: [
				self traceCr: 'In Presenter: ', presenter class name ] ]
		ifFalse: [
			"Show inspector with relevant information"
			presenter
				ifNotNil: [
					"Show inspector with the error, presenter and application"
					{ 'A failure in message sent' . aClientError . presenter . application } inspect ]
				ifNil: [
					"Show inspector with the error and environment"
					{ 'An error occurred in the Client Environment' . aClientError . aServerEnvironment } inspect ] ]
]
