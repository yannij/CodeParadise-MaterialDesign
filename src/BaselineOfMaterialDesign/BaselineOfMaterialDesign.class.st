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
		spec 
			package: 'CodeParadise-MaterialDesign';
			package: 'CodeParadise-WebApplication-WebAwesome';
			package: 'CodeParadise-Examples-MD3'.

		spec 
			group: 'Core' with: #('CodeParadise-MaterialDesign');
			group: 'Tests' with: #();
			group: 'default' with: #('Core' 'Tests') ]
]
