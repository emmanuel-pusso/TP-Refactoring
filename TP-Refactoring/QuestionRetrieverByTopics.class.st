Class {
	#name : #QuestionRetrieverByTopics,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #retrieving }
QuestionRetrieverByTopics >> getCollection: aUser [
	^ self getAllQuestions: aUser topics
]
