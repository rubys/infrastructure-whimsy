class Whimsy < Sinatra::Base

  get '/secretary' do
    erb 'secretary/index'.to_sym, :locals => { :menu => 'menu' }
  end

  get '/secretary/howto' do
    erb 'secretary/howto'.to_sym
  end

  post '/secretary/upload' do
  end
end
