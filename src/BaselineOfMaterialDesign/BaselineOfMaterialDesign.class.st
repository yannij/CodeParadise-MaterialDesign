Class {
	#name : 'BaselineOfMaterialDesign',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMaterialDesign',
	#package : 'BaselineOfMaterialDesign'
}

{ #category : 'baselines' }
BaselineOfMaterialDesign >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		self codeparadise: spec.

		spec
			package: 'CodeParadise-WebApplication-WebAwesome';
			package: 'CodeParadise-MaterialDesign';
			package: 'CodeParadise-Examples-MD3'.

		spec
			group: 'default' with: #('Core' 'Tests' 'Examples');
			group: 'Core' with: #('CodeParadise-WebApplication-WebAwesome' 'CodeParadise-MaterialDesign');
			group: 'Tests' with: #();
			group: 'Examples' with: #('CodeParadise-Examples-MD3') ]
]

{ #category : 'baselines - dependencies' }
BaselineOfMaterialDesign >> codeparadise: spec [

	spec
		baseline: 'CodeParadise'
		with: [ spec repository: 'github://yannij/CodeParadise' ]
]
