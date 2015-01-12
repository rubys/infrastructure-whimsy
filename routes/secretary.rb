class Whimsy < Sinatra::Base

  get '/secretary' do
    erb 'secretary/index'.to_sym, :locals => { :menu => 'menu' }
  end

  post '/secretary/upload' do
  end
end
