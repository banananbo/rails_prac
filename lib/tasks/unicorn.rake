namespace :unicorn do
   # Tasks
   desc "Start unicorn"
   task(:start) {
     config = Rails.root.join('config', 'unicorn.rb')
     sh "unicorn -c #{config} -E production -D"
   }
end
