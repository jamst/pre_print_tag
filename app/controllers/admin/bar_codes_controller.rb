class Admin::BarCodesController < Admin::BaseController
  before_action :set_bar_code, only: [:edit, :show, :update, :destroy]

  def index
    @q = SearchParams.new(params[:search_params] || {}) 
    search_params = @q.attributes(self)
    @bar_codes = BarCode.default_where(search_params).order(id: :desc).page(params[:page]).per(20)
  end

  def new
    @bar_code = BarCode.new
  end

  def edit
  end

  def create
    @bar_code = BarCode.new(params[:bar_code].permit!)
    @bar_code.save
  end

  def update
    @bar_code.update_attributes(params[:bar_code].permit!)
  end

  def destroy
    @bar_code.destroy
    redirect_to(admin_bar_codes_path, notice: "删除成功。")
  end

  private

  def set_bar_code
    @bar_code = BarCode.find(params[:id])
  end
end
