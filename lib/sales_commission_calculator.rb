class SalesCommissionCalculator
  def initialize(total_sales, sales_representatives)
    @total_sales = total_sales
    @sales_representatives = sales_representatives
  end

  def calculate_commissions
    if @total_sales < 100_000
      @sales_representatives.each do |sales_representative|
        commission = if sales_representative.sales < 10_000
                       sales_representative.sales * 0.1 * 0.05
                     elsif sales_representative.sales >= 10_000 && sales_representative.sales <= 20_000
                       sales_representative.sales * 0.1 * 0.075
                     else
                       sales_representative.sales * 0.1 * 0.1
                     end

        sales_representative.commission = commission
      end
    elsif @total_sales >= 100_000 && @total_sales <= 200_000
      @sales_representatives.each do |sales_representative|
        commission = if sales_representative.sales < 10_000
                       sales_representative.sales * 0.15 * 0.05
                     elsif sales_representative.sales >= 10_000 && sales_representative.sales <= 20_000
                       sales_representative.sales * 0.15 * 0.075
                     else
                       sales_representative.sales * 0.15 * 0.1
                     end

        sales_representative.commission = commission
      end
    elsif @total_sales > 200_000
      @sales_representatives.each do |sales_representative|
        commission = if sales_representative.sales < 10_000
                       sales_representative.sales * 0.2 * 0.05
                     elsif sales_representative.sales >= 10_000 && sales_representative.sales <= 20_000
                       sales_representative.sales * 0.2 * 0.075
                     else
                       sales_representative.sales * 0.2 * 0.1
                     end

        sales_representative.commission = commission
      end
    end
  end
end

class SalesRepresentative
  attr_reader :sales
  attr_accessor :commission

  def initialize(sales)
    @sales = sales
    @commission = 0
  end
end
