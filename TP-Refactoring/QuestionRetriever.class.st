Class {
	#name : #QuestionRetriever,
	#superclass : #Object,
	#instVars : [
		'cuoora'
	],
	#category : #'TP-Refactoring-Model'
}

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora [
	^ self new cuoora: cuoora
]

{ #category : #accesing }
QuestionRetriever >> cuoora: aCuooraInstance [
	cuoora := aCuooraInstance 
]

{ #category : #private }
QuestionRetriever >> filterByAverage: aColection [
	^ aColection
		select: [ :q | q positiveVotes size >= cuoora averageVotes ]
]

{ #category : #private }
QuestionRetriever >> getAllQuestions: aColection [
	^ aColection flatCollect: [ :each | each questions ]
]

{ #category : #retrieving }
QuestionRetriever >> getCollection: aUser [
	^ self subclassResponsibility
]

{ #category : #private }
QuestionRetriever >> getLastForCollectionSortByPositiveVotes: aColection [
	^ (aColection
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ])
		last: (100 min: aColection size)
]

{ #category : #retrieving }
QuestionRetriever >> retrieveQuestions: aUser [
	^ (self
		getLastForCollectionSortByPositiveVotes: (self getCollection: aUser))
		reject: [ :q | q user = aUser ]
]
