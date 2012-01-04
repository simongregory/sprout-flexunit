class RunMonitor
  def initialize(server,run)
    @server = server
    @run = run
    start
  end

  def start
    client = @server.accept

    client.puts("<startOfTestRunAck/>\x00")

    while (line = client.gets("\x00").chomp("\x00"))
      break if line  == '<endOfTestRun/>'
      @run.add line
    end

    client.puts("<endOfTestRunAck/>\x00")
    client.close

    @server.close

    puts @run.to_s
  end
end
