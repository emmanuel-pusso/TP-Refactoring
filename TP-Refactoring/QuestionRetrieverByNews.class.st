Class {
	#name : #QuestionRetrieverByNews,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #retrieving }
QuestionRetrieverByNews >> getCollection: aUser [
	^ self questionCreatedToday
]
