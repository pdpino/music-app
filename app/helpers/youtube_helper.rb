module YoutubeHelper
  def yt_search_first(query)
    puts "YOUTUBE QUERYING: #{query}"
    videos = Yt::Collections::Videos.new
    videos.where(order: 'relevance', q: query).first
  end

  def yt_search_n(query, limit)
    videos = Yt::Collections::Videos.new
    videos.where(order: 'relevance', q: query).take(limit.to_i)
  end

  def yt_get_embed_url(video_id)
    # HACK: kind of a hacky way to do it
    if video_id.start_with? "https://" # Is a link
      if video_id.include? "watch" # Is a watch link
        video_id = video_id.split("=")[-1]
      elsif video_id.include? "embed"
        return video_id
      end
    end
    "https://www.youtube.com/embed/#{video_id}"
  end

  def yt_get_watch_url(video_id)
    "https://www.youtube.com/watch?v=#{video_id}"
  end

  def duration_in_minutes(duration)
    minutes, seconds = duration.divmod(60)
    "#{minutes}:#{seconds}"
  end
end
