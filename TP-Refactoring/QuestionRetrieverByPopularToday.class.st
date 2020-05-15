Class {
	#name : #QuestionRetrieverByPopularToday,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #retrieving }
QuestionRetrieverByPopularToday >> getCollection: aUser [
	^ self filterByAverage: self questionCreatedToday
]
