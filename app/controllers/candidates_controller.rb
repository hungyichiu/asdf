class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:show, :edit, :update, :destroy, :vote]

  def index
    @candidates = Candidate.all.order(vote: :desc).page(params[:page]).per(5)
  end

  def new 
    @candidate = Candidate.new
  end

  def create
    
    @candidate = Candidate.new(candidate_params)
    
    if @candidate.save
      # flash[:notice] = "新增候選人成功！"
      redirect_to root_path, notice: "新增候選人成功！"

    else
      # flash[:notice] = "UCCU"
      # redirect_to new_candidate_path
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    
    if @candidate.update(candidate_params)
      # flash[:notice] = "更新候選人成功！"
      redirect_to root_path, notice: "更新候選人成功！"
    else
      # flash[:notice] = "UCCU"
      # redirect_to new_candidate_path
      render :edit
    end
  end

  def destroy
    
    @candidate.destroy

    flash[:notice] = "資料刪除成功！"
    redirect_to root_path
  end

  def vote
    # @candidate.update(vote: @candidate.vote + 1)
    
    # vv = VotLog.new(candidate_id: @candidate.id, ip_address: request.remote_ip)
    # vv.save
    if user_signed_in?
      
      VoteLog.create(candidate_id: @candidate.id, ip_address: request.remote_ip)
      # @candidate.votlogs.create(ip_address: request.remote_ip)
      
      redirect_to root_path, notice: "投票成功"
    else
      redirect_to root_path, notice: "請先登入會員"
    end
    
  end

  private

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
  # Stonger params
  def candidate_params
    clean_params = params.require(:candidate).permit(:name, :age, :policy, :party, :degree)
  end

end