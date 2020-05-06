Class {
	#name : #Interaction,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'user',
		'votes',
		'description'
	],
	#category : #'TP-Refactoring-Model-Model'
}

{ #category : #adding }
Interaction >> addVote: aVote [
	votes add: aVote
]

{ #category : #accessing }
Interaction >> description [
	^ description
]

{ #category : #private }
Interaction >> description: anObject [
	description := anObject
]

{ #category : #'as yet unclassified' }
Interaction >> negativeVotes [

	^votes reject: [ :each | each isLike ]
]

{ #category : #accessing }
Interaction >> timestamp [
	^ timestamp
]

{ #category : #private }
Interaction >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #accessing }
Interaction >> user [
	^ user
]

{ #category : #private }
Interaction >> user: anObject [
	user := anObject
]

{ #category : #accessing }
Interaction >> votes [
	^ votes
]