# To change this template, choose Tools | Templates
# and open the template in the editor.

class SalesTexes
  
  RECEIPT1 = ["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"]
  RECEIPT2 = [ "1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85" ]
  RECEIPT3 = [ "1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "1 box of imported chocolates at 11.25"]
  
  TAX_EXCEPT_ITEM = ["chocolates","book","pills","chocolate"]
  
  IMPORT_TAX = 0.05
  SALES_TAX = 0.10
  BOTH_TAX = 0.15
  CENTS_ROUNDING_MULTIPLIER = 20.0
  
  def initialize
    puts "*************First receipt*****************"
    get_input RECEIPT1
    puts "*************Second receipt*****************"
    get_input RECEIPT2
    puts "*************Third receipt*****************"
    get_input RECEIPT3
  end
  
  def get_input input_array
    total_tax = 0
    total_price = 0
    input_array.each do |each_item|
       i_item = each_item.split
       qty = i_item[0].to_i
       price = i_item[-1].to_f
       p = each_item.split(" at ")
       product = p[0].delete("/0-9/").strip
       tax = tax_cal price,product
       total_tax += tax
       tax_price = (price.to_f + tax)
       total_price += tax_price
       p "#{qty} #{product}: #{tax_price.round(2)}"
    end
    p "Sales Tax: #{total_tax.round(2)}" 
    p "Total: #{total_price.round(2)}"
  end
  
  def tax_cal price,product
    tax_exclude = []
    a_product = product.split(" ")
    tax_exclude = a_product & TAX_EXCEPT_ITEM
    if product.include?('imported') and tax_exclude.count != 1
      tax = price.to_f * BOTH_TAX
    elsif product.include?('imported') and tax_exclude.count == 1
      tax = price.to_f * IMPORT_TAX
    elsif tax_exclude.count != 1
      tax = price.to_f * SALES_TAX
    else
      tax = 0
    end
    return tax
  end
  
end

SalesTexes.new
 