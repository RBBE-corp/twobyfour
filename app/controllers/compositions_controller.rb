class CompositionsController < ApplicationController
  before_action :find_composition, only: [:show, :edit, :update, :destroy, :addrep]
  
    include SpeechApi
  
  def index
    @compositions = Composition.all
    @memory_list_flashcards = MemoryListFlashcard.all
  end

  def new
    @memory_list_flashcard = MemoryListFlashcard.new
    @flashcard = Flashcard.new
    @composition = Composition.new
    @memory_list = MemoryList.new
    @instrumentals = Instrumental.all
    @memory_lists = MemoryList.all
    # @memory_list = MemoryList.find(params[id])
  end

  def create
    @memory_lists = MemoryList.all
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
    redirect_to compositions_path, notice: "Composition deleted!"
  end


  def karaoke
    # need to routes dynamic route for checker
    @composition = Composition.last
  end

  def checker
    puts params
    responses = []
    uploaded_file = params["files"]
    # composition = Composition.find(params["id"])
    composition = Composition.last
    flashcards = composition.flashcards
    # parsed_arr = JSON.parse(uploaded_file)
    uploaded_file.each_with_index do |file, index|
      raw_string = file.read
      # puts raw_string
      responses = apple(raw_string)
      if response.present?
        alternatives = response.first.alternatives
        alternatives.each do |alternative|
          # puts "Transcription: #{alternative.transcript}"
          equal_or_not = (alternative.transcript == flashcards[index].furigana_word)
          responses << {
            transcript: alternative.transcript,
            word: flashcards[index].furigana_word,
            matched: equal_or_not
          }
          # responses << alternative.transcript
        end
      else
        responses << {
          transcript: "",
          word: flashcards[index].furigana_word,
          matched: false
        }
        # responses << ""
      end
    end

    puts responses
    # Check with japanese word
    scorer()
    
    byebug
    # raise
  end

  def addrep
    @composition.increment!(:rep_count)
    respond_to do |format|
      format.json { render json: @composition.rep_count }
    end
  end


  private

  def scorer
    # Score the composition
    # create a instance of score with composition
    # iterate through the responses

    # check if the matched is true and add to the score



    responses
  end

  def composition_params
    params.require(:composition).permit(:name, :instrumental_id, :memory_list_id)
  end

  def find_composition
    @composition = Composition.find(params[:id])
  end
end
