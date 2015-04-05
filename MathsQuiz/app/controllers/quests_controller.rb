class QuestsController < ApplicationController
  before_action :set_quest, only: [:show, :edit, :update, :destroy]

  respond_to :html

  require 'Mathques'
  require 'Checkques'

 def displayquest
 $question1, $answ1, $question2, $answ2, $question3, $answ3, $question4, $answ4, $question5, $answ5, $question6, $answ6, $question7, $answ7, $question8, $answ8, $question9, $answ9, $question10, $answ10 = Generate.createquestions()
end



  def index
  @quests = Quest.all
respond_with(@quests)
  end



 def mathques
 @input1 = params[:search_string]
 @result = Generate.createquestions(@input1.to_i)
 end


  def show
    respond_with(@quest)
  end

  def new
    @quest = Quest.new
    respond_with(@quest)
  end

  def edit
  end

  def create
    @quest = Quest.new(quest_params)
    @quest.save
    respond_with(@quest)
  end

  def update
    @quest.update(quest_params)
    respond_with(@quest)
  end

  def destroy
    @quest.destroy
    respond_with(@quest)
  end

  private
    def set_quest
      @quest = Quest.find(params[:id])
    end

    def quest_params
      params.require(:quest).permit(:questions, :answer)
    end
end
