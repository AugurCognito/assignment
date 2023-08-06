defmodule AsggnWeb.UserLoginLive do
  use AsggnWeb, :live_view

  def toggle_vis() do
    ~S"""
      const passwordInput = document.getElementById("password-field");
      const visIcon = document.getElementById("vis-icon");
      if (passwordInput.type === "password") {
        passwordInput.type = "text";
        visIcon.classList.remove("hero-eye");
        visIcon.classList.add("hero-eye-slash");
      } else {
        visIcon.classList.remove("hero-eye-slash");
        visIcon.classList.add("hero-eye");
        passwordInput.type = "password";
      }
    """
  end
  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      <.header class="text-center">
        Sign in to account
        <:subtitle>
          Don't have an account?
          <.link navigate={~p"/users/register"} class="font-semibold text-brand hover:underline">
            Sign up
          </.link>
          for an account now.
        </:subtitle>
      </.header>

      <.simple_form for={@form} id="login_form" action={~p"/users/log_in"} phx-update="ignore">
        <.input field={@form[:email]} type="email" label="Email" required />
        <div class="relative">
          <.input
            field={@form[:password]}
            id="password-field"
            type="password"
            label="Password"
            required
          />
          <i id="vis-icon" class="hero-eye hero-eye absolute top-1/2 right-2 transform -translate-y-1/10 cursor-pointer" onclick={toggle_vis()}></i>
        </div>

        <:actions>
          <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" />
          <.link href={~p"/users/reset_password"} class="text-sm font-semibold">
            Forgot your password?
          </.link>
        </:actions>
        <:actions>
          <.button phx-disable-with="Signing in..." class="w-full">
            Sign in <span aria-hidden="true">→</span>
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = live_flash(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
