class DaysController < ApplicationController 

  get '/days/new' do
    redirect_if_not_logged_in
    erb :'/days/new'
  end

  post '/days/new' do
    @user = current_user
    day = @user.days.create(name: params[:name])
    intake = day.intakes.create(name: params[:intakes][:name])
    redirect '/intakes'
  end

  get '/days/:id/edit' do
    redirect_if_not_logged_in
    @day = Day.find_by_id(params[:id])
    erb :'days/edit'
  end

  patch '/days/:id' do 
    @day = Day.find_by_id(params[:id])
    @day.name = params[:name]
    @day.save
    redirect '/intakes'
  end

  get '/days/:id/delete' do
    @day = Day.find_by_id(params[:id])
    erb :'days/delete'
  end

  delete '/days/:id' do 
    @day = Day.find_by_id(params[:id])
    @day.destroy
    redirect '/intakes'
  end

end
