defmodule ElixirTodoListWeb.TodoLive do
  use ElixirTodoListWeb, :live_view

  # mount/3 é o "construtor" do LiveView — chamado quando a página é carregada
  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  # render/1 define o HTML que será exibido
  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-12">
      <h1 class="text-3xl font-bold">Meu Todo List (Hello LiveView!)</h1>
    </div>
    """
  end
end
