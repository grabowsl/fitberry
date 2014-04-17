# -*- encoding : utf-8 -*-
class CronTask

	class << self

		def perform(method)
			with_logging method do
				self.new.send(method)
			end
		end

		def with_logging(method, &block)
			log("starting...", method)

			time = Benchmark.ms do
				yield block
			end

			log("completed in (%.1fms)" % [time], method)
		end

		def log(message, method = nil)
			now = Time.now.strftime("%Y-%m-%d %H:%M:%S")
			puts "#{now} %s#%s - #{message}" % [self.name, method]
		end

	end

	def stats
		User.active.each { |u| puts "synchronizing stats: #{u.name}"; u.synchronize_statistics; sleep 1 }
		Team.active.each { |t| t.update_progress }
	end

	def devices
		User.active.each { |u| puts "synchronizing devices: #{u.name}"; u.test_method; sleep 1 }
  end

  def self.before_perform(*args)
    puts "About to perform #{self} job with #{args.inspect}"

    # do not run stats synchronization if there are no any challanges in progress
    if args.first.eql? "stats"
      if Challange.in_progress.size < 1
        puts "Skipping job, no challenges in progress found"
        raise Resque::Job::DontPerform
      end
    end
  end

end
