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
	^ (self newWithUser: aUser)
		description: anAnswer;
		question: aQuestion;
		yourself
]

{ #category : #private }
Answer >> question: aQuestion [
	question := aQuestion 
]
