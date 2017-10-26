module ApplicationHelper
  def is_in? instance_array, searched_instance
    # Boolean inidicating if 'searched_instance' is in 'instance_array', searching with the id
    # Used in the views like:
    # is_in?(@song_albums, an_album), to check if is the album is one of the song
    instance_array && instance_array.index { |instance| instance.id == searched_instance.id }
  end

end
