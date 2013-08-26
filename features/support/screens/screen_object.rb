module ScreenObject
  def on(object)
    return object.new(self)
  end
end

# calabash has issue with embad method.
def embed(src, mime_type, label)
end