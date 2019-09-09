class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post 'figures' do
    @figure = Figure.create(name: params['figure'])
    unless @figure[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    unless @figure[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect '/figures'

  end




end
