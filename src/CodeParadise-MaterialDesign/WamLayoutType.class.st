Class {
	#name : 'WamLayoutType',
	#superclass : 'Object',
	#classVars : [
		'ByName'
	],
	#category : 'CodeParadise-MaterialDesign-Base',
	#package : 'CodeParadise-MaterialDesign',
	#tag : 'Base'
}

{ #category : 'accessing' }
WamLayoutType class >> byName [

	^ ByName ifNil: [ ByName := self byNameBuild ]
]

{ #category : 'accessing' }
WamLayoutType class >> byName: anObject [

	^ ByName := anObject
]

{ #category : 'accessing' }
WamLayoutType class >> byNameBuild [

	^ Dictionary new
		at: self layoutTypeCompact put: self layoutProfileCompact;
		at: self layoutTypeCompactRail put: self layoutProfileCompactRail;
		at: self layoutTypeMedium put: self layoutProfileMedium;
		at: self layoutTypeMediumRail put: self layoutProfileMediumRail;
		at: self layoutTypeExpanded put: self layoutProfileExpanded;
		at: self layoutTypeLarge put: self layoutProfileLarge;
		at: self layoutTypeExtraLarge put: self layoutProfileExtraLarge;
		yourself
]

{ #category : 'layout' }
WamLayoutType class >> defaultLayoutBreakpoints [

	^ {
	600 -> self layoutProfileCompact.
	840 -> self layoutProfileMedium.
	1200 -> self layoutProfileExpanded.
	1600 -> self layoutProfileLarge.
	SmallInteger maxVal -> self layoutProfileExtraLarge.
	}
]

{ #category : 'layout' }
WamLayoutType class >> layoutProfileCompact [

	^ {
		#name -> self layoutTypeCompact.
		#navRailExpanded -> false.
		#showNavMenuButton -> false.
		#useModalNav -> true.
		#showNavBar -> true.
		#useTwoPaneBody -> false.
		#showAppBar -> true.
		"#showSidesheet -> false.
		#showDockedToolbar -> false.
		#showFloatingToolbar -> false"
	} asDictionary

]

{ #category : 'layout' }
WamLayoutType class >> layoutProfileCompactRail [

	^ {
		#name -> self layoutTypeCompactRail.
		#navRailExpanded -> false.
		#showNavMenuButton -> true.
		#useModalNav -> true.
		#showNavBar -> false.
		#useTwoPaneBody -> false.
		#showAppBar -> true.
		"#showSidesheet -> false.
		#showDockedToolbar -> false.
		#showFloatingToolbar -> false"
	} asDictionary

]

{ #category : 'layout' }
WamLayoutType class >> layoutProfileExpanded [

	^ {
		#name -> self layoutTypeExpanded.
		#navRailExpanded -> false.
		#showNavMenuButton -> true.
		#useModalNav -> true.
		#showNavBar -> false.
		#useTwoPaneBody -> true.
		#showAppBar -> true.
		"#showSidesheet -> false.
		#showDockedToolbar -> false.
		#showFloatingToolbar -> false"
	} asDictionary

]

{ #category : 'layout' }
WamLayoutType class >> layoutProfileExtraLarge [

	^ {
		#name -> self layoutTypeExtraLarge.
		#navRailExpanded -> true.
		#showNavMenuButton -> false.
		#useModalNav -> false.
		#showNavBar -> false.
		#useTwoPaneBody -> true.
		#showAppBar -> true.
		"#showSidesheet -> false.
		#showDockedToolbar -> false.
		#showFloatingToolbar -> false"
	} asDictionary

]

{ #category : 'layout' }
WamLayoutType class >> layoutProfileLarge [

	^ {
		#name -> self layoutTypeLarge.
		#navRailExpanded -> false.
		#showNavMenuButton -> false.
		#useModalNav -> false.
		#showNavBar -> false.
		#useTwoPaneBody -> true.
		#showAppBar -> true.
		"#showSidesheet -> false.
		#showDockedToolbar -> false.
		#showFloatingToolbar -> false"
	} asDictionary

]

{ #category : 'layout' }
WamLayoutType class >> layoutProfileMedium [

	^ {
		#name -> self layoutTypeMedium.
		#navRailExpanded -> true.
		#showNavMenuButton -> false.
		#useModalNav -> true.
		#showNavBar -> true.
		#useTwoPaneBody -> true.
		#showAppBar -> true.
		"#showSidesheet -> false.
		#showDockedToolbar -> false.
		#showFloatingToolbar -> false"
	} asDictionary

]

{ #category : 'layout' }
WamLayoutType class >> layoutProfileMediumRail [

	^ {
		#name -> self layoutTypeMediumRail.
		#navRailExpanded -> true.
		#showNavMenuButton -> true.
		#useModalNav -> true.
		#showNavBar -> false.
		#useTwoPaneBody -> true.
		#showAppBar -> true.
		"#showSidesheet -> false.
		#showDockedToolbar -> false.
		#showFloatingToolbar -> false"
	} asDictionary

]

{ #category : 'layout' }
WamLayoutType class >> layoutTypeCompact [

	^ #compact
]

{ #category : 'layout' }
WamLayoutType class >> layoutTypeCompactRail [

	^ #compactRail
]

{ #category : 'layout' }
WamLayoutType class >> layoutTypeExpanded [

	^ #expanded
]

{ #category : 'layout' }
WamLayoutType class >> layoutTypeExtraLarge [

	^ #'extra-large'
]

{ #category : 'layout' }
WamLayoutType class >> layoutTypeLarge [

	^ #large
]

{ #category : 'layout' }
WamLayoutType class >> layoutTypeList [

	^ {
	self layoutTypeCompact -> 'Compact'.
	self layoutTypeMedium -> 'Medium'.
	self layoutTypeExpanded -> 'Expanded'.
	self layoutTypeLarge -> 'Large'.
	self layoutTypeExtraLarge -> 'Extra-large'.
	}
]

{ #category : 'layout' }
WamLayoutType class >> layoutTypeMedium [

	^ #medium
]

{ #category : 'layout' }
WamLayoutType class >> layoutTypeMediumRail [

	^ #mediumRail
]
