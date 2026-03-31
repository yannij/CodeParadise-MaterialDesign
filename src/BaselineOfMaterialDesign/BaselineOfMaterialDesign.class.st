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
			package: 'CodeParadise-WebApplication-WebAwesome' with: [ spec requires: #('CodeParadise') ];
			package: 'CodeParadise-MaterialDesign' with: [ spec requires: #('CodeParadise-WebApplication-WebAwesome') ];
			package: 'CodeParadise-Examples-MD3' with: [ spec requires: #('CodeParadise-MaterialDesign') ].

		spec
			group: 'Core' with: #('CodeParadise-MaterialDesign');
			group: 'Tests' with: #();
			group: 'Examples' with: #('CodeParadise-Examples-MD3');
			group: 'default' with: #('Core' 'Tests' 'Examples') ]
]

{ #category : 'baselines - dependencies' }
BaselineOfMaterialDesign >> codeparadise: spec [

	spec
		baseline: 'CodeParadise'
		with: [ spec repository: 'github://ErikOnBike/CodeParadise';
			loads: #('MVP' 'Development') ]
]
