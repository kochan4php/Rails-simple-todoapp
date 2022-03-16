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
end
