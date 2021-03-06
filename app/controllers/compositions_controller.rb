class CompositionsController < ApplicationController
  before_action :find_composition, only: [:show, :edit, :update, :destroy, :addrep]

  include SpeechApi

  # def index
  #   @compositions = Composition.all
  #   @memory_list_flashcards = MemoryListFlashcard.all
  # end

  def new
    @memory_list_flashcard = MemoryListFlashcard.new
    @flashcard = Flashcard.new
    @composition = Composition.new
    @memory_list = MemoryList.new
    @instrumentals = Instrumental.all

    # User memory list
    @memory_lists = MemoryList.first(3).concat current_user.memory_lists
    
    # @memory_list = MemoryList.find(params[id])
  end
  
  def create
    # @memory_lists = MemoryList.all
    @memory_lists = MemoryList.first(3).concat current_user.memory_lists
    @instrumentals = Instrumental.all
    @composition = Composition.new(composition_params)
    @composition.user = current_user
    @composition.rep_count = 0
    if @composition.save
      redirect_to composition_path(@composition)
    else
      render :new
    end
  end

  def show
    # @memory_list = MemoryList.find(params[:id])
  end

  def edit; end

  def update
    if @composition.update(composition_params)
      redirect_to composition_path, notice: "Composition created!"
    else
      render :edit
    end
  end

  def destroy
    @composition.destroy
    redirect_to profile_path, notice: "Composition deleted!"
  end


  def karaoke
    # need to routes dynamic route for checker
    @composition = Composition.find(params["composition_id"])
  end

  def checker
    responses = []
    uploaded_file = params["files"]


    composition = Composition.find(params["composition_id"])
    # composition = Composition.last


    flashcards = composition.flashcards
    # flashcards = [
    #   'こんにちは',
    #   'ありがとうございます',
    #   '緑'
    # ]


    # parsed_arr = JSON.parse(uploaded_file)
    uploaded_file.each_with_index do |file, index|
      raw_string = file.read
      # puts raw_string
      result = apple(raw_string)
      english_word = flashcards[index].english_word
      if result.present?
        # p result
        alternative = result.first.alternatives
        # puts "Transcription: #{alternative.first.transcript}"
        # byebug
        equal_or_not = (alternative.first.transcript == flashcards[index].furigana)
        # equal_or_not = (alternative.first.transcript == flashcards[index])


        responses << {
            transcript: alternative.first.transcript,


            japanese_word: underscore_remover(flashcards[index].japanese_word),
            # word: flashcards[index],

            english_word: underscore_remover(flashcards[index].english_word),


            matched: equal_or_not
          }
        # responses << alternative.transcript
      else
        responses << {
          transcript: "",


          japanese_word: underscore_remover(flashcards[index].japanese_word),
          # word: flashcards[index],

          english_word: underscore_remover(flashcards[index].english_word),

          matched: false
        }
        # responses << ""
      end
    end

    # Check with japanese word
    data = scorer(responses, composition)

    p data
    # byebug
    respond_to do |format|
      format.json { render :json => data}
    end

  end

  def addrep
    @composition.increment!(:rep_count)
    respond_to do |format|
      format.json { render json: @composition.rep_count }
    end
  end

  private

  def scorer(responses, composition)
    # Score the composition
    points = 0;

    # create a instance of score with composition
    score = Score.new(composition: composition)

    # iterate through the responses
    responses.each do |status|
      # check if the matched is true and add to the score
      # p status
      # byebug
      points += 1 if status[:matched]
    end


    # add points to score
    score.score = points

    # save the score instance
    # byebug
    if score.save

      # create json with score and infoes as key
      data = {
        score: score.score,
        infoes: responses
      }
    end


    # send the json to fetch
    data


  end

  def composition_params
    params.require(:composition).permit(:name, :instrumental_id, :memory_list_id)
  end

  def find_composition
    @composition = Composition.find(params[:id])
  end
end
