Class {
	#name : #QuestionRetrieverByNews,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #retrieving }
QuestionRetrieverByNews >> getColection: aUser [
	^ self questionCreatedToday
]
