class CacheService

  def initialize
    @default_ttl = 1800
  end

  # Creates a new entry in the cache
  #
  # @param session_key [String] Key that will be used in the cache to store/retrieve
  # @param session_value [String] Value that will be stored in the cache
  # @param ttl [Time] Time indicating the expiration of this cache object
  def new (session_key, session_value, ttl = @default_ttl)

  end

  # Updates a value in the cache
  #
  # @param session_key [String] Key that will be used to retrieve value
  # @param session_value [String] Value that will be updated in the cache
  def update

  end

  # Set the TTL for a cache item to a new TTL
  #
  # @param session_key [String] Key that will be used to retrieve from cache
  # @param ttl [Time] Time indicating the expiration of this cache object
  def reset

  end

  # Removes an entry from the cache
  #
  # @param session_key [String] Key that will be used in the cache to store/retrieve
  def flush

  end

  # Purges the cache
  def flush_all

  end

end