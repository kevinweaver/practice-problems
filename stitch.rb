class EmploymentPeriodService
  #return an array of date ranges with no employment changes
  def periods_with_no_employment_changes(employment_periods)
    date_ranges = employment_periods.each_with_object([]) do |person, dates|
      dates << person[:start_date]
      dates << person[:end_date]
    end
    range = date_ranges.sort{|a,b| a <=> b}
    range = range.each_with_index.map do |date, index|
      range << [date, range[index+1]] if date != range[index+1]
    end
    range.pop

    print range
  end
end


require "date"
dates = [
  {:name => "Kevin", :company => "Omni", :start_date => Date.new(2015,8,20), :end_date => Date.new(2016,9,10)},
  {:name => "Joe", :company => "Example", :start_date => Date.new(2013,8,20), :end_date => Date.new(2015,5,10)},
  {:name => "Bob", :company => "Stitch", :start_date => Date.new(2016,8,20), :end_date => Date.new(2016,9,10)}
]
emp_serv = EmploymentPeriodService.new
emp_serv.periods_with_no_employment_changes(dates)
