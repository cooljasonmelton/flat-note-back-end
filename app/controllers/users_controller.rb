class UsersController < ApplicationController
    # def index
    #     user = User.find_by(name: "Jason")
    #     full_notes = []

    #     user.notes.each do |note|
    #         full_notes << {note => note.tags}
    #     end

    #     render json: full_notes
    # end

    def create
        user = User.find_or_create_by(name: params[:user])
        render json: user, include: [:notes, :tags]
    end
end
