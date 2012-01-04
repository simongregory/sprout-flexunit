# encoding: utf-8

require 'rake/tasklib'

module FlexUnitReportWriter
  class Task < Rake::TaskLib
    attr_writer :server, :port

    def initialize name = :report_writer
      @name = name
      @server = '127.0.0.1'
      @port = 1024

      yield self if block_given?

      define
    end

    def define
      desc "Listens to the output of a FlexUnit test run and writes it to disk"
      task @name do
        start_socket
      end
    end
  end

  def start_socket
    def start(params=nil)
      @pid = fork do
        require 'socket'
        fu = RunMonitor.new(TCPServer.open(server, port), Report.new)
      end

      Process.detach(@pid)
    end
  end
end

def report_writer *args, &block
  FlexUnitReportWriter::Task.new *args, &block
end
