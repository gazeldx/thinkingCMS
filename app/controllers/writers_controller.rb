class WritersController < ApplicationController
  def index
    @writers = Writer.all
  end

  def new
    @writer = Writer.new
  end

  def edit
    @writer = Writer.find(params[:id])
  end

  def create
    @writer = Writer.new(writer_params)

    if @writer.save
      redirect_to writers_path, notice: t('writer.created')
    else
      render :new
    end
  end

  def update
    @writer = Writer.find(params[:id])

    if @writer.update(writer_params)
      redirect_to writers_path, notice: t('writer.updated')
    else
      render :edit
    end
  end

  private

  def writer_params
    params.require(:writer).permit(:name, :bio)
  end
end
