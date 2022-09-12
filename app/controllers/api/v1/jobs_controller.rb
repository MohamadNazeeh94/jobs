module Api
  module V1


class JobsController < ApiController
  def index
    jobs = Job.all 
    render json: jobs
  end

  def show
    @job = Job.find(params[:id])
    render json: @job
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job
    else
      render json: { message: 'Something went wrong.' }
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
        render json: @job
      else
        render json: { message: 'Something went wrong.' }
      end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def job_params
      params.require(:job).permit(:title, :description)
    end
end

end
end
