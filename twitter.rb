require 'rubygems'
require 'sinatra'
require 'omniauth'

use OmniAuth::Builder do
  provider :twitter, 'key', 'secret'
end

enable :sessions
enable :run

get '/' do
  <<-HTML
  <a href='/auth/twitter'>Sign in with Twitter</a>
  HTML
end

get '/auth/:name/callback' do
  auth = request.env['omniauth.auth']
  <<-HTML
  hello #{auth['uid']} #{auth['user_info']['name']}
  HTML
end