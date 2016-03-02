class Api::V1::NotesController < ApplicationController
  before_action :doorkeeper_authorize!
  def index
    @notes = Note.all
  end
end
