class Api::V1::Projects::TagsController < Api::V1::ApplicationController
  account_load_and_authorize_resource :tag, through: :team, through_association: :projects_tags

  # GET /api/v1/teams/:team_id/projects/tags
  def index
  end

  # GET /api/v1/projects/tags/:id
  def show
  end

  # POST /api/v1/teams/:team_id/projects/tags
  def create
    if @tag.save
      render :show, status: :created, location: [:api, :v1, @tag]
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/projects/tags/:id
  def update
    if @tag.update(tag_params)
      render :show
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/projects/tags/:id
  def destroy
    @tag.destroy
  end

  private

  module StrongParameters
    # Only allow a list of trusted parameters through.
    def tag_params
      strong_params = params.require(:projects_tag).permit(
        *permitted_fields,
        :name,
        # 🚅 super scaffolding will insert new fields above this line.
        *permitted_arrays,
        # 🚅 super scaffolding will insert new arrays above this line.
      )

      process_params(strong_params)

      strong_params
    end
  end

  include StrongParameters
end
