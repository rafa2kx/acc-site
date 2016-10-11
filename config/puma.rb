if (!ENV.key?('RACK_ENV') || ENV['RACK_ENV'].empty?) || (!ENV.key?('RAILS_ENV') || ENV['RAILS_ENV'].empty?)
  raise Exception.new "Environment variables 'RACK_ENV' and 'RAILS_ENV' need to be set."
end

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'local'

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
