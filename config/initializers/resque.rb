ENV["REDISTOGO_URL"] = "redis://waratuman:a93393efc068c3e08bd48720f2da1a00@goosefish.redistogo.com:9040/"

uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
