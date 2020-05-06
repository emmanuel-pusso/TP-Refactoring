Class {
	#name : #QuestionRetriever,
	#superclass : #Object,
	#instVars : [
		'option',
		'cuoora'
	],
	#category : #'TP-Refactoring-Model-Model'
}

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora [
	^ self new cuoora: cuoora
]

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora and: aSymbol [
	^ self new cuoora: cuoora; option:aSymbol; yourself.
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

{ #category : #private }
QuestionRetriever >> getLastForColectionSortByPositiveVotes: aColection [
	^ (aColection
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ])
		last: (100 min: aColection size)
]

{ #category : #initializing }
QuestionRetriever >> initialize [
	option := #social
]

{ #category : #accesing }
QuestionRetriever >> option: anOption [
	option := anOption
]

{ #category : #private }
QuestionRetriever >> questionCreatedToday [
	^ cuoora questions
		select: [ :each | each timestamp asDate = Date today ]
]

{ #category : #retrieving }
QuestionRetriever >> retrieveQuestions: aUser [
	| qRet |
	qRet := OrderedCollection new.
	option = #social
		ifTrue: [ qRet := self
				getLastForColectionSortByPositiveVotes: (self getAllQuestions: aUser following) ].
	option = #topics
		ifTrue: [ qRet := self
				getLastForColectionSortByPositiveVotes: (self getAllQuestions: aUser topics) ].
	option = #news
		ifTrue: [ qRet := self
				getLastForColectionSortByPositiveVotes: self questionCreatedToday ].
	option = #popularToday
		ifTrue: [ qRet := self
				getLastForColectionSortByPositiveVotes: (self filterByAverage: self questionCreatedToday) ].
	^ qRet reject: [ :q | q user = aUser ]
	

]
