worker_processes Integer(ENV["UNICORN_WORKERS"] || 3)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

rails_env = ENV['RAILS_ENV'] || 'development'
if rails_env == 'development'
  tailer = fork { exec 'tail', '-n', '0', '-f', 'log/development.log' }
  at_exit do
    if $0 !~ /worker/
      begin
        Process.kill('INT', tailer)
        Process.wait(tailer)
      rescue => boom
      end
    end
  end
end
