Class {
	#name : 'SlmdDemoAccountingSoilDbApp',
	#superclass : 'SlmdDemoAccountingApp',
	#category : 'CodeParadise-Examples-MD3-Accounting',
	#package : 'CodeParadise-Examples-MD3',
	#tag : 'Accounting'
}

{ #category : 'initialization' }
SlmdDemoAccountingSoilDbApp class >> app [

	^ 'accounting-soil'
]

{ #category : 'initialization' }
SlmdDemoAccountingSoilDbApp class >> appName [

	^ 'Accounting'
]

{ #category : 'initialization' }
SlmdDemoAccountingSoilDbApp class >> repositoryClass [
	"
	self createData
	"

	"^ SlmdDemoSoilCheckpointRepository"
	^ SlmdDemoSoilRepository
]

{ #category : 'rendering - quasar hooks' }
SlmdDemoAccountingSoilDbApp >> quasarConfigContentOn: aJSStream with: html [

	aJSStream nextPutAll: '
brand: {
	primary: ''#E5E4FA'',
	secondary: ''#e30425'',
	accent: ''#9C27B0'',
	dark: ''#1d1d1d'',
	positive: ''#21BA45'',
	negative: ''#C10015'',
	info: ''#31CCEC'',
	warning: ''#F2C037''
}'
]

{ #category : 'rendering' }
SlmdDemoAccountingSoilDbApp >> renderLayoutOn: html [

	self username ifNil: [
		html qApp id: self appId; with: [
			html render: self login ].
		^ self ].

	html qApp id: self appId; with: [
		html qLayout view: 'hHh lpR fFf'; vCloak; with: [
			html qHeader heightHint: 98; class: 'bg-primary'; style: 'color: black'; with: [
				html qToolbar with: [
					"html qBtn dense; flat; round; icon: 'menu'; vOnClick: 'this.$refs.leftDrawer.toggle($event)'."
					self renderTabsOn: html.
					html qSpace.
					html qBtn flat; round; icon: 'view_sidebar'; vOnClick: 'this.$refs.sideSheet.toggle($event)' ] ].
			self renderLayoutPageOn: html.
			html render: self sideSheet ] ]
]
