class Admin::TagsController <  Admin::BaseController
  layout:false

	def print
      @tag = PrintBase.new(params[:tag_id].to_i)
      bar_code = BarCode.find(params[:id])
      @chemical = bar_code
      @id = params[:id]
	end

  def roll_print
    print
  end

	def many_print
    @chemicals = []
	  @chemical_ids = params[:bar_code_ids]
	  @tag_size = params[:tag_size] || 1
	  @chemical_ids.split(",").each do |bar_code_id|
      bar_code = BarCode.find(bar_code_id)
      @chemicals <<  [bar_code] * @tag_size.to_i
	  end
    @chemicals = @chemicals.flatten
    @tag = PrintBase.new(params[:tag_id].to_i)
	end
  
end
