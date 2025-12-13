defmodule ElixirTodoListWeb.TodoLive do
  use ElixirTodoListWeb, :live_view

  alias ElixirTodoList.Repo
  alias ElixirTodoList.Task
  import ElixirTodoListWeb.CoreComponents
  import ElixirTodoListWeb.Layouts, only: [flash_group: 1]

  @impl true
  def mount(_params, _session, socket) do
    tasks = Repo.all(Task)
    changeset = Task.changeset(%Task{}, %{})
    form = to_form(changeset)

    socket =
      assign(socket,
        tasks: tasks,
        form: form
      )

    {:ok, socket}
  end

  @impl true
  def handle_event("save_task", %{"task" => task_params}, socket) do
    changeset = Task.changeset(%Task{}, task_params)

    socket_atualizado =
      case Repo.insert(changeset) do
        {:ok, _new_task} ->
          novo_changeset_vazio = Task.changeset(%Task{}, %{})

          socket
          |> assign(:tasks, Repo.all(Task))
          |> assign(:form, to_form(novo_changeset_vazio))
          |> put_flash(:info, "Tarefa salva com sucesso!")

        {:error, failed_changeset} ->
          assign(socket, form: to_form(failed_changeset))
      end

    {:noreply, socket_atualizado}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    socket_atualizado =
      case Repo.get(Task, id) do
        nil ->
          # Tarefa não encontrada, apenas retorna o socket sem alterações
          socket

        task ->
          # Tarefa encontrada, deleta e atualiza a lista
          Repo.delete(task)

          socket
          |> assign(:tasks, Repo.all(Task))
          |> put_flash(:info, "Tarefa removida com sucesso!")
      end

    {:noreply, socket_atualizado}
  end

  @impl true
  def handle_event("toggle_complete", %{"id" => id, "task" => task_params}, socket) do
    # 1. Busca a tarefa correspondente no banco
    task = Repo.get!(Task, id)

    # 2. Determina o novo estado do checkbox
    completed_status = Map.has_key?(task_params, "completed")

    # 3. Cria um changeset de atualização
    changeset = Task.changeset(task, %{completed: completed_status})

    # 4. Atualiza o registro no banco de dados
    Repo.update(changeset)

    # 5. Atualiza a lista de tarefas no estado do LiveView
    socket = assign(socket, tasks: Repo.all(Task))

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="w-full max-w-lg mx-auto mt-12 p-6 bg-white rounded-lg shadow-md">
      <.flash_group flash={@flash} />
      
      <h1 class="text-3xl font-bold mb-6 text-center text-gray-800">Minha Lista de Tarefas (com DB!)</h1>

      <.form for={@form} id="task-form" phx-submit="save_task">
        <.input
          field={@form[:title]}
          type="text"
          label="Nova Tarefa"
          placeholder="O que precisa ser feito?"
        />
        <.button phx-disable-with="Salvando...">Adicionar Tarefa</.button>
      </.form>

      <div class="mt-8">
        <ul id="task-list">
          <li :for={task <- @tasks} id={"task-#{task.id}"} class="flex justify-between items-center p-3 border-b">

            <% task_form = Task.changeset(task, %{}) |> to_form() %>

            <.form
              for={task_form}
              phx-change="toggle_complete"
              phx-value-id={task.id}
              class="flex-grow"
            >
              <div class="flex items-center space-x-4">
                <.input
                  type="checkbox"
                  field={task_form[:completed]}
                  class="flex-shrink-0"
                />

                <label class={if task.completed, do: "line-through text-gray-500", else: "text-gray-900"}>
                  <%= task.title %>
                </label>
              </div>
            </.form>

            <.button
              type="button"
              phx-click="delete"
              phx-value-id={task.id}
              class="!p-1 !bg-red-500 hover:!bg-red-700"
            >
              &times;
            </.button>
          </li>
        </ul>
      </div>
    </div>
    """
  end
end
