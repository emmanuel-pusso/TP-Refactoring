Class {
	#name : #Question,
	#superclass : #Interaction,
	#instVars : [
		'title',
		'answers',
		'topics'
	],
	#category : #'TP-Refactoring-Model-Model'
}

{ #category : #'instance creation' }
Question class >> newWithTitle: title description: aDescription user: aUser [
	^(self
		newWithUser: aUser)
		title: title;
		description: aDescription; yourself
]

{ #category : #'instance creation' }
Question class >> newWithTitle: title description: aDescription user: aUser topic: aTopic [
	^(self
		newWithUser: aUser)
		title: title;
		description: aDescription;
		addTopic: aTopic;
		yourself.
]

{ #category : #adding }
Question >> addTopic: aTopic [
	topics add: aTopic.
	aTopic addQuestion: self.

]

{ #category : #'initalize-release' }
Question >> initialize [
	super initialize.
	answers := OrderedCollection new.
	topics := OrderedCollection new.

]

{ #category : #accessing }
Question >> title [
	^title 
]

{ #category : #accessing }
Question >> title: aTitle [
	title := aTitle 
]

{ #category : #accessing }
Question >> topics [
	^topics 
]
