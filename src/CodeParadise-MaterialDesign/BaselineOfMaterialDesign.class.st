Class {
	#name : 'BaselineOfMaterialDesign',
	#superclass : 'BaselineOf',
	#category : 'CodeParadise-MaterialDesign',
	#package : 'CodeParadise-MaterialDesign'
}

{ #category : 'baselines' }
BaselineOfMaterialDesign >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			package: 'CodeParadise-MaterialDesign'.

		spec 
			group: 'Core' with: #('CodeParadise-MaterialDesign');
			group: 'Tests' with: #();
			group: 'default' with: #('Core' 'Tests') ]
]
