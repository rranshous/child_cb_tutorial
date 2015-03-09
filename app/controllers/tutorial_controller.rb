class TutorialController < ApplicationController
  def index
    redirect_to :intro
  end

  # start out w/ an intro graphic and some copy
  # about what you are about to experience
  #  Learn how to find jobs like an adult
  def into
  end

  # once they've read the copy we kick them to choosing
  # what type of job they want
  #  give them options w/ images, firefighter, police, etc
  def job_options
  end

  # after they choose a job option we want them to choose
  # where they want to preform that job
  def location_options
    @job = params[:job]
  end

  # once they choose where we give them the results
  # to explore, not sure how to make this interesting yet
  def possible_jobs
    Cb.configure do |config|
      config.dev_key    = 'WDHV3ZT6Y6HFN3QS2LSG'
      config.time_out   = 5
    end

    job = params[:job].titleize
    location = params[:location].titleize

    results = Cb.job.search({ location: location,
                              keywords: job })
    jobs = results.model.jobs
    @job_data = {
      job: job,
      location: location,
      job_results: jobs
    }
  end
end
