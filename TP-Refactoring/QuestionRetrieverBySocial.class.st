Class {
	#name : #QuestionRetrieverBySocial,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #retrieving }
QuestionRetrieverBySocial >> getCollection: aUser [
	^ self getAllQuestions: aUser following
]
