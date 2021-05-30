# This is for Active job.
# Active Job is a framework for declaring jobs and making them run on a variety of queuing backends.
# These jobs can be everything from regularly scheduled clean-ups, to billing charges, to mailings.
# Anything that can be chopped up into small units of work and run in parallel, really.
class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
end
