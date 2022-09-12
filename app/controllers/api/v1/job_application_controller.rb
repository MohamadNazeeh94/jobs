module Api
    module V1

        class JobApplicationController < ApiController
            
            def create

                @user = User.find_by(id: params["user_id"])
                @job = Job.find_by(id: params["job_id"])

                @app = JobApplication.find_by job_id: params["job_id"], user_id: params["user_id"] 

                if @app
                    render json: { message: "You already applied for this job.", status: "error" }
                else
                    @jobapplication = JobApplication.new(user:@user, job:@job, seen:false)
                
                    if @jobapplication.save
                        render json: @jobapplication
                    else
                        render json: @jobapplication
                    end
                end
            end

            def index
                jobapplications =  JobApplication.select('job_applications.id, users.email as username, jobs.title as jobtitle, jobs.description as jobdescription, job_applications.seen as seen').joins(:user,:job).all

                render json: jobapplications
            end

            def show
                jobapplications =  JobApplication.select('job_applications.id, users.email as username, jobs.title as jobtitle, jobs.description as jobdescription, job_applications.seen as seen').joins(:user,:job).find(params[:id])

                render json: jobapplications
            end

            def update
                jobapplication = JobApplication.find_by(id: params["id"])

                jobapplication.seen =  params["seen"]
            
                if jobapplication.save
                    render json: jobapplication
                else
                render :edit, status: :unprocessable_entity
                end
            end

        end

    end
end
