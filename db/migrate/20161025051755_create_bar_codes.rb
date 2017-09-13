class CreateBarCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :bar_codes do |t|
      t.string :product_name
      t.string :cas_no
      t.string :ebd
      t.string :molecular_formula
      t.string :catalog_no
      t.string :specification
      t.string :molecular_weight
      t.string :appearance
      t.string :batch_no
      t.string :storage_condition
      t.string :manufacturing_date
      t.string :expiration_date
      t.string :hazardous
      t.string :caution
      t.string :purity
      t.string :density
      t.string :melting_point
      t.string :boiling_point
      t.string :flash_point
      t.string :water_content
      t.string :solubility
      t.string :net_weight
      t.string :unit
      t.string :operator
      t.string :font_size_tag
      t.timestamps
    end
  end
end
