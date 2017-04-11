class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || (req.headers['Api-Version'] && req.headers['Api-Version'].include?("application/api.qrme.v#{ @version }"))
  end
end
