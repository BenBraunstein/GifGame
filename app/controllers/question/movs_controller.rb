class Question::MovsController < ApplicationController
  @@movie_list = ["Modern Times",
                  "Back to the Future",
                  "The Grand Budapest Hotel",
                  "Little Miss Sunshine",
                  "Hot Fuzz",
                  "Some Like It Hot",
                  "Groundhog Day",
                  "Duck Soup",
                  "O Brother, Where Art Thou?",
                  "The Gold Rush",
                  "Juno",
                  "La La Land",
                  "Shaun of the Dead",
                  "Singing in the Rain",
                  "Annie Hall",
                  "Moonrise Kingdom",
                  "Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb",
                  "The Truman Show",
                  "The Graduate",
                  "Monty Python and the Holy Grail",
                  "The Big Lebowski",
                  "Borat",
                  "The Hangover",
                  "Breakfast at Tiffany's",
                  "Scott Pilgrim vs. the World",
                  "500 Days of Summer",
                  "Mary Poppins",
                  "Being John Malkovich",
                  "Planes, Trains and Automobiles",
                  "Dead Poets Society",
                  "The Breakfast Club",
                  "Mrs. Doubtfire",
                  "Superbad",
                  "Dumb and Dumber",
                  "Big",
                  "Anchorman",
                  "Wedding Crashers",
                  "School of Rock",
                  "Bruce Almighty",
                  "White Chicks",
                  "Meet the Parents",
                  "Mrs. Doubtfire",
                  "Trainwreck",
                  "Zoolander",
                  "Bill and Ted's Excellent Adventure",
                  "The Birdcage",
                  "Spy",
                  "Clueless",
                  "Napoleon Dynamite",
                  "Old School",
                  "Wayne's World",
                  "Office Space",
                  "Ferris Bueller's Day Off",
                  "Clerks",
                  "Mean Girls",
                  "Trading Places",
                  "This is Spinal Tap"]

  def index
    @questions = QuestionMov.all
  end

  def show
    @question = QuestionMov.find(params[:id])
  end

  def new
    # Make an empty array that will store questions
    @possible_questions = []

    50.times do
      # Get random movie
      random_movie = @@movie_list.sample
      rmm = "#{random_movie} movie"

      # Get a gif of that movie
      uri = URI.parse("https://api.tenor.com/v1/search?q=#{rmm}&key=#{ENV["TENOR_KEY"]}&limit=8")
      response = Net::HTTP.get_response(uri)
      body = JSON.parse(response.body)
      gif_urls = body["results"].map { |gif| gif["media"].first["gif"]["url"] }
      random_gif = gif_urls.sample

      # Get 3 random movie names
      three_wrongs = (@@movie_list - [random_movie]).sample(3)

      q = QuestionMov.new(gif: random_gif, a: random_movie, w1: three_wrongs[0], w2: three_wrongs[1], w3: three_wrongs[2])
      @possible_questions << q
    end
  end

  def create
    length = (1..params["length"].to_i)
    length.each do |index|
      if params["q#{index}"] == "yes"
        QuestionMov.create(strong_question_params(index))
      end
    end
    redirect_to question_movs_path
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

  def destroy
  end
end
