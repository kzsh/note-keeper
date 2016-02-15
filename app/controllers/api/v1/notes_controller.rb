class Api::V1::NotesController < ApplicationController
  def index
    @notes = Note.all
  end
end
