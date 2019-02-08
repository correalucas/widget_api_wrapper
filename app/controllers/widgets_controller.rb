class WidgetsController < ApplicationController
  skip_before_action :authorize_request, only: %i[visibles]
  before_action :set_widget, only: %i[update]

  def index
    @widgets = Widget.all
    json_response(@widgets.data.to_json)
  end

  def visibles
    @widgets = Widget.visibles(term_params)
    json_response(@widgets.data.to_json)
  end

  def my_widgets
    @widgets = Widget.created_by_me(term_params)
    json_response(@widgets.data.to_json)
  end

  def user_widgets
    @widgets = Widget.created_by_other(user_widgets_params)
    json_response(@widgets.data.to_json)
  end

  def create
    @widget = Widget.new(widget_params)
    @widget.save
    json_response(@widget.data.to_json, 201)
  end

  def update
    @widget.update(widget_params)
    json_response(@widget.data.to_json)
  end

  def destroy
    @widget = Widget.destroy(params[:id])
    json_response(@widget.to_json)
  end

  private

  def set_widget
    @widget = Widget.find(params[:id])
  end

  def term_params
    params.permit(:term)
  end

  def user_widgets_params
    params.permit(:id, :term)
  end

  def widget_params
    params.permit(
      :id,
      widget: [
        :name,
        :description,
        :kind
      ]
    )
  end
end
