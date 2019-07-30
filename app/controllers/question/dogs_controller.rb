class Question::DogsController < ApplicationController
    def index
      @questions = QuestionDog.all
    end
  
    def show
      @question = QuestionDog.find(params[:id])
    end
  
    def new 
      # Make an empty array that will store questions
      @possible_questions = []
      #Get dog breeds

      

      10.times do
        # Find gifs of species
        gif_urls = []
        while gif_urls == []
          rand_dog = Faker::Creature::Dog.breed
          random_word = "#{rand_dog} dog"
          three_wrongs = [Faker::Creature::Dog.unique.breed, Faker::Creature::Dog.unique.breed, Faker::Creature::Dog.unique.breed]
          uri = URI.parse("https://api.tenor.com/v1/search?q=#{random_word}&key=#{ENV["TENOR_KEY"]}&limit=5")
          response = Net::HTTP.get_response(uri)
          body = JSON.parse(response.body)
          gif_urls = body["results"].map { |gif| gif["media"].first["gif"]["url"] }
          random_word = rand_dog
        end
        random_gif = gif_urls.sample
        q = QuestionDog.new(gif: random_gif, a: random_word, w1: three_wrongs[0], w2: three_wrongs[1], w3: three_wrongs[2])
        @possible_questions << q
        
        Faker::Creature::Dog.unique.clear
      end
    end

    def create

      length = (1..params["length"].to_i)
      length.each do |index|
        if params["q#{index}"] == "yes"
          QuestionDog.create(strong_question_params(index))
        end
      end
      redirect_to question_dogs_path
    
    end
  
    def destroy
  
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