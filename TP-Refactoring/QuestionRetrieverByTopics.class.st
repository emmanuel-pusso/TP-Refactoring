Class {
	#name : #QuestionRetrieverByTopics,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #retrieving }
QuestionRetrieverByTopics >> getColection: aUser [
	^ self getAllQuestions: aUser topics
]
