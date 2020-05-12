Class {
	#name : #Answer,
	#superclass : #Interaction,
	#instVars : [
		'question'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
Answer class >> new: aDescription user: aUser question: aQuestion [
	^ (self newWithUser: aUser andDescription: aDescription)
		question: aQuestion;
		yourself
]

{ #category : #private }
Answer >> question: aQuestion [
	question := aQuestion 
]
