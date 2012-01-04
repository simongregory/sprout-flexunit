class Case
  attr_reader :time, :id

  def initialize(data)
    @xml = Nokogiri::XML(data).root
    @time = @xml.attribute('time').value.to_i
    @id = classname.sub('::','.')
  end

  def method_missing(name)
    begin
      @xml.attribute(name.to_s).value
    rescue NilClass => e
      super
    end
  end

  def to_s
    @xml.to_s
  end
end
