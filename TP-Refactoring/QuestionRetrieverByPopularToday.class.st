Class {
	#name : #QuestionRetrieverByPopularToday,
	#superclass : #QuestionRetriever,
	#category : #'TP-Refactoring-Model'
}

{ #category : #retrieving }
QuestionRetrieverByPopularToday >> getColection: aUser [
	^ self filterByAverage: self questionCreatedToday
]
