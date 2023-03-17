class SalesCommissionCalculator
  def initialize(total_sales, sales_representatives)
    @total_sales = total_sales
    @sales_representatives = sales_representatives
  end

  def calculate_commissions
    @sales_representatives.each do |sales_representative|
      commission = sales_representative.sales * total_sales_commission_rate() * sales_representative_commission_rate(sales_representative.sales)
      sales_representative.commission = commission
    end
  end

  private

  def total_sales_commission_rate()
    if @total_sales < 100_000
      0.1
    elsif @total_sales <= 200_000
      0.15
    else
      0.2
    end
  end

  def sales_representative_commission_rate(representative_sales)
    if representative_sales < 10_000
      0.05
    elsif representative_sales >= 10_000 && representative_sales <= 20_000
      0.075
    else
      0.1
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
