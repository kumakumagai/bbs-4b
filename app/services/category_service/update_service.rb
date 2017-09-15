module CategoryService
  class UpdateService
    def update!(category, category_params)
      category.name  = category_params[:name]

      category.save!
    end
  end
end