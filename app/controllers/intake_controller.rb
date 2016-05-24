class IntakesController < ApplicationController 

get '/intakes' do
    redirect_if_not_logged_in
    @user = current_user
    @days = @user.days
    erb :'intakes/show'
  end

# Makes a new intake associated with the day
  get '/intakes/new/:id' do
    redirect_if_not_logged_in
    @day = Day.find_by_id(params[:id])
    erb :'/intakes/new'
  end

  post '/intakes/new/:id' do
    @day = Day.find_by_id(params[:id])
    Intake.create(name: params[:name], day_id: params[:id])
    redirect '/intakes'
  end

# Edit intake 
  get '/intakes/:id/edit' do
    @intake = Intake.find_by_id(params[:id])
    erb :'/intakes/edit'
  end

  patch '/intakes/:id' do
    @intake = Intake.find_by_id(params[:id])
    @intake.name = params[:name]
    @intake.save
    redirect '/intakes'
  end

# Delete intake 
  get '/intakes/:id/delete' do 
    @intake = Intake.find_by_id(params[:id])
    erb :'/intakes/delete'
  end

  delete '/intakes/:id' do 
    @intake = Intake.find_by_id(params[:id])
    @intake.destroy
    redirect '/intakes'
  end

end