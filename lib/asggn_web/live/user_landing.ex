defmodule AsggnWeb.UserLanding do
  use AsggnWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
    <.header class="text-center">
      Welcome <%= @current_user.username %>
     </.header>
    </div>
    """
  end
end
