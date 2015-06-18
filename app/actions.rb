helpers do
  def user_logged_in?
    session[:email] && session[:email] != "" 
  end

  def get_current_user
    if user_logged_in?
      User.find_by_email(session[:email])
    end
  end
end

get '/' do
  @tracks = Track.all
  erb :index
end

get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by_email(params[:email])

  if @user
    session[:email] = @user.email
    redirect '/'
  else
    erb :'users/new'
  end
end

get '/logout' do
  session[:email] = ""
  redirect '/'
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(
    email:    params[:email],
    password: params[:password]
    )
  if @user.save
    redirect '/login'
  else
    erb :'users/new'
  end
end

get '/new' do
  erb :'/new'
end 

post '/songs' do
  @track = Track.new(
    title:    params[:title],
    author:   params[:author],
    url:      params[:url],
    user_id:  get_current_user.id
    ) 
  if @track.save
    redirect '/'
  else
    erb :'/new'
  end
end

get '/upvote/:id' do
  Vote.create(
    user_id: get_current_user.id,
    song_id: params[:id],
    vote_count: 1
    )
  redirect '/'
end

get '/downvote/:id' do
  Vote.create(
    user_id: get_current_user.id, 
    song_id: params[:id],
    vote_count: -1
    )
  redirect '/'
end
