RAILS_ENV = ENV['RAILS_ENV'] || 'production'

RAILS_ROOT = File.expand_path File.dirname(__FILE__) + '/../'

# 16 workers and 1 master
worker_processes 2

# Load rails+github.git into the master before forking workers
# for super-fast worker spawn times
preload_app true

# Restart any workers that haven't responded in 30 seconds
timeout 30

# Listen
listen 3000, tcp_nopush: true

stderr_path "#{RAILS_ROOT}/log/unicorn-error.log"
stdout_path "#{RAILS_ROOT}/log/unicorn-stdout.log"

