Rack::Attack.throttle('ip limit', limit: 10, period: 5) do |request|
    request.ip
end