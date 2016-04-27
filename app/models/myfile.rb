class Myfile < Base


  def initialize(opts)
    super(opts)
  end
  
  def save
    Dir.chdir(BASE_PATH+self.path) do 
      File.open(self.name, 'w') unless File.exists? self.name
	end
  end
end
