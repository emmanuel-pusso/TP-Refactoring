Class {
	#name : #QuestionRetrieverBySocial,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #retrieving }
QuestionRetrieverBySocial >> getColection: aUser [
	^ self getAllQuestions: aUser following
]
