require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")
namespace :convert do
  namespace :erb_to do
    ERBS = FileList["#{Rails.root}/app/views/**/*.erb"]
    #generate tasks for slim files
    slims = []
    ERBS.each do |erb|
      slim = erb.sub(/\.erb$/, ".slim")
      slims << slim
      file slim => [erb] do |task|
        puts "conventing #{erb} .."
        File.open erb, 'r' do |f|
          content = HTML2Slim.convert! f, :erb
          IO.write slim, content
        end
        puts "convented to #{slim} ."

        File.delete(erb)
        puts "deleted #{erb} ."
      end
    end
    desc "convert erb templates to slim [delete=true to delete source erb files]"
    task :slim => slims
  end
end
