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
			package: 'CodeParadise-WebApplication-WebAwesome' with: [
				spec requires: #('CodeParadise-WebApplication' 'CodeParadise-Browser-Support') ];
			package: 'CodeParadise-MaterialDesign' with: [
				spec requires: #('CodeParadise-WebApplication-WebAwesome' 'CodeParadise-WebApplication-MVP') ];
			package: 'CodeParadise-Examples-MD3' with: [
				spec requires: #('CodeParadise-MaterialDesign') ].

		spec
			group: 'Production' with: #('CodeParadise-MaterialDesign');
			group: 'Examples' with: #('Development' 'CodeParadise-Examples-MD3');
			group: 'default' with: #('Examples') ]
]

{ #category : 'baselines - dependencies' }
BaselineOfMaterialDesign >> codeparadise: spec [

	spec
		baseline: 'CodeParadise'
		with: [ spec repository: 'github://ErikOnBike/CodeParadise';
			loads: #('MVP') ].

	spec package: 'CodeParadise-Browser-Support' with: [
		spec repository: 'github://ErikOnBike/CodeParadise'].
	spec package: 'CodeParadise-WebApplication' with: [
		spec repository: 'github://ErikOnBike/CodeParadise'].
	spec package: 'CodeParadise-WebApplication-MVP' with: [
		spec repository: 'github://ErikOnBike/CodeParadise'].
]
