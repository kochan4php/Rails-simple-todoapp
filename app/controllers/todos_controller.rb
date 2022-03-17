class TodosController < ApplicationController
  def index
    @title = "Banh"
    @navbar_brand = "Daftar Todos"
    @todos = Todo.all
  end

  def show
  end

  def new 
    @title = "Halaman Tambah Todo"
    @navbar_brand = "Tambah Kegiatan Baru"
    @todo = Todo.new
  end

  def create 
    @todo = Todo.new(resource_params)
    if @todo.save
      redirect_to todos_path, notice: "Todo berhasil ditambahkan"
    end
  end

  def edit 
    @todo = Todo.find_by(id: params[:id])

    if !@todo
      redirect_to todos_path
    else 
      @title = "Edit Kegiatan"
      @navbar_brand = "Edit Kegiatan"
    end
  end

  def update 
    @todo = Todo.find_by(id: params[:id])
    @todo.update(resource_params)
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find_by(id: params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  def completed 
    @title = "Sudah Selesai"
    @navbar_brand = "Sudah Selesai"
    @todos = Todo.where(status: 0)
  end

  def uncompleted
    @title = "Belum Selesai"
    @navbar_brand = "Belum Selesai"
    @todos = Todo.where(status: 1)
  end

  def set_status 
    todo = Todo.find_by(id: params[:id])

    if todo.status == 1
      todo.status = 0      
    elsif todo.status == 0
      todo.status = 1
    end

    todo.save

    redirect_to todos_path
  end

  private 
    def resource_params
      # Sesuai nama model
      params.require(:todo).permit(:activity)
    end
end
