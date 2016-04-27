class Base
  attr_accessor :name, :path
  BASE_PATH = "#{Rails.root}/mystructure"
  
  def initialize(opts={})
    @name = opts[:name] if opts[:name]
	@path = opts[:path] if opts[:path]
  end
  
    
  def destroy
    Dir.chdir(BASE_PATH+self.path) do
      FileUtils.rm_rf(self.name)
	end
  end

  
  protected
  
 
  def full_path
    self.path.nil? ? BASE_PATH : "#{BASE_PATH}/#{self.path}"
  end
  
end