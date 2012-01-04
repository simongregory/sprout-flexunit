class Report
  def initialize
    @suites = []
  end

  def add(data)
    test_case = Case.new(data)
    find_suite_for(test_case.id).add(test_case)
  end

  def find_suite_for(name)
    suite(name) || create(name)
  end

  def suite(name)
    @suites.find {|s| s.name == name }
  end

  def create(name)
    s = Suite.new(name)
    @suites << s
    s
  end

  def to_s
    @suites.each { |s| s.to_s }
  end
end
