# Rake tasks for populating master tests with stuff.

namespace :populate do
	desc "Add a fixed set of agree/disagree Answers to a Master Test. User must provide the MASTER_ID option."
	task :agreement => :environment do
		if ENV['MASTER_ID']
			master = MasterTest.find(ENV['MASTER_ID'])
			master.question_groups.each do |group|
				group.questions.each do |question|
					puts "Preparing answers for question #{question.id}..."
					question.answers.create :content => 'Strongly Disagree', :value => -2
					question.answers.create :content => 'Disagree', :value => -1
					question.answers.create :content => 'Neutral', :value => -0
					question.answers.create :content => 'Agree', :value => 1
					question.answers.create :content => 'Strongly Agree', :value => 2
				end
			end
			puts "All done."
		else
			puts "ERROR: `MASTER_ID` environment variable must be set to select a Master Test."
		end
	end	
end