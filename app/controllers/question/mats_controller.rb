
class Question::MatsController < ApplicationController

before_action :authorized?
before_action :authorized_admin?

  def index
    @questions = QuestionMat.all
  end

  def show
    @question = QuestionMat.find(params[:id])
  end

  def new
    # Make an empty array that will store questions
    @possible_questions = []
    @search_terms = []
    #Get popular words
    uri = URI.parse("https://api.tenor.com/v1/trending_terms?key=#{ENV["TENOR_KEY"]}&limit=50")
    response = Net::HTTP.get_response(uri)
    trending_word_array = JSON.parse(response.body)["results"]
    # Loop some amount of times
    5.times do
      random_word = trending_word_array.sample
      # The three
      uri = URI.parse("https://api.tenor.com/v1/search?q=#{random_word}&key=#{ENV["TENOR_KEY"]}&limit=50")
      response = Net::HTTP.get_response(uri)
      body = JSON.parse(response.body)
      top_ten = body["results"][0..9]
      bottom_ten = body["results"][40..49]
      three_wrongs = top_ten.map { |gif| gif["media"].first["gif"]["url"] }.sample(3)
      answer_gif = bottom_ten.map { |gif| gif["media"].first["gif"]["url"] }.sample
      # Find a similar word
      # Dinosaurus.configure { |config| config.api_key = "c8a5353f0fd3be8f2caef84d59d355ea" }
      # synonym = Dinosaurus.synonyms_of(random_word)
      # uri = URI.parse("https://api.tenor.com/v1/search_suggestions?q=#{random_word}&key=#{ENV["TENOR_KEY"]}&limit=50")
      # response = Net::HTTP.get_response(uri)
      # synonym = JSON.parse(response.body)["results"].sample
      # # Search for a gif using the similar word
      # uri = URI.parse("https://api.tenor.com/v1/search?q=#{synonym}&key=#{ENV["TENOR_KEY"]}&limit=50")
      # response = Net::HTTP.get_response(uri)
      # answer_gif = JSON.parse(response.body)["results"].map { |gif| gif["media"].first["gif"]["url"] }.sample

      q = QuestionMat.new(a: answer_gif, w1: three_wrongs[0], w2: three_wrongs[1], w3: three_wrongs[2], search_term: random_word)
      @possible_questions << q
    end
  end

  def create
    length = (1..params["length"].to_i)
    length.each do |index|
      if params["q#{index}"] == "yes"
        QuestionMat.create(strong_question_params(index))
      end
    end
    redirect_to question_mats_path
  end

  def destroy
    QuestionMat.destroy(params[:id])
      redirect_to question_mats_path
  end

  private

  def strong_question_params(index)
    {
      a: params["q#{index}_a"],
      w1: params["q#{index}_w1"],
      w2: params["q#{index}_w2"],
      w3: params["q#{index}_w3"],
      search_term: params["q#{index}_search_term"]
    }
  end
end
