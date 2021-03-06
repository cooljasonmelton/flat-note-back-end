class NotesController < ApplicationController

    def create
        new_note = Note.create(name: params[:name], text: params[:text], user_id: params[:userId])
        
        params[:tags].split(', ').each do |tag|
            new_note.tags << Tag.create(name: tag)
        end 
       
        user = User.find_by(id: params[:userId])
        render json: user, include: [:notes, :tags]
    end


    def update
        note = Note.find_by(id: params[:noteId])
        note.update(name: params[:name], text: params[:text])

        user = User.find_by(id: params[:userId])
        render json: user, include: [:notes, :tags]
    end 

    def destroy
        note = Note.find_by(id: params[:id])
        user = User.find_by(id: note.user_id)
        
        note.destroy
        render json: user, include: [:notes, :tags]
    end 



end


