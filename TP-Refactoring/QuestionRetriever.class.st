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

{ #category : #private }
QuestionRetriever >> averageVotes [
^ (cuoora questions sum: [ :q | q positiveVotes size ]) / self questionCreatedToday size.
]

{ #category : #accesing }
QuestionRetriever >> cuoora: aCuooraInstance [
	cuoora := aCuooraInstance 
]

{ #category : #private }
QuestionRetriever >> filterByAverage: aColection [
	^ aColection
		select: [ :q | q positiveVotes size >= self averageVotes ]
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

{ #category : #private }
QuestionRetriever >> questionCreatedToday [
	^ cuoora questions
		select: [ :each | each timestamp asDate = Date today ]
]

{ #category : #retrieving }
QuestionRetriever >> retrieveQuestions: aUser [
	^ (self
		getLastForCollectionSortByPositiveVotes: (self getCollection: aUser))
		reject: [ :q | q user = aUser ]
]
