require 'test_helper'

class MainMailerTest < ActionMailer::TestCase
  test "notify_question_author" do
  	question = Question.create email: 'author@question.com', body: 'a test question'
  	
  	answer = Answer.create email: 'author@answer.com', body: 'a test body answer'
  	#run rake db:test:prepare for complete the task
  	question.answers << answer

    mail = MainMailer.notify_question_author(answer)
    assert_equal "New Answer To Yout Question", mail.subject
    assert_equal [question.email], mail.to
    assert_equal [answer.email], mail.from
    assert_match  answer.body, mail.body.encoded
  end

end
