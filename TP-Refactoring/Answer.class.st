Class {
	#name : #Answer,
	#superclass : #Interaction,
	#instVars : [
		'question'
	],
	#category : #'TP-Refactoring-Model-Model'
}

{ #category : #'instance creation' }
Answer class >> new: anAnswer user: aUser question: aQuestion [
	^ self new
		description: anAnswer;
		user: aUser;
		question: aQuestion;
		yourself
]

{ #category : #initialize }
Answer >> initialize [
	votes := OrderedCollection new.
	timestamp := DateAndTime now.
]

{ #category : #private }
Answer >> question: aQuestion [
	question := aQuestion 
]
