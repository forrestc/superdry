// Generated by CoffeeScript 2.0.1
var ApiDriver;

ApiDriver = (function() {
  var HOST;

  class ApiDriver {
    list() {
      return this.request('GET', '/entries');
    }

    create(obj) {
      return this.request('POST', '/entries', obj);
    }

    delete(id) {
      return this.request('DELETE', `/entry/${id}`);
    }

    patch(id, obj) {
      return this.request('PATCH', `/entry/${id}`, obj);
    }

    async request(method, path, obj = null) {
      var e, opts, res;
      try {
        opts = {
          method: method,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          }
        };
        if (obj) {
          opts.body = JSON.stringify(obj);
        }
        res = (await fetch(`${HOST}${path}`, opts));
        return (await res.json());
      } catch (error) {
        e = error;
        return console.error(e);
      }
    }

  };

  HOST = 'http://127.0.0.1:3000';

  return ApiDriver;

})();

export default new ApiDriver;
