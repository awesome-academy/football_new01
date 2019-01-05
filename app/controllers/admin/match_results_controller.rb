class Admin::MatchResultsController < Admin::BaseController
  before_action :load_match_result, except: [:index, :new, :create]
  skip_before_action :verify_authenticity_token, only: :destroy

  def index
    @match_results = MatchResult.newest.paginate page: params[:page],
      per_page: Settings.match_results.page
  end

  def new
    @match_result = MatchResult.new
  end

  def edit; end

  def update
    if @match_result.update_attributes match_result_params
      flash[:success] = t "match_results
        .match_results_controller.match_result_updated"
      redirect_to admin_match_results_path
    else
      render :edit
    end
  end

  def create
    @match_result = MatchResult.new match_result_params
    if @match_result.save
      flash[:info] = t "match_results.create.success"
      redirect_to admin_match_results_path
    else
      flash[:danger] = t "match_results.create.error"
      render :new
    end
  end

  def destroy
    if @match_result.destroy
      flash[:success] = t "match_results
        .match_results_controller.match_resuilt_deleted"
    else
      flash[:warning] = t "match_results.match_results_controller.failed"
    end
      redirect_to admin_match_results_path
  end

  private

  def load_match_result
    @match_result = MatchResult.find_by id: params[:id]
    return if @match_result

    flash[:warning] = t "match_results.match_results_controller.not_found"
    redirect_to admin_match_result_path
  end

  def match_result_params
    params.require(:match_result).permit :match_id, :score1, :score2
  end
end