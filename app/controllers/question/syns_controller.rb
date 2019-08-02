class Question::SynsController < ApplicationController

  before_action :authorized?
  before_action :authorized_admin?

  def index
    @questions = QuestionSyn.all
  end

  def show
    @question = QuestionSyn.find(params[:id])
  end

  def new
    # Make an empty array that will store questions
    @possible_questions = []
    #Get popular words
    uri = URI.parse("https://api.tenor.com/v1/trending_terms?key=#{ENV["TENOR_KEY"]}&limit=50")
    response = Net::HTTP.get_response(uri)
    trending_word_array = JSON.parse(response.body)["results"]
    10.times do
      random_word = trending_word_array.sample.split.first
      uri = URI.parse("https://api.tenor.com/v1/search_suggestions?q=#{random_word}&key=#{ENV["TENOR_KEY"]}")
      response = Net::HTTP.get_response(uri)
      synonym_array = JSON.parse(response.body)["results"]
      three_wrongs = synonym_array.sample(3)
      uri = URI.parse("https://api.tenor.com/v1/search?q=#{random_word}&key=#{ENV["TENOR_KEY"]}&limit=20")
      response = Net::HTTP.get_response(uri)
      body = JSON.parse(response.body)
      gif_urls = body["results"].map { |gif| gif["media"].first["gif"]["url"] }
      random_gif = gif_urls.sample
      q = QuestionSyn.new(gif: random_gif, a: random_word, w1: three_wrongs[0], w2: three_wrongs[1], w3: three_wrongs[2])
      @possible_questions << q
    end
  end

  def create
    length = (1..params["length"].to_i)
    length.each do |index|
      if params["q#{index}"] == "yes"
        QuestionSyn.create(strong_question_params(index))
      end
    end
    redirect_to question_syn_path
  end

  def destroy
    QuestionSyn.destroy(params[:id])
    redirect_to question_syns_path
  end

  private

  def strong_question_params(index)
    {
      gif: params["q#{index}_gif"],
      a: params["q#{index}_a"],
      w1: params["q#{index}_w1"],
      w2: params["q#{index}_w2"],
      w3: params["q#{index}_w3"],
    }
  end
end
