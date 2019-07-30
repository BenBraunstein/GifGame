class GameForm < ApplicationRecord
    has_many :games
    has_many :users, through: :games
    has_many :game_questions

    after_create :make_game_questions
    
    def questions
        self.game_questions.collect{|game_question| game_question.question}
    end

    def make_game_questions

        game_form = GameForm.last

        style_hash = {syn: {class: QuestionSyn, question_number: 5, question_type: "QuestionSyn"},
                      dog: {class: QuestionDog, quesiton_number: 10, question_type: "QuestionDog"},
                      mov: {class: QuestionMov, question_number: 8, question_type: "QuestionMov"},
                      mat: {class: QuestionMat, question_number: 4, question_type: "QuestionMat"}}


        style_hash[game_form.style.to_sym][:class].all.sample(style_hash[game_form.style.to_sym][:question_number]).each do |question|


            GameQuestion.create(game_form_id: game_form.id, question_type: style_hash[game_form.style.to_sym][:question_type], question_id: question.id)

        end
        
    end



end