class Mydirectory < Base

  def initialize(opts)
    super(opts)
  end
  
  def self.all(path)
    Dir.chdir(BASE_PATH+"/"+path) do
	    puts Dir.pwd
        (Dir.entries(".")-['.', '..']).map do |name|
		  opts = {name: name, path: path}
	      File.ftype(name) == "directory" ? Mydirectory.new(opts) : Myfile.new(opts)
	    end
	end
  end
  
  def save
    Dir.chdir(BASE_PATH+self.path) do
	    puts "Creating #{Dir.pwd}/#{self.name}"
        FileUtils.mkdir_p(self.name)
	end
  end

end
