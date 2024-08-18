'From Cuis7.1 [latest update: #6594] on 18 August 2024 at 2:54:41 pm'!
'Description I created this package to learn more about Morphic.'!
!provides: 'TodoApp' 1 401!
!requires: 'UI-Entry' 1 51 nil!
SystemOrganization addCategory: #TodoApp!


!classDefinition: #EditableLabelMorph category: #TodoApp!
LayoutMorph subclass: #EditableLabelMorph
	instanceVariableNames: 'label textEntry'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TodoApp'!
!classDefinition: 'EditableLabelMorph class' category: #TodoApp!
EditableLabelMorph class
	instanceVariableNames: ''!

!classDefinition: #Layout2Morph category: #TodoApp!
LayoutMorph subclass: #Layout2Morph
	instanceVariableNames: 'useEdgeSpace'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TodoApp'!
!classDefinition: 'Layout2Morph class' category: #TodoApp!
Layout2Morph class
	instanceVariableNames: ''!

!classDefinition: #PluggableScroll2Pane category: #TodoApp!
PluggableScrollPane subclass: #PluggableScroll2Pane
	instanceVariableNames: 'onExtentChanged'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TodoApp'!
!classDefinition: 'PluggableScroll2Pane class' category: #TodoApp!
PluggableScroll2Pane class
	instanceVariableNames: ''!

!classDefinition: #BasicButtonMorph category: #TodoApp!
BoxedMorph subclass: #BasicButtonMorph
	instanceVariableNames: 'fillColor font hoverColor hovered label onClick padding textColor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TodoApp'!
!classDefinition: 'BasicButtonMorph class' category: #TodoApp!
BasicButtonMorph class
	instanceVariableNames: 'label onClick'!

!classDefinition: #BasicCheckboxMorph category: #TodoApp!
BoxedMorph subclass: #BasicCheckboxMorph
	instanceVariableNames: 'checked fillColor hoverColor hovered onChange'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TodoApp'!
!classDefinition: 'BasicCheckboxMorph class' category: #TodoApp!
BasicCheckboxMorph class
	instanceVariableNames: ''!

!classDefinition: #CenteredTextEntryMorph category: #TodoApp!
TextEntryMorph subclass: #CenteredTextEntryMorph
	instanceVariableNames: 'padding'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TodoApp'!
!classDefinition: 'CenteredTextEntryMorph class' category: #TodoApp!
CenteredTextEntryMorph class
	instanceVariableNames: ''!

!classDefinition: #TextEntry2Morph category: #TodoApp!
TextEntryMorph subclass: #TextEntry2Morph
	instanceVariableNames: 'escapeAction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TodoApp'!
!classDefinition: 'TextEntry2Morph class' category: #TodoApp!
TextEntry2Morph class
	instanceVariableNames: ''!

!classDefinition: #Todo category: #TodoApp!
Object subclass: #Todo
	instanceVariableNames: 'checkbox label labelFont onDelete onDoneToggle row'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TodoApp'!
!classDefinition: 'Todo class' category: #TodoApp!
Todo class
	instanceVariableNames: ''!

!classDefinition: #TodoApp category: #TodoApp!
Object subclass: #TodoApp
	instanceVariableNames: 'scrollPane statusLabel todoEntry todos todosPane window titleLabelx'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TodoApp'!
!classDefinition: 'TodoApp class' category: #TodoApp!
TodoApp class
	instanceVariableNames: ''!


!EditableLabelMorph commentStamp: 'RMV 8/18/2024 14:50:42' prior: 0!
This is a morph that draws either a LabelMorph or a TextEntry2Morph.
Initially it draws its contents value in a LabelMorph.
If the LabelMorph is clicked, it is make invisible and the TextEntry2Morph is made visible.
This allows users to edit the contents.

Press the return key to save the new contents, make the TextEntry2Morph invisible,
and make the LabelMorph visible with the new contents.

Press the escape key to discard the changes, make the TextEntry2Morph invisible,
and make the LabelMorph visible with the old contents.!

!Layout2Morph commentStamp: 'RMV 8/18/2024 14:52:33' prior: 0!
This is a subclass of LayoutMorph that adds the instance variable "useEdgeSpace".
When true, x and y separation are kept between submorphs AND at the edges of our extent.
Othersize separation is only kept between the submorphs and not at the edges of our extent.!

!PluggableScroll2Pane commentStamp: 'RMV 8/18/2024 14:53:09' prior: 0!
This is a subclass of PluggableScrollPane that adds the ability to listen for extent changes.!

!BasicButtonMorph commentStamp: 'RMV 8/18/2024 14:46:14' prior: 0!
This is a basic button morph that is simpler and easier to understand that PluggableButtonMorph.!

!BasicCheckboxMorph commentStamp: 'RMV 8/18/2024 14:46:57' prior: 0!
This is a basic checkbox morph that is simpler and easier to understand that CheckButtonMorph.
It also has a look that I find more intuitive.!

!CenteredTextEntryMorph commentStamp: 'RMV 8/18/2024 14:47:09' prior: 0!
TextEntryMorph supports single-line text entry,
but does not center the text vertically.
This subclass of TextEntryMorph fixes that.!

!TextEntry2Morph commentStamp: 'RMV 8/18/2024 14:53:50' prior: 0!
This is a subclass of TextEntryMorph that addes the ability to listen for presses of the escape key.!

!Todo commentStamp: 'RMV 8/18/2024 14:54:14' prior: 0!
Instances of this class represent a todo item that has a text description and can be marked as done.
Send #morph to get a morph that represents a todo item.!

!TodoApp commentStamp: 'RMV 8/18/2024 14:45:24' prior: 0!
This is a basic todo application.
It was created as an exercise for learning about Morphic.!

!EditableLabelMorph methodsFor: 'as yet unclassified' stamp: 'RMV 8/17/2024 19:34:42'!
color: aColor
	label ifNotNil: [ label color: aColor ]! !

!EditableLabelMorph methodsFor: 'as yet unclassified' stamp: 'RMV 8/17/2024 15:47:43'!
contents
	^ label contents! !

!EditableLabelMorph methodsFor: 'as yet unclassified' stamp: 'RMV 8/17/2024 15:44:32'!
contents: aString
	label contents: aString.
	textEntry contents: aString.! !

!EditableLabelMorph methodsFor: 'as yet unclassified' stamp: 'RMV 8/17/2024 15:44:17'!
font
	^ label font! !

!EditableLabelMorph methodsFor: 'as yet unclassified' stamp: 'RMV 8/17/2024 15:43:52'!
font: aFont
	label font: aFont.
	textEntry font: aFont.! !

!EditableLabelMorph methodsFor: 'as yet unclassified' stamp: 'RMV 8/17/2024 15:13:45'!
handlesMouseDown: aMouseEvent
	^ true! !

!EditableLabelMorph methodsFor: 'as yet unclassified' stamp: 'RMV 8/17/2024 19:57:25'!
initialize
	super initialize.
	super color: Color transparent.
	
	label := LabelMorph new.
	self addMorph: label.
	
	textEntry := TextEntry2Morph new.
	textEntry crAction: [
		label contents: textEntry contents.
		textEntry visible: false.
		label visible: true.
	].
	textEntry escapeAction: [
		textEntry visible: false.
		label visible: true.
		textEntry contents: label contents.
	].
	textEntry visible: false.
	self addMorph: textEntry.! !

!EditableLabelMorph methodsFor: 'as yet unclassified' stamp: 'RMV 8/17/2024 18:21:47'!
mouseButton1Down: aMouseEvent localPosition: aPosition
	| worldPosition |
	worldPosition := aMouseEvent eventPosition.
	(label coversPixel: worldPosition) ifTrue: [
		label visible: (label visible not).
		textEntry visible: (textEntry visible not).
	]! !

!EditableLabelMorph methodsFor: 'as yet unclassified' stamp: 'RMV 8/17/2024 16:16:50'!
text: aString
	label contents: aString.
	textEntry contents: aString.! !

!EditableLabelMorph class methodsFor: 'as yet unclassified' stamp: 'RMV 8/17/2024 16:19:07'!
new
	"It's necessary to override this method because the
	superclass LayoutMorph new method triggers an error."
	^ self newRow! !

!Layout2Morph methodsFor: 'initialization' stamp: 'RMV 8/14/2024 18:33:56'!
initialize
	super initialize.
	useEdgeSpace := true! !

!Layout2Morph methodsFor: 'geometry' stamp: 'RMV 8/14/2024 19:47:20'!
minimumExtent: cachedValues
	"Answer size sufficient to frame my submorphs."
	
	| width height mle |
	width  := 0.
	height := 0.
	(self direction = #vertical)
		ifTrue: [ "Column"
			self submorphsToLayout do: [ :sm |
				mle := sm minimumLayoutExtent: cachedValues.
				"use maximum width across submorphs"
				width := width max: mle x.
				"sum up submorph heights, including separation"
				height := height + mle y + self ySeparation.
			].
			useEdgeSpace
				ifTrue: [
					height := height + self ySeparation. "one side already separated"
					width := width + (2 * self xSeparation). "separation on each side"
				]
				ifFalse: [
					height := height - self ySeparation. "one side already separated"
				].
		]
		ifFalse: [ "Row"
			self submorphsToLayout do: [ :sm |
				mle := sm minimumLayoutExtent: cachedValues.
				"sum up submorphs width"
				width := width + mle x + self xSeparation.
				"use maximum height across submorph"
				height := height max: mle y.
			].
			useEdgeSpace
				ifTrue: [
					width := width + self xSeparation. "one side already separated"
					height := height + (2 * self ySeparation). "separation on each side"
				]
				ifFalse: [
					width := width - self xSeparation. "one side already separated"
				].
		].

	^ (width @ height) + self extentBorder! !

!Layout2Morph methodsFor: 'layout' stamp: 'RMV 8/14/2024 18:32:47'!
layoutSubmorphsHorizontallyIn: boundsForLayout
	"Compute a new layout based on the given layout bounds."

	| visibleSubmorphs gap gapCount widths widthToAllocate leftOver x height y cache |
	"Preconditions: self isRow & morphExtent >= minimumLayoutExtent"
	(visibleSubmorphs := self submorphsToLayout reversed  "Display Order")
		ifEmpty: [ ^ self. "Nothing to layout, besides `sum` below, would fail" ].
	
	gap := self xSeparation.
	gapCount := useEdgeSpace ifTrue: [ visibleSubmorphs size + 1 ] ifFalse: [ visibleSubmorphs size - 1].
	widthToAllocate := (boundsForLayout width - (gapCount * gap)).
	"widthToAllocate := (boundsForLayout width - ((visibleSubmorphs size - 1) * gap))."
	cache := IdentityDictionary new.
	widths := self widthsFor: visibleSubmorphs within: widthToAllocate minLayoutExtentCache: cache.
	leftOver := widthToAllocate - widths sum.
	x := boundsForLayout left + (leftOver * self axisEdgeWeight).
	useEdgeSpace ifTrue: [ x := x + gap ].

	visibleSubmorphs with: widths do: [ :sm :smWidth |
		height := self offAxisHeightFor: sm within: boundsForLayout height minLayoutExtentCache: cache.
		y := self offAxisYOffsetFor: sm within: boundsForLayout height - height.
		sm fitInto: (x @ (boundsForLayout top + y) extent: smWidth @ height).
		x := x + smWidth + gap.
	]! !

!Layout2Morph methodsFor: 'layout' stamp: 'KenD 8/15/2024 05:24:55'!
layoutSubmorphsVerticallyIn: boundsForLayout
	"Compute a new layout based on the given layout bounds."

	| visibleSubmorphs gap gapCount heights heightToAllocate leftOver y width x cache |
	"Preconditions: self isRow & morphExtent >= minimumLayoutExtent"
	(visibleSubmorphs := self submorphsToLayout reversed  "Display Order")
		ifEmpty: [ ^ self. "Nothing to layout, besides `sum` below, would fail" ].

	gap := self ySeparation.
	gapCount := useEdgeSpace ifTrue: [ visibleSubmorphs size + 1 ] ifFalse: [ visibleSubmorphs size - 1].
	heightToAllocate := (boundsForLayout height - (gapCount * gap)).
	cache := IdentityDictionary new.
	heights := self heightsFor: visibleSubmorphs within: heightToAllocate minLayoutExtentCache: cache.
	leftOver := heightToAllocate - heights sum.
	y := boundsForLayout top + (leftOver * self axisEdgeWeight).
	useEdgeSpace ifTrue: [ y := y + gap ].

	visibleSubmorphs with: heights do: [ :sm :smHeight |
		width := self offAxisWidthFor: sm within: boundsForLayout width minLayoutExtentCache: cache.
		x := self offAxisXOffsetFor: sm within: boundsForLayout width - width.
		sm fitInto: (boundsForLayout left + x @ y extent: width @ smHeight).
		y := y + smHeight + gap.
	]! !

!Layout2Morph methodsFor: 'layout' stamp: 'KenD 8/15/2024 05:41:15'!
offAxisHeightFor: aMorph within: availableHeight minLayoutExtentCache: cache
	"Answer height for a single morph -- offAxis calculation for a Row"
	
	| availableForPropHeight actualPropHeight |
	availableForPropHeight := useEdgeSpace 
		ifTrue: [ availableHeight  - (2 * self ySeparation) ]
		ifFalse: [ availableHeight ].
	actualPropHeight := (availableForPropHeight * aMorph layoutSpec proportionalLayoutHeight)
							 max: (aMorph minimumLayoutExtent: cache) y.
	^ actualPropHeight! !

!Layout2Morph methodsFor: 'layout' stamp: 'KenD 8/15/2024 05:42:45'!
offAxisWidthFor: aMorph within: availableWidth minLayoutExtentCache: cache
	"Answer width for a single morph -- offAxis calculation for a Column"

	| availableForPropWidth actualPropWidth |
	availableForPropWidth := useEdgeSpace 
		ifTrue: [ 	availableWidth - (2 * self xSeparation) ]
		 ifFalse: [ availableWidth ].
	actualPropWidth := (availableForPropWidth * aMorph layoutSpec proportionalLayoutWidth)
						 	max: (aMorph minimumLayoutExtent: cache) x.
	^ actualPropWidth! !

!Layout2Morph methodsFor: 'layout' stamp: 'RMV 8/14/2024 19:30:46'!
offAxisXOffsetFor: aMorph within: availableWidth
	"Answer x offset for a single morph -- offAxis calculation for a Column"

	| leftOver offset |
	leftOver := useEdgeSpace
		ifTrue: [availableWidth - (2 * self xSeparation)] 
		ifFalse: [availableWidth].
	offset := leftOver * aMorph layoutSpec offAxisEdgeWeight. 
	useEdgeSpace ifTrue: [ ^ self xSeparation + offset ].
	^ offset! !

!Layout2Morph methodsFor: 'layout' stamp: 'RMV 8/14/2024 19:30:50'!
offAxisYOffsetFor: aMorph within: availableHeight
	"Answer y offset for a single morph -- offAxis calculation for a Row"
	
	| leftOver offset |
	leftOver := useEdgeSpace
		ifTrue: [availableHeight - (2 * self ySeparation)] 
		ifFalse: [availableHeight].
	offset := leftOver * aMorph layoutSpec offAxisEdgeWeight.
	useEdgeSpace ifTrue: [ ^ self ySeparation + offset ].
	^offset! !

!Layout2Morph methodsFor: 'layout' stamp: 'RMV 8/14/2024 18:32:08'!
useEdgeSpace
	^ useEdgeSpace! !

!Layout2Morph methodsFor: 'layout' stamp: 'RMV 8/14/2024 18:31:59'!
useEdgeSpace: aBoolean
	useEdgeSpace := aBoolean! !

!Layout2Morph class methodsFor: 'as yet unclassified' stamp: 'RMV 8/14/2024 19:47:33'!
example1
	| withEdge noEdge upSpec downSpec |
	withEdge := self newRow :: useEdgeSpace: true;  separation: 20.
	noEdge := self newRow :: useEdgeSpace: false;  separation: 20.
	upSpec := LayoutSpec keepMorphExtent :: offAxisEdgeWeight: 0.
	upSpec proportionalWidth: 0.8 minimum: 100; proportionalHeight: 0.8 minimum: 100.
	downSpec := LayoutSpec keepMorphExtent :: offAxisEdgeWeight: 1.
	downSpec proportionalWidth: 0.8 minimum: 100; proportionalHeight: 0.8 minimum: 100.
	
	withEdge addMorph: (BoxedMorph new :: color: Color blue;  layoutSpec: upSpec).
	noEdge addMorph: (BoxedMorph new :: color: Color blue;  layoutSpec: upSpec).
	withEdge addMorph: (LabelMorph new :: contents: 'WITH Edge').
	noEdge addMorph: (LabelMorph new :: contents: 'withOUT Edge').
	withEdge addMorph: (BoxedMorph new :: layoutSpec: downSpec).
	noEdge addMorph: (BoxedMorph new ::  layoutSpec: downSpec).
	
	withEdge openInWorld.
	noEdge openInWorld.! !

!Layout2Morph class methodsFor: 'examples' stamp: 'RMV 8/15/2024 08:25:48'!
exampleEdgesColumn
	"Show 2 cases :1 useEdgeSpace true and 1 false"
	" self exampleEdgesColumn "
	| withEdge noEdge upSpec downSpec |
	withEdge := self newColumn :: useEdgeSpace: true;  separation: 20.
	noEdge := self newColumn :: useEdgeSpace: false;  separation: 20.
	upSpec := LayoutSpec keepMorphExtent :: offAxisEdgeWeight: 0.
	upSpec proportionalWidth: 0.8 minimum: 100; proportionalHeight: 0.8 minimum: 100.
	downSpec := LayoutSpec keepMorphExtent :: offAxisEdgeWeight: 1.
	downSpec proportionalWidth: 0.5 minimum: 100; proportionalHeight: 0.5 minimum: 100.
	
	withEdge addMorph: (BoxedMorph new :: color: Color blue;  layoutSpec: upSpec).
	noEdge addMorph: (BoxedMorph new :: color: Color blue;  layoutSpec: upSpec).
	withEdge addMorph: (LabelMorph new :: contents: 'WITH Edge').
	noEdge addMorph: (LabelMorph new :: contents: 'withOUT Edge').
	withEdge addMorph: (BoxedMorph new :: layoutSpec: downSpec).
	noEdge addMorph: (BoxedMorph new ::  layoutSpec: downSpec).
	
	withEdge openInWorld.
	noEdge openInWorld.! !

!Layout2Morph class methodsFor: 'examples' stamp: 'KenD 8/15/2024 05:26:38'!
exampleEdgesRow
	"Show 2 cases: 1 useEdgeSpace true and 1 false"
	" self exampleEdgesRow "
	| withEdge noEdge upSpec downSpec |
	withEdge := self newRow :: useEdgeSpace: true;  separation: 20.
	noEdge := self newRow :: useEdgeSpace: false;  separation: 20.
	upSpec := LayoutSpec keepMorphExtent :: offAxisEdgeWeight: 0.
	upSpec proportionalWidth: 0.8 minimum: 100; proportionalHeight: 0.8 minimum: 100.
	downSpec := LayoutSpec keepMorphExtent :: offAxisEdgeWeight: 1.
	downSpec proportionalWidth: 0.5 minimum: 100; proportionalHeight: 0.5 minimum: 100.
	
	withEdge addMorph: (BoxedMorph new :: color: Color blue;  layoutSpec: upSpec).
	noEdge addMorph: (BoxedMorph new :: color: Color blue;  layoutSpec: upSpec).
	withEdge addMorph: (LabelMorph new :: contents: 'WITH Edge').
	noEdge addMorph: (LabelMorph new :: contents: 'withOUT Edge').
	withEdge addMorph: (BoxedMorph new :: layoutSpec: downSpec).
	noEdge addMorph: (BoxedMorph new ::  layoutSpec: downSpec).
	
	withEdge openInWorld.
	noEdge openInWorld.! !

!PluggableScroll2Pane methodsFor: 'as yet unclassified' stamp: 'RMV 8/17/2024 19:08:48'!
extentChanged: oldExtent
	super extentChanged: oldExtent.
	onExtentChanged ifNotNil: [ onExtentChanged value: self morphExtent ].! !

!PluggableScroll2Pane methodsFor: 'as yet unclassified' stamp: 'RMV 8/17/2024 19:08:33'!
onExtentChanged: aBlock
	onExtentChanged := aBlock! !

!BasicButtonMorph methodsFor: 'drawing' stamp: 'RMV 8/16/2024 16:32:44'!
drawOn: aCanvas
	| rect rectColor |
		
	rect := Rectangle origin: 0@0 extent: self morphExtent.
	rectColor := hovered ifTrue: hoverColor ifFalse: fillColor.
	aCanvas roundRect: rect color: rectColor radius: padding.
	
	aCanvas
		drawString: label
		from: 1
		to: label size
		atBaseline: padding @ (padding + font pointSize)
		font: font
		color: textColor! !

!BasicButtonMorph methodsFor: 'initialization' stamp: 'RMV 8/16/2024 16:32:58'!
initialize
	super initialize.
	
	borderWidth := 0.
	color := Color white.
	fillColor := `Color black alpha: 0.1`.
	font := FontFamily defaultFamilyAndPointSize.
	hovered := false.
	hoverColor := `Color black alpha: 0.2`.
	padding := 10.
	textColor := Color black.! !

!BasicButtonMorph methodsFor: 'event handling' stamp: 'RMV 8/15/2024 19:00:16'!
handlesMouseDown: aMouseEvent
	^ true! !

!BasicButtonMorph methodsFor: 'event handling' stamp: 'RMV 8/15/2024 19:00:16'!
handlesMouseOver: aMouseEvent
	^ true! !

!BasicButtonMorph methodsFor: 'event handling' stamp: 'RMV 8/15/2024 19:11:04'!
label: aString
	label := aString! !

!BasicButtonMorph methodsFor: 'event handling' stamp: 'RMV 8/15/2024 19:02:31'!
mouseButton1Down: aMouseEvent localPosition: aPosition
	onClick ifNotNil: [onClick value]! !

!BasicButtonMorph methodsFor: 'event handling' stamp: 'RMV 8/15/2024 19:00:16'!
mouseEnter: aMouseEvent
	hovered := true.
	self redrawNeeded ! !

!BasicButtonMorph methodsFor: 'event handling' stamp: 'RMV 8/15/2024 19:00:16'!
mouseLeave: aMouseEvent
	hovered := false.
	self redrawNeeded ! !

!BasicButtonMorph methodsFor: 'event handling' stamp: 'RMV 8/15/2024 19:00:16'!
onChange: aBlock
	onChange := aBlock! !

!BasicButtonMorph methodsFor: 'event handling' stamp: 'RMV 8/15/2024 19:02:50'!
onClick: aBlock
	onClick := aBlock! !

!BasicButtonMorph methodsFor: 'accessing' stamp: 'RMV 8/16/2024 13:06:53'!
fillColor
	^ fillColor! !

!BasicButtonMorph methodsFor: 'accessing' stamp: 'RMV 8/16/2024 13:06:38'!
fillColor: aColor
	fillColor := aColor! !

!BasicButtonMorph methodsFor: 'accessing' stamp: 'RMV 8/16/2024 12:56:47'!
font
	^ font! !

!BasicButtonMorph methodsFor: 'accessing' stamp: 'RMV 8/16/2024 12:56:37'!
font: aFont
	font := aFont! !

!BasicButtonMorph methodsFor: 'accessing' stamp: 'RMV 8/15/2024 19:00:16'!
hoverColor
	^ hoverColor! !

!BasicButtonMorph methodsFor: 'accessing' stamp: 'RMV 8/15/2024 19:00:16'!
hoverColor: aColor
	hoverColor := aColor! !

!BasicButtonMorph methodsFor: 'accessing' stamp: 'RMV 8/18/2024 13:59:43'!
morphExtent
	| labelHeight labelWidth |
	font ifNil: [ font := FontFamily defaultFamilyAndPointSize ].
	labelWidth := font widthOfString: label.
	labelHeight := font pointSize. "TODO: correct?"
	^ (padding * 2 + labelWidth) @ (padding * 2 + labelHeight)
	
! !

!BasicButtonMorph methodsFor: 'accessing' stamp: 'RMV 8/15/2024 19:00:16'!
requiresVectorCanvas
	^ true! !

!BasicButtonMorph methodsFor: 'accessing' stamp: 'RMV 8/16/2024 16:32:28'!
textColor
	^ textColor! !

!BasicButtonMorph methodsFor: 'accessing' stamp: 'RMV 8/16/2024 16:32:36'!
textColor: aColor
	textColor := aColor! !

!BasicButtonMorph class methodsFor: 'as yet unclassified' stamp: 'RMV 8/15/2024 19:10:20'!
label: aString onClick: aBlock
	^ self new label: aString; onClick:​ aBlock! !

!BasicCheckboxMorph methodsFor: 'drawing' stamp: 'RMV 8/15/2024 15:58:15'!
drawOn: aCanvas
	| savedColor x y |
	
	hovered ifTrue: [ savedColor := color. color := hoverColor ].
	super drawOn: aCanvas.
	hovered ifTrue: [ color := savedColor ].

	x := self morphExtent x.
	y := self morphExtent y.
	
	checked ifTrue: [
		| p1 p2 p3 width |
		p1 := (0.2 * x) @ (0.6 * y).
		p2 := (0.4 * x) @ (0.8 * y).
		p3 := (0.8 * x) @ (0.2 * y).
		width := x / 8.
		aCanvas line: p1 to: p2 width: width color: borderColor.
		aCanvas line: p2 to: p3 width: width color: borderColor.
	]
! !

!BasicCheckboxMorph methodsFor: 'initialization' stamp: 'RMV 8/15/2024 18:57:09'!
initialize
	super initialize.
	
	borderColor := Color black.
	borderWidth := 1.
	checked := false.
	color := Color white.
	hovered := false.
	hoverColor := borderColor alpha: 0.1.
	self morphExtent: 20 @ 20.
	
	self layoutSpec: (LayoutSpec fixedWidth: (self morphExtent x) fixedHeight: (self morphExtent y))! !

!BasicCheckboxMorph methodsFor: 'event handling' stamp: 'RMV 8/11/2024 19:19:49'!
handlesMouseDown: aMouseEvent
	^ true! !

!BasicCheckboxMorph methodsFor: 'event handling' stamp: 'RMV 8/13/2024 18:42:12'!
handlesMouseOver: aMouseEvent
	^ true! !

!BasicCheckboxMorph methodsFor: 'event handling' stamp: 'RMV 8/11/2024 19:27:43'!
mouseButton1Down: aMouseEvent localPosition: aPosition
	checked := checked not.
	self redrawNeeded.
	onChange ifNotNil: [onChange value: checked]! !

!BasicCheckboxMorph methodsFor: 'event handling' stamp: 'RMV 8/13/2024 18:53:05'!
mouseEnter: aMouseEvent
	hovered := true.
	self redrawNeeded ! !

!BasicCheckboxMorph methodsFor: 'event handling' stamp: 'RMV 8/13/2024 18:49:43'!
mouseLeave: aMouseEvent
	hovered := false.
	self redrawNeeded ! !

!BasicCheckboxMorph methodsFor: 'event handling' stamp: 'RMV 8/11/2024 19:19:49'!
onChange: aBlock
	onChange := aBlock! !

!BasicCheckboxMorph methodsFor: 'accessing' stamp: 'RMV 8/11/2024 19:21:31'!
checked
	^ checked! !

!BasicCheckboxMorph methodsFor: 'accessing' stamp: 'RMV 8/15/2024 18:41:48'!
checked: aBoolean
	checked := aBoolean.
	self redrawNeeded! !

!BasicCheckboxMorph methodsFor: 'accessing' stamp: 'RMV 8/13/2024 18:54:59'!
hoverColor
	^ hoverColor! !

!BasicCheckboxMorph methodsFor: 'accessing' stamp: 'RMV 8/13/2024 18:54:49'!
hoverColor: aColor
	hoverColor := aColor! !

!BasicCheckboxMorph methodsFor: 'accessing' stamp: 'RMV 8/15/2024 08:43:55'!
requiresVectorCanvas
	^ true! !

!CenteredTextEntryMorph methodsFor: 'drawing' stamp: 'RMV 8/17/2024 16:16:50'!
characterIndexAtPoint: aPoint
	| delta line block f pPoint |
	delta := padding negated.
	pPoint := aPoint translatedBy: delta @ delta.
	f := self fontToUse.
	line := TextLine
		start: 1
		stop: contents size
		internalSpaces: 0
		paddingWidth: 0.
	line
		rectangle: (0 @ 0 extent: extent);
		lineHeight: f lineSpacing baseline: f ascent.
	block := (CharacterBlockScanner new text: (contents asText font: f))
		defaultFont: f;
		characterBlockAtPoint: pPoint in: line forCursorPosition: true.
	^ block stringIndex.! !

!CenteredTextEntryMorph methodsFor: 'drawing' stamp: 'RMV 8/5/2024 16:56:34'!
displayTextCursorAtX: x top: top bottom: bottom emphasis: anEmphasis on: aCanvas
	| textCursorColor x1 isBold isItalic x0 h w halfW r d |
	isBold := anEmphasis allMask: 1.
	isItalic := anEmphasis allMask: 2.
	textCursorColor := Theme current textCursor.
	h := bottom - top.
	w := isBold
		ifTrue: [ h // 25 + 2 ]
		ifFalse: [ h // 30 + 1 ].
	halfW := w // 2.
	isItalic
		ifTrue: [
			"Keep tweaking if needed!!"
			d := isBold
				ifTrue: [ 3 ]
				ifFalse: [ h // 24 ].
			x0 := x - (h * 5 // 24) + d.
			x1 := x + d ]
		ifFalse: [
			x0 := x.
			x1 := x ].
	x0 < halfW ifTrue: [
		x1 := x1 - x0 + halfW.
		x0 := halfW ].
	r := extent x - halfW - 1.
	r < x1 ifTrue: [
		x0 := x0 + r - x1.
		x1 := r ].
	textCursorRect := x0 - halfW - 1 @ top corner: x1 + halfW + 1 + 1 @ bottom.
	aCanvas
		line: x0 + halfW @ bottom
		to: x1 + halfW @ (top + w)
		width: w
		color: textCursorColor.! !

!CenteredTextEntryMorph methodsFor: 'drawing' stamp: 'RMV 8/6/2024 08:59:44'!
drawOn: aCanvas
	aCanvas
		fillRectangle: (0 @ 0 extent: extent)
		color: backgroundColor.
	self hasSelection ifTrue: [ self drawSelectionOn: aCanvas ].
	self hasTextCursor ifTrue: [ self drawTextCursorOn: aCanvas ].
	aCanvas
		drawString: contents
		at: padding @ padding
		font: self fontToUse
		color: color.
	borderWidth > 0 ifTrue: [
		aCanvas
			frameRectangle: (0 @ 0 extent: extent x + 1 @ extent y)
			color: borderColor
			borderWidth: borderWidth
			borderStyleSymbol: #simple ].! !

!CenteredTextEntryMorph methodsFor: 'drawing' stamp: 'RMV 8/6/2024 09:00:58'!
drawSelectionOn: aCanvas
	| bottom leftX rightX |
	
	bottom := self baseFont lineSpacing.
	leftX := self fontToUse widthOfString: contents from: 1 to: editor startIndex - 1.
	leftX := leftX min: extent x.
	rightX := self fontToUse widthOfString: contents from: 1 to: editor stopIndex - 1.
	rightX := rightX min: extent x.

	aCanvas
		fillRectangle: (padding + leftX @ padding corner: rightX + padding + 1 @ (padding + bottom + 1))
		color: (Theme current textHighlightFocused: self hasKeyboardFocus).! !

!CenteredTextEntryMorph methodsFor: 'drawing' stamp: 'RMV 8/6/2024 09:01:14'!
drawTextCursorOn: aCanvas
	| bottom x |
	showTextCursor ifTrue: [
		bottom := self baseFont lineSpacing.
		x := self fontToUse
			widthOfString: contents
			from: 1
			to: editor startIndex - 1.
		self
			displayTextCursorAtX: x + padding
			top: padding - 2
			bottom: padding + bottom - 2
			emphasis: emphasis
			on: aCanvas ].! !

!CenteredTextEntryMorph methodsFor: 'initialization' stamp: 'RMV 8/17/2024 18:49:58'!
initialize
	| height lineHeight width |
	super initialize.
	width := self morphExtent x.
	height := self morphExtent y.
	lineHeight := self baseFont lineSpacing.
	padding := (height - lineHeight) / 2.
	self layoutSpec: (LayoutSpec fixedWidth: width fixedHeight: height)
! !

!TextEntry2Morph methodsFor: 'accessing' stamp: 'RMV 8/17/2024 18:31:52'!
escapeAction
	^ escapeAction! !

!TextEntry2Morph methodsFor: 'accessing' stamp: 'RMV 8/17/2024 18:32:07'!
escapeAction: aBlock
	escapeAction := aBlock! !

!TextEntry2Morph methodsFor: 'event handling' stamp: 'RMV 8/17/2024 18:38:10'!
keyStroke: aKeyboardEvent
	(aKeyboardEvent isEsc and: (escapeAction isNil not))
		ifTrue: [	 escapeAction value ]
		ifFalse: [ super keyStroke: aKeyboardEvent ]! !

!Todo methodsFor: 'accessing' stamp: 'RMV 8/15/2024 18:40:33'!
done
	^ checkbox checked! !

!Todo methodsFor: 'accessing' stamp: 'RMV 8/16/2024 19:30:23'!
done: aBoolean
	checkbox checked: aBoolean! !

!Todo methodsFor: 'accessing' stamp: 'RMV 8/15/2024 18:37:36'!
text
	^ label contents! !

!Todo methodsFor: 'accessing' stamp: 'RMV 8/17/2024 16:16:50'!
text: aString
	label contents: aString.
	label redrawNeeded! !

!Todo methodsFor: 'events-registering' stamp: 'RMV 8/13/2024 19:57:26'!
onDelete: aBlock
	onDelete := aBlock! !

!Todo methodsFor: 'events-registering' stamp: 'RMV 8/13/2024 19:57:43'!
onDoneToggle: aBlock
	onDoneToggle := aBlock! !

!Todo methodsFor: 'initialization' stamp: 'RMV 8/17/2024 15:09:35'!
handleLabelClick: aMouseEvent
	aMouseEvent logAs: 'Todo handleLabelClick: aMouseEvent'.! !

!Todo methodsFor: 'initialization' stamp: 'RMV 8/17/2024 19:59:10'!
initialize
	| button buttonFont |
	
	checkbox := BasicCheckboxMorph new.
	checkbox onChange: [:checked |
		label color: (checked ifTrue: [ Color gray ] ifFalse: [ Color black ]).
		label font: (checked ifTrue: [ labelFont struckThrough ] ifFalse: [ labelFont ]).
		onDoneToggle value: checked
	].
	
	label := EditableLabelMorph new leftTopAlign.
	label layoutSpec proportionalWidth: 1.
	labelFont := label font.
	
	"The Kurinto Sans font is the only one I've found so far
	that contains the wastebasket Unicode character.
	This font must be installed!!"
	buttonFont := FontFamily familyName: 'Kurinto Sans' pointSize: 18.

	button := BasicButtonMorph
		label: '🗑' "wastebasket Unicode character"
		onClick: [onDelete value].
	button fillColor: Color transparent; textColor: Color red.
	button font: buttonFont.
		
	row := Layout2Morph newRow useEdgeSpace: false.
	"row borderColor: Color red; borderWidth: 1."
	row color: Color transparent.
	row layoutSpec proportionalWidth: 1.
	
	row separation: 10@0.
	row addMorph: checkbox.
	row addMorph: label.
	row addMorph: button.
	
	"Center the submorphs vertically."
	row submorphsDo: [:morph | morph layoutSpec offAxisEdgeWeight: 0.5]! !

!Todo methodsFor: 'morphic' stamp: 'RMV 8/15/2024 18:29:07'!
morph
	^ row! !

!Todo class methodsFor: 'instance creation' stamp: 'RMV 8/17/2024 16:16:50'!
text: aString
	^ self new text: aString; done: false! !

!TodoApp methodsFor: 'initialization' stamp: 'RMV 8/18/2024 14:01:08'!
initialize
	| button layout lightBlue row titleLabel |

	titleLabel := LabelMorph new
		contents: 'To Do List';
		color: Color blue.
	
	statusLabel := LabelMorph new
		color: Color gray.
	
	todoEntry := CenteredTextEntryMorph contents: ''.
	todoEntry layoutSpec fixedWidth: 240.
	todoEntry crAction: [ self addTodoFromEntry ].
	
	button := BasicButtonMorph label: 'Add' onClick: [ self addTodoFromEntry ].
	
	row := LayoutMorph newRow
		color: Color transparent.
	row layoutSpec proportionalHeight: 0. "defaults to 1"
	row addMorphs: {todoEntry. button} withSpace: 10.

	todosPane := Layout2Morph newColumn useEdgeSpace: false.
	todosPane layoutSpec proportionalWidth: 1.
	todosPane color: Color transparent.

	scrollPane := PluggableScroll2Pane new.
	scrollPane layoutSpec 	proportionalWidth: 1.
	scrollPane layoutSpec proportionalHeight: 1 minimum: 100.
	scrollPane hHideScrollBar.
	scrollPane color: Color transparent.
	scrollPane scroller: todosPane.
	scrollPane onExtentChanged: [ :newExtent |
		todosPane morphExtent: (scrollPane hScrollBarWidth - 10) @ todosPane morphExtent y.
	].

	todos := OrderedCollection new.
	
	"Add initial todos for testing."
	#('buy milk' 'cut grass' 'ride bike' 'run' 'study Smalltalk') do: [ :text |
		self addTodo: text atStart: false
	].

	statusLabel contents: self status.
	
	lightBlue := Color r: 0.450 g: 0.600 b: 0.850.
	window := SystemWindow new
		borderColor: lightBlue;
		setLabel: 'Todo App'.

	layout := window layoutMorph.
	layout color: Color white; separation: 20.
	layout addMorph: titleLabel.
	layout addMorph: statusLabel.
	layout addMorph: row.
	layout addMorph: scrollPane.
	
	todosPane submorphsDo: [:morph | morph leftTopAlign].
	layout submorphsDo: [:morph | morph leftTopAlign].
		
	"This causes the SystemWindow to be sized incorrectly ... too small."
	"window openAtCursor."
	window openInWorld.
	
	"Size the window to the minimum size that holds the contents.
	 This must be done AFTER sending #openInWorld!!"
	window morphExtent: window minimumExtent! !

!TodoApp methodsFor: 'accessing' stamp: 'RMV 8/15/2024 18:46:56'!
status
	| remaining |
	remaining := todos
		inject: 0
		into: [ :acc :todo |
			todo done ifTrue: acc ifFalse: acc + 1
		].
	^ '{1} of {2} remaining' format: {remaining. todos size}.! !

!TodoApp methodsFor: 'private' stamp: 'RMV 8/18/2024 06:10:57'!
addTodo: aString atStart: aBoolean
	| todo |
	todo := Todo text: aString.
	todo onDoneToggle: [ :done |
		statusLabel contents: self status
	].
	todo onDelete: [
		todos removeAllSuchThat: [:t | t text = todo text].
		todosPane removeMorph: todo morph.
		todosPane morphExtent: todosPane morphExtent x @ todosPane minimumExtent y.
		statusLabel contents: self status.
	].
	todos add: todo.
	aBoolean
		ifTrue: [ todosPane addMorphBack: todo morph ]
		ifFalse: [ todosPane addMorph: todo morph]
! !

!TodoApp methodsFor: 'private' stamp: 'RMV 8/11/2024 15:10:24'!
addTodoFromEntry
	| text |
	text := todoEntry contents.
	text isEmpty ifFalse: [
		self addTodo: text atStart: true.
		todoEntry contents: ''.
		todoEntry keyboardFocusChange: true
	]! !

!Object methodsFor: '*TodoApp' stamp: 'RMV 6/14/2024 16:53:19'!
logAs: aString
	('{1} = {2}' format: {aString. self}) print! !

!Morph methodsFor: '*TodoApp' stamp: 'RMV 8/4/2024 18:35:39'!
leftTopAlign
	self layoutSpec offAxisEdgeWeight: 0.
! !

!LayoutMorph methodsFor: '*TodoApp' stamp: 'RMV 8/5/2024 16:42:08'!
addMorphs: anArray withSpace: aNumber
	"Adds each morph in anArray with a spacer morph between them whose width is aNumber."
	anArray
		do: [ :morph | self addMorph: morph]
		separatedBy: [
			| spacer |
			spacer := BoxedMorph new morphExtent: 10@10; borderWidth: 0; color: Color transparent.
			self addMorph: spacer
		]! !
