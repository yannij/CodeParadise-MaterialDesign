Class {
	#name : 'SlmdColorTokenGenerator',
	#superclass : 'Object',
	#category : 'CodeParadise-MaterialDesign-ShoelaceBase',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'ShoelaceBase'
}

{ #category : 'utilities' }
SlmdColorTokenGenerator class >> adjustColor: color luminance: target [
	"
	Note. Shoelace paletter generator uses:
		https://unpkg.com/chroma-js@3.1.2/dist/chroma.cjs
	to set luminence.

	Example:
		self generateColorScale: Color red.
		self generateColorScale: (Color r: 16r19 g: 16r76 b: 16rd2 range: 16rff).
	"
	| newColor luminance |

	newColor := color.
	luminance := newColor luminance.
	luminance > target
		ifTrue: [
			[ luminance > target and: [ luminance <= 0.95 ] ] whileTrue: [
				newColor := newColor darker.
				"newColor := newColor adjustSaturation: 0.03 brightness: -0.08."
				luminance := newColor luminance ] ]
		ifFalse: [
			[ luminance < target and: [ luminance >= 0.02 ] ] whileTrue: [
				newColor := newColor lighter.
				"newColor := newColor adjustSaturation: -0.03 brightness: 0.08."
				luminance := newColor luminance ] ].

	"{ target. color. color asHexString. color luminance } inspect.
	{ newColor. newColor asHexString. newColor luminance } inspect."

	^ newColor
]

{ #category : 'utilities' }
SlmdColorTokenGenerator class >> generateColorScale: aColor [
	| factors palette |

	factors := {
0.95 -> 50.
0.84 -> 100.
0.73 -> 200.
0.62 -> 300.
0.49 -> 400.
0.35 -> 500.
0.23 -> 600.
0.15 -> 700.
0.10 -> 800.
0.05 -> 900.
0.02 -> 950 }.
	palette := factors collect: [ :each |
		self adjustColor: aColor luminance: each key ].

	"(palette collect: [ :each | each luminance ]) inspect."
	"(palette collect: [ :each | each asHexString ]) inspect."
	(palette collect: [ :each | self rgbDecimal: each ]) inspect.

	^ palette
]

{ #category : 'utilities' }
SlmdColorTokenGenerator class >> rgbDecimal: color [

	^ 'rgb('
	, (color red * 255) asInteger printString, ' '
	, (color green * 255) asInteger printString, ' '
	, (color blue * 255) asInteger printString, ' '
	, ')'
]
