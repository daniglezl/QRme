class PollAnswersController < ApplicationController
  before_action :set_poll_answer, only: [:show, :edit, :update, :destroy]

  # GET /poll_answers
  # GET /poll_answers.json
  def index
    @poll_answers = PollAnswer.all
  end

  # GET /poll_answers/1
  # GET /poll_answers/1.json
  def show
  end

  # GET /poll_answers/new
  def new
    poll = Poll.find(params[:poll_id])
    @poll_answer = poll.poll_answers.build
  end

  # GET /poll_answers/1/edit
  def edit
    poll_answer = PollAnswer.find(params[:id])
    @poll_answer = PollAnswer.find(params[:id])
    votes = poll_answer.voteCount + 1
    @poll_answer.update_attribute(:voteCount, votes )
    poll_id = poll_answer.poll_id
    @poll = Poll.find(poll_id)
  end

  # POST /poll_answers
  # POST /poll_answers.json
  def create
    poll = Poll.find(params[:poll_id])
    @poll_answer = poll.poll_answers.build poll_answer_params
    @poll_answer.update_attribute(:voteCount, 0 )
    @poll_answer.save
    @poll = Poll.find(params[:poll_id])
  end

  # PATCH/PUT /poll_answers/1
  # PATCH/PUT /poll_answers/1.json
  def update
    @poll_answer = Poll.find(params[:id])
    @poll_answer.update_attributes(poll_answer_params)
    @poll = @poll_answer.poll
  end

  # DELETE /poll_answers/1
  # DELETE /poll_answers/1.json
  def destroy
    @poll_answer = PollAnswer.find(params[:id])
    @poll = @poll_answer.poll
    @poll_answer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll_answer
      @poll_answer = PollAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_answer_params
      params.require(:poll_answer).permit(:poll_id, :title, :voteCount)
    end
end
