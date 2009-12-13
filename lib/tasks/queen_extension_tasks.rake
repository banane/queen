namespace :radiant do
  namespace :extensions do
    namespace :queen do
      
      desc "Runs the migration of the Queen extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          QueenExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          QueenExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Queen to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from QueenExtension"
        Dir[QueenExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(QueenExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
