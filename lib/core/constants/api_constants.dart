const String apiEndpoint = 'https://nell-assistant.herokuapp.com/graphql';

// question queries
const String questionQuery = ''' 
    query getQuestion(\$input: FindQuestion) {
      findQuestion(input: \$input) {
        question
        id
        
        answers {
          answer
          totalChosen
        }
        
        answeredBy {
          id
        }
        
        correctAnswer
      }
    }
''';

const String addQuestionQuery = ''' 
    mutation AddQuestion(\$input: AddQuestion) {
      addQuestion(input: \$input) {
        id
        question
      }
    }
''';

const String deleteQuestionsQuery = ''' 
    mutation DeleteQuestions(\$input:RemoveQuestions){
      removeQuestions(input: \$input)
    }
''';

const String answerQuestionQuery = ''' 
    mutation AnswerQuestion(\$input: AnswerQuestion) {
      answerQuestion(input: \$input) {
        id
        question
        correctAnswer
        answers {
          answer
          totalChosen
        }
        answeredBy {
          id
        }
      }
    }
''';

const String makeQuestionCurrentQuery = ''' 
    mutation AddCurrentQuestion(\$input:CurrentQuestion){
      addCurrentQuestion(input: \$input)
    }
  ''';

const String removeCurrentQuestionsQuery = ''' 
    mutation RemoveCurrentQuestions(\$input:RemoveCurrentQuestions){
      removeCurrentQuestions(input: \$input)
    }
''';

// exam queries

const String createExamQuery = ''' 
    mutation CreateExam(\$input: CreateExam) {
      createExam(input: \$input){
        id
        name
        description
      }
    }
''';

const String deleteExamsQuery = ''' 
    mutation DeleteExams(\$input: RemoveExams) {
      removeExams(input: \$input)
    }
''';

// feedback queries

const String feedbackQuery = ''' 
    mutation Feedback(\$input: SubjectFeedback) {
      subjectFeedback(input: \$input)
    }
''';

const String clearFeedbackQuery = ''' 
    mutation ClearFeedback(\$input: ClearFeedback) {
      clearFeedback(input: \$input)
    }
''';

// user queries

const String addAdminQuery = '''
    mutation AddAdmin(\$input: AddAdmin){
      addAdmin(input: \$input)
    }
''';

// dictionary queries.

const String addDefinitionQuery = ''' 
    mutation AddDefinition(\$input: AddDefinition) {
      addDefinition(input: \$input) {
        id
        phrase
        definition
      }
    }
''';

const String deleteDefinitionsQuery = ''' 
    mutation DeleteDefinitions(\$input: RemoveDefinitions){
      removeDefinitions(input: \$input)
    }
''';

// subject queries
const String subjectsQuery = '''
    query {

      me {

        subjects {
          admin
          
          subject {
            name
            id

            questions {
              id
              question
            }

            currentQuestions {
              question
              id
            }

            dictionary {
              id
              phrase
              definition
            }

            exams {
              id
              name
              description
            }

            feedback

            users {
              email
              name
              id
            }

            admins {
              name
              email
              id
            }
          }
        }
      }
    }
''';

const String joinSubjectQuery = ''' 
    mutation JoinSubject(\$input: JoinSubject) {
      joinSubject(input: \$input) {
        id
        name

        questions {
          id
          question
        }

        currentQuestions {
          question
          id
        }

        dictionary {
          id
          phrase
          definition
        }

        exams {
          id
          name
          description
        }

        feedback

        users {
          email
          name
          id
        }

        admins {
          name
          email
          id
        }
      }
    }
''';

const createSubjectQuery = ''' 
    mutation CreateSubject(\$input: CreateSubject) {
      createSubject(input: \$input) {
        id
        name

        questions {
          id
          question
        }

        currentQuestions {
          question
          id
        }

        dictionary {
          id
          phrase
          definition
        }

        exams {
          id
          name
          description
        }

        feedback

        users {
          email
          name
          id
        }

        admins {
          name
          email
          id
        }
      }
    }
''';

const String leaveSubjectQuery = ''' 
    mutation LeaveSubject(\$input: LeaveSubject) {
      leaveSubject(input: \$input)
    }
''';

const String deleteSubjectQuery = ''' 
    mutation DeleteSubject(\$input: DeleteSubject) {
      deleteSubject(input: \$input)
    }
''';
