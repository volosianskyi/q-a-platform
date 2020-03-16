class AnswersController < ActionController::Base
  def create
    permitted_params = params.permit(:question_id, :text)
    Answer.create!(text: permitted_params[:text],
                   user_id: User.first.id,
                   question: permitted_params[:question_id])
    redirect_to "/questions/#{params[:question_id]}"
  end

  def destroy
    respond_to do |format|
      format.html
      format.js
    end    
    #Answer.find(params[:id]).destroy!
    #redirect_to "/questions/#{params[:question_id]}"
  end
end