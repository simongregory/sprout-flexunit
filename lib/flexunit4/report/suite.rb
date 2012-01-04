class Suite
  attr_accessor :name, :cases

  def initialize(name)
    @name = name
    @cases = []
  end

  def add test_case
    unless @cases.include? test_case
      @cases << test_case
    end
  end

  def failures
    @cases.find_all {|c| c.status == 'failure' }.count
  end

  def successes
    @cases.find_all {|c| c.status == 'success' }.count
  end

  def skipped
    @cases.find_all {|c| c.status == 'ignore' }.count
  end

  def tests
    @cases.length
  end

  def time
    total_time = 0
    @cases.each { |c| total_time += c.time }
    total_time
  end

  def to_s
    opening_tag + @cases.join("\n\t") + closing_tag
  end

  def opening_tag
    "<testsuite name='#{name} tests='#{tests}' failures='#{failures}' errors='#{failures}' skipped='#{skipped}' time='#{time}'>\n\t"
  end

  def closing_tag
    "\n</testsuite>\n\n"
  end
end
