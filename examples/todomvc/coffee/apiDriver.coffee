class ApiDriver
  list: -> @request('GET', '/entries')
  create: (obj) -> @request('POST', '/entries', obj)
  delete: (id) -> @request('DELETE', "/entry/#{id}")
  patch: (id, obj) -> @request('PATCH', "/entry/#{id}", obj)

  request: (method, path, obj = null) ->
    try
      opts =
        method: method
        headers:
          'Accept': 'application/json'
          'Content-Type': 'application/json'
      opts.body = JSON.stringify obj if obj

      res = await fetch(path, opts)
      await res.json()
    catch e
      console.error e

export default new ApiDriver
