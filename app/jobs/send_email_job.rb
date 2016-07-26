class SendEmailJob 
  include SuckerPunch::Job
  
  def perform(answer)
	MainMailer.notify_question_author(answer).deliver_later
  end
end
