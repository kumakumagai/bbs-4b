module TagService
  class UpdateService
    def update!(tag, tag_params)
      tag.name  = tag_params[:name]

      tag.save!
    end
  end
end