'use strict';

class Api {
  constructor() {
    this._routes = [];
    this._driver = {};
  }

  _add(method, name, path, routeFn) {
    this._routes.push({ method, name, path, routeFn });
    this._driver[name] = this._makeClientFn(method, path);
  }

  _makeClientFn(method, path) {
    const hasParam = /:[\w]+/.test(path);
    return async (...args) => {
      let url = path;
      let body = null;
      if (hasParam) {
        url = path.replace(/:[\w]+/, args[0]);
        body = args[1] || null;
      } else {
        body = args[0] || null;
      }
      const opts = {
        method,
        headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' }
      };
      if (body) opts.body = JSON.stringify(body);
      const res = await fetch(url, opts);
      return res.json();
    };
  }

  get(name, path, routeFn)    { this._add('GET',    name, path, routeFn); }
  post(name, path, routeFn)   { this._add('POST',   name, path, routeFn); }
  patch(name, path, routeFn)  { this._add('PATCH',  name, path, routeFn); }
  delete(name, path, routeFn) { this._add('DELETE', name, path, routeFn); }

  setupRoutes(app) {
    app.use(require('cors')());
    app.use(require('body-parser').json());
    this._routes.forEach(({ method, path, routeFn }) => {
      app[method.toLowerCase()](path, async (req, res) => {
        res.json(await routeFn(req));
      });
    });
  }

  setupDriver() {
    return this._driver;
  }
}

module.exports = { SuperDry: Api };
