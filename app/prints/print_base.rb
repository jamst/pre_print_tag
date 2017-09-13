class PrintBase
  # 默认现在只有a4纸大小
  PaperType = {1=>[210,297]}
  # 标签尺寸
  TagType = {0=>[100,40],1=>[150,60],2=>[260,90],3=>[100,60],4=>[65,30]}

  attr_accessor :id,:tag_type_x,:tag_type_y,:print_size,:print_x_size,:print_y_size,:print_page

  def initialize(tag_type=0, paper_type=1)
  	@paper_type_x = PaperType[paper_type][0]
    @paper_type_y = PaperType[paper_type][1]
    @tag_type_x = TagType[tag_type][0]
    @tag_type_y = TagType[tag_type][1]
    @id = tag_type
    # 超尺寸转置
    if @paper_type_x < @tag_type_x
      @tag_type_x = TagType[tag_type][1]
      @tag_type_y = TagType[tag_type][0]
    end

    # 纸张可用面积
    @paper_type_area = @paper_type_x * @paper_type_y
    # 标签面积
    @tag_type_area = @tag_type_x * @tag_type_y
    # 每行打印张数
    @print_x_size = @paper_type_x / @tag_type_x
    # 每列打印张数
    @print_y_size = @paper_type_y / @tag_type_y

    # 每页纸打印标签张数
    @print_size = @paper_type_area / @tag_type_area
    @print_size = @print_x_size * @print_y_size < @print_size ? @print_x_size * @print_y_size : @print_size
  end

end
