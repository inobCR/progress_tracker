module DataFetchHelper
  def flat_hash(hash, k = [])
    return {k => hash} unless hash.is_a? (Hash)
    hash.inject({}){ |h, v| h.merge! flat_hash(v[-1], k + [v[0]]) }
  end
end
