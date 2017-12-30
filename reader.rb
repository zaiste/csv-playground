require 'csv'
require 'benchmark'
require 'ruby-progressbar'

FILENAME = ARGV.size > 0 ? ARGV[0] : 'data.csv'

def memory_usage
  memory_before = `ps -o rss= -p #{Process.pid}`.to_i
  yield
  memory_after = `ps -o rss= -p #{Process.pid}`.to_i

  puts "Memory: #{((memory_after - memory_before) / 1024.0).round(2)} MB"
end

def time_spent
  time = Benchmark.realtime do
    yield
  end

  puts "Time: #{time.round(2)}"
end

memory_usage do
  time_spent do
    # count = File.foreach(FILENAME).inject(0) { |c, _| c + 1 }
    # bar = ProgressBar.create(throttle_rate: 0.2, total: count)

    CSV.foreach(FILENAME) do |row|
      # bar.incremen
    end
  end
end