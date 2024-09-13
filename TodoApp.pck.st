'From Cuis7.1 [latest update: #6684] on 13 September 2024 at 11:02:21 am'!
'Description I created this package to learn more about Morphic.'!
!provides: 'TodoApp' 1 416!
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

!classDefinition: #TodosPane category: #TodoApp!
LayoutMorph subclass: #TodosPane
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TodoApp'!
!classDefinition: 'TodosPane class' category: #TodoApp!
TodosPane class
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

!BasicButtonMorph commentStamp: 'RMV 8/18/2024 14:46:14' prior: 0!
This is a basic button morph that is simpler and easier to understand that PluggableButtonMorph.!

!BasicCheckboxMorph commentStamp: 'RMV 8/18/2024 14:46:57' prior: 0!
This is a basic checkbox morph that is simpler and easier to understand that CheckButtonMorph.
It also has a look that I find more intuitive.!

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

!EditableLabelMorph methodsFor: 'as yet unclassified' stamp: 'rmv 9/1/2024 12:00:31'!
initialize
	super initialize.
	super color: Color transparent.
	
	label := LabelMorph new.
	self addMorph: label.
	
	textEntry := TextEntryMorph new.
	textEntry crAction: [
		label contents: textEntry contents.
		textEntry visible: false.
		label visible: true.
	].

	"TextEntryMorph uses an instance of SimpleTextEditor which is a subclass of Editor.
	The Editor class method initializeKeyboardActions configures
	the action for pressing the escape key be #offerMenuFromEsc:.
	We are using the escape key to trigger hiding the TextEntryMorph and resetting its value.
	So the next line disables showing the help popup."
	textEntry editor class keyboardActions at: 27 + 1 put: #noop:.
	
	textEntry setProperty: #keyStroke: toValue: [ :event |
		event isEsc ifTrue: [
			textEntry visible: false.
			label visible: true.
			textEntry contents: label contents.
		]
	].

	textEntry visible: false.
	self addMorph: textEntry.! !

!EditableLabelMorph methodsFor: 'as yet unclassified' stamp: 'rmv 8/20/2024 08:34:52'!
mouseButton1Down: aMouseEvent localPosition: aPosition
	| worldPosition |
	worldPosition := aMouseEvent eventPosition.
	(label coversPixel: worldPosition) ifTrue: [
		label visible: (label visible not).
		textEntry visible: textEntry visible not.
	]! !

!EditableLabelMorph methodsFor: 'as yet unclassified' stamp: 'RMV 8/17/2024 16:16:50'!
text: aString
	label contents: aString.
	textEntry contents: aString.! !

!EditableLabelMorph class methodsFor: 'as yet unclassified' stamp: 'rmv 8/24/2024 12:12:51'!
new
	"It's necessary to override this method because otherwise
	the superclass LayoutMorph new method triggers an error."
	^ self newRow! !

!TodosPane methodsFor: 'initialization' stamp: 'rmv 9/13/2024 11:00:49'!
initialize
	super initialize.
	self adjustExtent.
	self color: Color transparent.
	! !

!TodosPane methodsFor: 'change reporting' stamp: 'rmv 9/12/2024 21:05:19'!
adjustExtent
	owner ifNotNil: [ self morphWidth: owner viewableWidth ]! !

!TodosPane class methodsFor: 'as yet unclassified' stamp: 'rmv 9/12/2024 20:32:54'!
new
	^ self newColumn! !

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

!Todo methodsFor: 'initialization' stamp: 'rmv 9/13/2024 11:01:11'!
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
		
	row := LayoutMorph newRow.
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

!Todo class methodsFor: 'as yet unclassified' stamp: 'RMV 8/19/2024 15:21:14'!
initialize
	TrueTypeFontFamily readAllTrueTypeFontsIn: (DirectoryEntry trueTypeFontsDirectory / 'KurintoSans')! !

!TodoApp methodsFor: 'initialization' stamp: 'rmv 9/13/2024 10:59:40'!
initialize
	| button extent layout lightBlue row titleLabel |

	titleLabel := LabelMorph new
		contents: 'To Do List';
		color: Color blue.
	
	statusLabel := LabelMorph new
		color: Color gray.
	
	todoEntry := TextEntryMorph contents: ''.
	todoEntry layoutSpec proportionalWidth: 1.
	todoEntry crAction: [ self addTodoFromEntry ].
	
	button := BasicButtonMorph label: 'Add' onClick: [ self addTodoFromEntry ].
	
	row := LayoutMorph newRow
		color: Color transparent;
		separation: 10.
	row layoutSpec proportionalHeight: 0. "defaults to 1"
	row addMorph: todoEntry.
	row addMorph: button.

	todosPane := TodosPane new.

	scrollPane := PluggableScrollPane new.
	scrollPane layoutSpec 	proportionalWidth: 1.
	scrollPane layoutSpec proportionalHeight: 1 minimum: 100.
	scrollPane hHideScrollBar.
	scrollPane color: Color transparent.
	scrollPane scroller: todosPane.

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
	layout color: Color white; padding: 10; separation: 20.
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
	 This must be done AFTER sending #openInWorld!!
	 This stopped working correctly and I don't know why."
	"window morphExtent: window minimumExtent."
	extent := window minimumExtent.
	window morphExtent: 300 @ extent y.! !

!TodoApp methodsFor: 'accessing' stamp: 'RMV 8/15/2024 18:46:56'!
status
	| remaining |
	remaining := todos
		inject: 0
		into: [ :acc :todo |
			todo done ifTrue: acc ifFalse: acc + 1
		].
	^ '{1} of {2} remaining' format: {remaining. todos size}.! !

!TodoApp methodsFor: 'private' stamp: 'rmv 8/24/2024 13:12:14'!
addTodo: aString atStart: aBoolean
	| todo |
	todo := Todo text: aString.
	todo onDoneToggle: [ :done |
		statusLabel contents: self status
	].
	todo onDelete: [
		todos removeAllSuchThat: [:t | t text = todo text].
		todosPane removeMorph: todo morph.
		todosPane morphHeight: todosPane minimumExtent y.
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
Todo initialize!
