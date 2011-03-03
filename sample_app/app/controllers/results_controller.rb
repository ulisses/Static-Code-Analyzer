class ResultsController < ApplicationController
  def index
    @tentativas = Tentativa.order('created_at DESC')
  end
end