class Api::V2::CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
    # render json: @candidates 
  end
  def show
    @candidate = Candidate.find_by(id: params[:id])
    # render json: @candidate
  end
end
