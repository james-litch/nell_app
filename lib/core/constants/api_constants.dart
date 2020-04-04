const String apiEndpoint = 'https://nell-assistant.herokuapp.com/graphql';

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

  const String feedbackQuery = ''' 
  
    mutation Feedback(\$input: SubjectFeedback) {
      subjectFeedback(input: \$input)
    }

  ''';

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

