class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do 
   Message.all.order(:created_at).to_json
  end
  post '/messages' do 
    Message.create(
      body: params[:body],
      username: params[:username]

    ).to_json
  end
  patch '/messages/:id' do 
  m= Message.find(params[:id])
  m.update(body: params[:body])
  m.to_json
  end
  delete '/messages/:id' do 
    Message.find(params[:id]).destroy
  end
  
end
